package group3.henry.email.model;

import group3.henry.login.model.MemberDAO;
import group3.henry.login.model.MemberVO;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class VerifyService {
	static private MemberDAO dao = new MemberDAO();
	static private List<MemberVO> memberList = new ArrayList<MemberVO>();	

	public VerifyService() { // initial population of memberList
		if (memberList.isEmpty()) 
			memberList = this.getAll(); 	
	}
	
	public Boolean verify(String email, String token) {
		System.out.println("VerifyService");
		memberList = this.getAll(); // re-population of memberList; in case of changes while server is up
		for (MemberVO mb : memberList) {
			if (mb.getVerify()!=null && !mb.getVerify().isEmpty()){ //checks if token exists
				if (mb.getEmail().trim().equals(email.trim()) && mb.getVerify().trim().equals(token.trim()) ) { //verify email&token
					HttpServletRequest request = ServletActionContext.getRequest();
					HttpSession session = request.getSession();
					session.setAttribute("memberVO", mb); // sets current active user in session
					session.setAttribute("account",mb.getName());
					if (mb.getAct_status()==2) //if the account status = waiting for verification (aka not banned)
						mb.setAct_status(1); //sets account to active
					mb.setVerify(""); // removes token
					dao.update(mb); //updates DB new memberVO
					return true;
				}
			}
		}
		return false;
	}
	
	public List<MemberVO> getAll() { //fetches all member data
		List<MemberVO> list = null;
		list = dao.getAll();
		return list;
	}
	
	//testing
//	public static void main(String[] args){
//
//		VerifyService dao = new VerifyService();
//		
//		List<MemberVO> list = dao.getAll();
//		for (MemberVO aMem : list) {
//			System.out.print(aMem.getName() + ",");
//			System.out.print(aMem.getPwd());
//
//			System.out.println();
//		}
//	}
}
