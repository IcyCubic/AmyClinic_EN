package group3.henry.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import group3.henry.email.model.VerifyService;
import group3.henry.global.utility.GlobalConstants;
import group3.henry.global.utility.Mailer;
import group3.henry.global.utility.TokenGenerator;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

/*
tries to log in
forgot password
clicks recover button
redirects to recover.jsp
enters email, sends to recoverAction, recover()
Action takes email, finds it in DB
If exists, sets token
sends token to email
user clicks link w/ token
Action receives token, triggers validateToken()
Action checks token against DB
If match, redirects to new password .jsp

user enters new password, sends to Action
encryption happens, interceptor
Action sets new pw in DB
redirect user to Index.jsp

*/
public class RecoverAction extends ActionSupport implements GlobalConstants{
	private static final long serialVersionUID = 1L;
	private static final String HEADER = "AmyClinic 找回密碼";


	private MemberVO memberVO;
	private String message;	
	private String email;
	private String token;	
	private String tempPW;
		
	public MemberVO getMemberVO() {return memberVO;}
	public void setMemberVO(MemberVO memberVO) {this.memberVO = memberVO;}
	public String getMessage() {return message;}
	public void setMessage(String message) {this.message = message;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getToken() {return token;}
	public void setToken(String token) {this.token = token;}
	public String getTempPW() {return tempPW;}
	public void setTempPW(String tempPW) {this.tempPW = tempPW;}
	
	private String compose(String token, String email){ // composes a message specific for recovering password
		System.out.println("RecoverAction compose()");
		return "有人使用您的Email地址要求修改密碼！" + NL + 
				"如果這不是您，請忽略此信件。" + NL + NL + "請點連結重設您的密碼" +NL+NL+
				"http://" + SERVER + "/AmyClinic/free/recover.action?token=" + token + "&email=" + email;			
	}
	
	public String recover() { // activates when a user requests a password reset (from recover.jsp)
		//HttpServletRequest request = ServletActionContext.getRequest();
		MemberServices service = new MemberServices();
		System.out.println("RecoverAction recover()");		
		
		System.out.println(memberVO.getEmail());
		MemberVO user = service.emailExists(memberVO.getEmail()); // searches DB for a user with the entered email
		if (null != user){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			TokenGenerator gen = new TokenGenerator(); 
			Mailer m = new Mailer();
			System.out.println("vaild email, sending recovery Email");
			
			String token = gen.secureToken().toUpperCase(); //generates 250bit secure token
			user.setVerify(token);	// sets the recovery token in the designated user	
			m.send(user.getName(), user.getEmail(), HEADER, compose(token, user.getEmail())); // sends recovery mail to the user
			service.update(user); //sets token for the user with the reset request
//			session.setAttribute("memberVO", user); // sets the user as the current active session user
		}
		// Universal result message. Prevents fishing for valid email addresses
		this.setMessage("感謝您使用我們的密碼查詢服務！如果您輸入的電子郵件已登記在我們的網站，您將收到進一步指示的電子郵件！");		
		return "success";				
	}
	
	public String execute() { // triggered when user clicks reset email link (from user email)
		System.out.println("EmailVerifyAction execute method");
		VerifyService vs = new VerifyService();		
		
		if (vs.verify(email, token)){
//			this.message = "Verification success! Please enter your new password!";
//			session.setAttribute("account", memberVO.getName());     // logs user in for password reset
//			session.setAttribute("member", memberVO);
			return "resetform"; 
		} else {
			this.message = "驗證失敗，請確認您的Email並再試一次";
			return "failure";
		}				
	}
}
