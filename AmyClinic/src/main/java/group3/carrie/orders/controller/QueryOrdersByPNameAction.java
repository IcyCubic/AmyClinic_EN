package group3.carrie.orders.controller;

import java.util.List;

import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.henry.login.model.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class QueryOrdersByPNameAction extends ActionSupport {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		//確認MemberVO物件在不在Session物件裡
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			return "nomb";
		}
		/*查詢訂單，塞到request物件中
		 * 1.根據商品名稱
		 * 2.目前會員的mid
		 */
		String name = request.getParameter("name");
		if (name.equals("")){
			System.out.println("沒輸入名字唷");
			return "noname";
		}
		OrdersService ordServ = new OrdersService();
		List<OrdersVO> list = ordServ.findByPname(name, mb.getMid());
		request.setAttribute("list", list);
		System.out.println("我來用名字查訂單的");
		
		return SUCCESS;
	}

}
