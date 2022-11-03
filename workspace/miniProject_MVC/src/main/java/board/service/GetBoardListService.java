package board.service;

import java.text.SimpleDateFormat;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pgString = request.getParameter("pg");
		int pg = Integer.parseInt(pgString);
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardList(pg);
		
		//list --> json
		JSONObject json = new JSONObject();
		
		
		if(list!=null) {
			JSONArray array = new JSONArray();
			
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq", boardDTO.getSeq());
				temp.put("subject", boardDTO.getSubject());
				temp.put("content", boardDTO.getContent());
				temp.put("id", boardDTO.getId());
				temp.put("hit", boardDTO.getHit());
				temp.put("logtime", new SimpleDateFormat("yyyy.MM.dd").format(boardDTO.getLogtime()));
				
				array.add(temp);
			}//for
			json.put("list", array);
		}//if
		
	
		//페이징 처리
		int totalA = boardDAO.getTotalA();//총글수
		
		BoardPaging boardPaging = new BoardPaging();

		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);

		boardPaging.makePagingHTML();

		request.setAttribute("pg", pg);
		request.setAttribute("json", json);
		request.setAttribute("pagingHTML", boardPaging.getPagingHTML());
		
		return "/board/getBoardList.jsp";
	}

}
