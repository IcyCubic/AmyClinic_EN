package group3.henry.login.controller;

import java.io.IOException;
//import java.util.Map;

import java.util.Calendar;

import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;
//import org.apache.struts2.interceptor.ParameterAware;


import com.opensymphony.xwork2.ActionSupport;

import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

//public class LoginAction extends ActionSupport implements ParameterAware{
public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private MemberVO memberVO;
	private String message;
//	private Map<String, String[]> parameters;
		
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
//	public Map<String, String[]> getParameters() {
//		return parameters;
//	}
//	public void setParameters(Map<String, String[]> parameters) {
//		this.parameters = parameters;
//	}
	
	private boolean allowUser(String id, String pw) { // ID/PW verification method
		System.out.println("LoginAction AllowUser method");
		MemberServices login = new MemberServices();
		memberVO = login.validate(id, pw);
		if (memberVO!=null)
			return true;
		else
			return false;
	}

	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		MemberServices service = new MemberServices();
		System.out.println("LoginAction login method");
//		if (!allowUser(memberVO.getName(), memberVO.getPwd())) {
//		System.out.println("---------");
//		System.out.println("LoginAction request.getAttribute('encpw')" + ((Object[])(parameters.get("memberVO.pwd")))[0]);
//		System.out.println("LoginAction memberVO.getPwd()" + memberVO.getPwd());
//		System.out.println("---------");
		
		if (!allowUser(memberVO.getName(), (String)request.getAttribute("encpw"))) { // verifies ID & PW			
			this.setMessage("帳號或密碼錯誤");
			return "login";
		} else if (memberVO.getAct_status() == 2) { // if the account still needs to verify email
			this.setMessage("請至註冊時填寫的email信箱收取認證信進行帳號驗證，三秒後跳轉回首頁");
			return "verifyEmail";
		} else if (memberVO.getAct_status() == 0) { // if the account has been banned
			this.setMessage("您的帳號已被封鎖，請與客服人員聯絡");
			return "login";
		} else {
			HttpSession session = request.getSession(); // get HttpSession
			session.setAttribute("account", memberVO.getName()); // tag login in session
			session.setAttribute("memberVO", memberVO); // stores current memberVO in session
			
			java.sql.Date today = new java.sql.Date(Calendar.getInstance().getTime().getTime()); //get today's date in java.sql.Date format
			memberVO.setLast_visit(today); 
			service.update(memberVO); //updates last visited time
//			HttpServletResponse  response = ServletActionContext.getResponse(); 
//			try {
//				String location = (String) session.getAttribute("location");
//				System.out.println("location(LoginHandler)="+location);
//				response.sendRedirect(location);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
			try { // determines if there's a source page, sends user back after login if there is                  
		         String location = (String) session.getAttribute("location");
		         System.out.println("location(LoginHandler)="+location);
		         if (location != null) {
		           session.removeAttribute("location");
		           HttpServletResponse  response = ServletActionContext.getResponse(); 
		           response.sendRedirect(location);
		           return null;
		         }
		       }catch (IOException e) { e.printStackTrace();}
			
			return "success";
		}
	}
}
