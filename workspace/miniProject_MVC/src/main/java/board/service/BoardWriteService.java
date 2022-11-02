package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String email = (String)session.getAttribute("memEmail");
		String name = (String)session.getAttribute("memName");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
				
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("content", content);
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		System.out.println(map);
		
		int su = BoardDAO.getInstance().boardWrite(map);
		
		request.setAttribute("su", su);
		
		return "/board/boardWrite.jsp";
	}
}
