package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardViewService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pg = request.getParameter("pg");
		String seq = request.getParameter("seq");
		
		request.setAttribute("pg", pg);
		request.setAttribute("seq", seq);
		
		request.setAttribute("display", "/board/boardView.jsp");
		return "/index.jsp";
	}

}
