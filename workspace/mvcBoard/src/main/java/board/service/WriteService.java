package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class WriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String id = "hong";
		String name = "홍길동";
		String email = "hong@daum.net";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject",subject);
		map.put("content",content);
		map.put("id",id);
		map.put("name",name);
		map.put("email",email);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardWrite(map);

		return "/board/boardWrite.jsp";
	}
	
}
