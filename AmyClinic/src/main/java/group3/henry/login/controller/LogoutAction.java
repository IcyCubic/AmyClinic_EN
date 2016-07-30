package group3.henry.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import group3.henry.login.model.MemberVO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LogoutAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;	
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}

	public String execute() throws IOException {
		System.out.println("LogoutAction execute()");
		
		HttpSession session = request.getSession(false);
		String email = (String)request.getParameter("email");
		MemberVO current = (MemberVO)session.getAttribute("memberVO");
		
		System.out.println("LogoutAction this.email = " + email);
		System.out.println("LogoutAction current = " + current.getEmail());
		String currentEmail = current.getEmail();
		if (null==email || null==currentEmail) return INPUT;		
		if (email.equals(currentEmail)){
			if (session != null) {
			    session.invalidate();
			}
			String contextPath = request.getContextPath();			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write("[{\"success\":\"true\",\"redirect\":\"true\",\"redirectURL\":\""+contextPath+"/web/index.jsp\"}]");			
			out.flush();
			
			return null;				
		}
		else 
			return INPUT;
	}



}
