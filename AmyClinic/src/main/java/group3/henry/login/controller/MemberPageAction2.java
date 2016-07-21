package group3.henry.login.controller;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class MemberPageAction2 extends ActionSupport {

	private String message;

	public String execute() {

		message = "Redirecting to MemberPageAction2 after logging in! ";

		return SUCCESS;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
