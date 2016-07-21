package group3.henry.email.controller;

import group3.henry.email.model.VerifyService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class EmailVerifyAction extends ActionSupport {
	private String auth; // received parameter: token
	private String email; // received parameter: email
	private String message; // message to return to the appropriate .jsp
	
	public String getAuth() {return auth;}
	public void setAuth(String auth) {this.auth = auth;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getMessage() {return message;}
	public void setMessage(String message) {this.message = message;}
	
	public String execute() {
		VerifyService vs = new VerifyService();
		System.out.println("EmailVerifyAction execute method");			
		
		if (vs.verify(email, auth)){ // if verify returns true
			this.message = "驗證成功！三秒後跳轉回首頁";
			return "success"; 
		} else {
			this.message = "驗證失敗，請確認您的email並再試一次，三秒後跳轉回首頁";
			return "failure";
		}				
	}
}


