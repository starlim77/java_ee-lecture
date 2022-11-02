package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class GetMemberService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String)request.getSession().getAttribute("memId");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.updateForm(id);
		
		//MemberDTO 객체 -> JSON 변환
		JSONObject json = new JSONObject();
		json.put("name", memberDTO.getName());
		json.put("id", memberDTO.getId());
		json.put("pwd", memberDTO.getPwd());
		json.put("gender", memberDTO.getGender());
		json.put("email1", memberDTO.getEmail1());
		json.put("email2", memberDTO.getEmail2());
		json.put("tel1", memberDTO.getTel1());
		json.put("tel2", memberDTO.getTel2());
		json.put("tel3", memberDTO.getTel3());
		json.put("zipcode", memberDTO.getZipcode());
		json.put("addr1", memberDTO.getAddr1());
		json.put("addr2", memberDTO.getAddr2());
		System.out.println(json);
		
	
		request.setAttribute("json", json);
		
		return "/member/getMember.jsp";
	}

}
