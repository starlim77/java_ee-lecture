package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String pgString = request.getParameter("pg");
		int pg = Integer.parseInt(pgString);
		
		request.setAttribute("pg", pg);
		request.setAttribute("display" ,"/board/boardList.jsp");
		
		return "/index.jsp";
	
	}

}
