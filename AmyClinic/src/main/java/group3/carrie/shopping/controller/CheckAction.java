package group3.carrie.shopping.controller;

import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.carrie.shopping.model.ShoppingCart;
import group3.henry.login.model.MemberVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 1.確認後進行重導至資料確認的頁面
 * 2.確認後轉交至付款頁面
 */
public class CheckAction extends ActionSupport {
	private Integer oid;
	
	
	
	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String checkfordataconfirm() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if(cart == null) {
			return "nocart";
		}
		System.out.println("準備進到資料確認頁面");
		return SUCCESS;
		
	}
	
	public String checkforpay() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			return "nomb";
		}
		System.out.println("Reward_pts=" + mb.getReward_pts());
		//根據oid取出對應的ordersVO並放入request物件中
		OrdersService ordServ = new OrdersService();
		OrdersVO ordersVO = ordServ.getOneOrders(oid);
		
		//如果該筆訂單的mid跟Session當中的mid不一樣，或是訂單狀態為已付款，就導向首頁
		if (ordersVO == null || (!ordersVO.getMemberVO().getMid().equals(mb.getMid())) || ordersVO.getOstatus() != 0 || ordersVO.getPayment() != 0) {
			return "cantpay";
		}
		request.setAttribute("ordersVO", ordersVO);
		System.out.println("準備付款");
		return SUCCESS;
	}
	

}
