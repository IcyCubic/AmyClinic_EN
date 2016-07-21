package group3.carrie.orders.controller;

import java.util.Set;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class CancelOrderAction extends ActionSupport {
	private Integer oid;

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String execute() {
		System.out.println("我要取消訂單囉~");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		// 確認MemberVO物件在不在Session物件裡
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			return "nomb";
		}
		OrdersService ordServ = new OrdersService();
		OrdersVO ordersVO = ordServ.getOneOrders(oid);
		if (ordersVO == null) {
			return "noorder";
		}
		// 更改訂單狀態
		ordersVO.setOstatus(3);
		// 把庫存量加回去
		ProductService prodServ = new ProductService();
		Set<OrderItemsVO> orderItemsVO = ordersVO.getOrderItems();
		for (OrderItemsVO oi : orderItemsVO) {
			ProductVO prodVO = prodServ.getOneProduct(oi.getProductVO()
					.getPid());
			prodVO.setAmount(prodVO.getAmount() + oi.getQuantity());
			prodServ.updateProduct(prodVO);
		}
		
		//已付款的訂單要把紅利扣掉
		if (ordersVO.getPayment() == 1) {
			// 把會員的紅利調回來，並寫進資料庫
			// 本次訂單所花的紅利點數
			Integer reward_pts = ordersVO.getPoints_spent();
			// 整數除整數會出現小數被無條件捨去的狀況，要用整數除小數再去四捨五入才正常
			Integer myNewRwd = Math.round(ordersVO.getTotal() / 100.0f);
			// 會員目前所擁有的紅利點數
			Integer oldPts = mb.getReward_pts();
			mb.setReward_pts(oldPts + reward_pts - myNewRwd);
			mb.setSpent_pts(mb.getSpent_pts() - reward_pts);
			MemberServices mbServ = new MemberServices();
			mbServ.update(mb);
		}
		ordServ.updateOrders(ordersVO);

		return null;
	}

}
