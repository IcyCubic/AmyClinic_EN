package group3.henry.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ResetPassAction extends ActionSupport{
	private MemberVO memberVO;
	private String tempPW;
	private String message;
	
	public MemberVO getMemberVO() {return memberVO;}
	public void setMemberVO(MemberVO memberVO) {this.memberVO = memberVO;}
	public String getTempPW() {return tempPW;}
	public void setTempPW(String tempPW) {this.tempPW = tempPW;}
	public String getMessage() {return message;}
	public void setMessage(String message) {this.message = message;}
	
	public String resetPass(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		System.out.println("RecoverAction resetPW()");
		
		String pw1 = (String)request.getAttribute("encpw"), //obtains the entered password
			   pw2 = (String)request.getAttribute("encpw2");//obtains the re-entered password
		
//		System.out.println("pw1 = " + pw1);
//		System.out.println("pw2 = " + pw2);

		if (pw1.equals(pw2)){ // if both encoded pw are equal
			MemberServices service = new MemberServices();
			this.setMemberVO((MemberVO)session.getAttribute("memberVO")); //sets current session user as active VO
			memberVO.setPwd(pw1); // sets new password
			service.update(memberVO); //updates DB with new VO
			this.setMessage("密碼更新成功！三秒後跳轉回首頁");
			return SUCCESS;
		} else {
			this.setMessage("密碼不相配！");
			return INPUT;
		}
		
		
	}
}
