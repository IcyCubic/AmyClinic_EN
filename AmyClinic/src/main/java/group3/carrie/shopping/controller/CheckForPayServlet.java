package group3.carrie.shopping.controller;

import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.henry.login.model.MemberVO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/shopping/CheckForPayServlet")
public class CheckForPayServlet extends HttpServlet {
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
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
		
		//從上個網頁取得oid
		String oidStr = request.getParameter("oid");
		Integer oid = Integer.parseInt(oidStr.trim());
		if (oidStr == null || oidStr.trim().length() == 0 || oid <= 0) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
		
		//根據oid取出對應的ordersVO並放入request物件中
		OrdersService ordServ = new OrdersService();
		OrdersVO ordersVO = ordServ.getOneOrders(oid);
		
		//如果該筆訂單的mid跟Session當中的mid不一樣，或是訂單狀態為已付款，就導向首頁
		if (ordersVO == null || (!ordersVO.getMemberVO().getMid().equals(mb.getMid())) || ordersVO.getOstatus() != 0 || ordersVO.getPayment() != 0) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}
		request.setAttribute("ordersVO", ordersVO);
		
		//轉交到pay.jsp
		RequestDispatcher rd = request.getRequestDispatcher("/shopping/pay.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
