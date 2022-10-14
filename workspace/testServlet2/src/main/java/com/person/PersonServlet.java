package com.person;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonServlet
 */
@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<style>");
		out.print("li{color:"+color+";}");
		out.print("</style>");
		out.print("<body>");
		out.println("<li>이름 : "+name+"</li><br>");
		out.println("<li>성별 : "+gender+"</li><br>");
		out.println("<li>색깔 : "+color+"</li><br>");
		out.println("<li>취미 : ");
		for(int i=0; i<hobby.length; i++) out.print(hobby[i]+"&emsp;");  // "&nbsp;" 띄어쓰기 "&emsp;" 탭
		out.println("</li><br>");
		out.println("<li>과목 : ");
		for(int i=0; i<subject.length; i++) out.print(subject[i]+"&emsp;");
		out.println("</li><br>");
		out.print("</body>");
		out.print("</html>");
		
	}

	@Override
	public void destroy() {
	}

}
