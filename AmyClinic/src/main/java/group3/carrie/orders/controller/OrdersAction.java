package group3.carrie.orders.controller;

import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.henry.login.model.MemberVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport {

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		//確認MemberVO物件在不在Session物件裡
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			return "nomb";
		}

		// 查詢該會員的訂單，並放入request物件內
		OrdersService ordServ = new OrdersService();
		List<OrdersVO> list = ordServ.findByMid(mb.getMid());
		request.setAttribute("list", list);
		System.out.println("我來查訂單的");
		
		return SUCCESS;

	}

}
