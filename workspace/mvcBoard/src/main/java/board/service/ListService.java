package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;


public class ListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String pgString = request.getParameter("pg");
		
		int pg = Integer.parseInt(pgString);
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardList(pg);
		
		request.setAttribute("list",list);
		
		HttpSession session = request.getSession();
		String memId = "hong";
		session.setAttribute("memId", memId);
		//페이징 처리
		int totalA = boardDAO.getTotalA();//총글수
		
		BoardPaging boardPaging = new BoardPaging();

		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);

		boardPaging.makePagingHTML();

		request.setAttribute("pagingHTML", boardPaging.getPagingHTML());
		
		return "/board/boardList.jsp";
	}

}
