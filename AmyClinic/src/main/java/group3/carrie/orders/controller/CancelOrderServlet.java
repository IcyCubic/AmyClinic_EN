package group3.carrie.orders.controller;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 給使用者取消訂單(事實上是將訂單狀態改為已取消)
 * 1.更新訂單狀態
 * 2.將紅利調整回去
 * 3.將商品庫存量調回去
 */
@WebServlet("/shopping/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//確認Session在不在
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
		
		//確認MemberVO物件在不在Session物件裡
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
		
		String oidStr = request.getParameter("oid");
		Integer oid = Integer.parseInt(oidStr.trim());
		if(oidStr == null || oidStr.trim().length() == 0 || oid == 0) {
			throw new ServletException();
		}
		
		OrdersService ordServ = new OrdersService();
		OrdersVO ordersVO = ordServ.getOneOrders(oid);
		//更改訂單狀態
		ordersVO.setOstatus(3);
		//把庫存量加回去
		ProductService prodServ = new ProductService();
		Set<OrderItemsVO> orderItemsVO = ordersVO.getOrderItems();
		for (OrderItemsVO oi : orderItemsVO) {
			ProductVO prodVO = prodServ.getOneProduct(oi.getProductVO().getPid());
			prodVO.setAmount(prodVO.getAmount()+oi.getQuantity());
			prodServ.updateProduct(prodVO);
		}
		
		//把會員的紅利調回來，並寫進資料庫
		//本次訂單所花的紅利點數
		Integer reward_pts = ordersVO.getPoints_spent();
		//整數除整數會出現小數被無條件捨去的狀況，要用整數除小數再去四捨五入才正常
		Integer myNewRwd = Math.round(ordersVO.getTotal()/100.0f);
		//會員目前所擁有的紅利點數
		Integer oldPts = mb.getReward_pts();
		mb.setReward_pts(oldPts + reward_pts - myNewRwd);
		mb.setSpent_pts(mb.getSpent_pts() - reward_pts);
		MemberServices mbServ = new MemberServices();
		mbServ.update(mb);
		ordServ.updateOrders(ordersVO);
		
		return;
	}

}
