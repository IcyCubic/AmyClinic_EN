package group3.carrie.orders.controller;

import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 購物系統用
 * 根據mid來查詢Order及OrderItem(OrderServlet 如果訂單的mid=session物件中的mid才顯示出來)
 * 每筆訂單底下的按鈕按下去可以查詢OrderItem，再按一次就隱藏起來(參考0801範例，之後可能用jQuery下去寫)
 */
@WebServlet("/shopping/OrdersServlet")
public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			response.sendRedirect(request.getContextPath() + "/login/login.jsp");
			return;
		}
		
		//查詢該會員的訂單，並放入request物件內
		OrdersService ordServ = new OrdersService();
		List<OrdersVO> list = ordServ.findByMid(mb.getMid());
		request.setAttribute("list", list);
		
		//準備轉交
		RequestDispatcher rd = request.getRequestDispatcher("/shopping/query_shopping.jsp");
		rd.forward(request, response);
		return;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
