package group3.henry.login.controller;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PublicPageAction extends ActionSupport {

	public static final String MESSAGE = "HelloWorld.message.key";

	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String execute() throws Exception {
		setMessage(getText(MESSAGE));
		return SUCCESS;
	}
}
