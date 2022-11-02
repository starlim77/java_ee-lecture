package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("pwd",pwd);

		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.memberLogin(map);
		id = null;
		String name=null;
		String email=null;
		if(memberDTO!=null){
			id = memberDTO.getId();
			name = memberDTO.getName();
			email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
			
			HttpSession session = request.getSession();
			session.setAttribute("memId", id);
			session.setAttribute("memName", name);
			session.setAttribute("memEmail", email);
			
			return "/member/loginOk.jsp";
		}
		else {
			return "/member/loginFail.jsp";
		}
		
		
		
	}

}
