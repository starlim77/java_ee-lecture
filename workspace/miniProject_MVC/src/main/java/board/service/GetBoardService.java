package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class GetBoardService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		String seq = request.getParameter("seq");
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		//조회수
		boardDAO.plusHit(seq);
		BoardDTO boardDTO = boardDAO.getBoard(seq);
		
		//BoardDTO > JSON 변환
		JSONObject json = new JSONObject();
		json.put("subject", boardDTO.getSubject());
		json.put("seq", boardDTO.getSeq());
		json.put("id", boardDTO.getId());
		json.put("hit", boardDTO.getHit());
		json.put("content", boardDTO.getContent());
		
		//조회수
		
		
		//응답
		request.setAttribute("json", json);
		
		
		return "/board/getBoard.jsp";
	}

}
