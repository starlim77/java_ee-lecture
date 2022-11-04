package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class PlusHitService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String seq = request.getParameter("seq");
		
		BoardDAO.getInstance().plusHit(seq);
		
		
		return "/board/plusHit.jsp";
	}

}
