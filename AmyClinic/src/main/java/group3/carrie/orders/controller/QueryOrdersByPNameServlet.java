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
 * 根據商品名稱來查詢明細中有該種商品的訂單
 */
@WebServlet("/shopping/QueryOrdersByPNameServlet")
public class QueryOrdersByPNameServlet extends HttpServlet {
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
		
		/*查詢訂單，轉換到另一個List後再塞到request物件中
		 * 1.根據商品名稱
		 * 2.目前會員的mid
		 */
		String name = request.getParameter("name");
		if (name.equals("")){
			response.sendRedirect(request.getContextPath() + "/shopping/OrdersServlet");
			return;
		}
		OrdersService ordServ = new OrdersService();
//		List<Object[]> list = ordServ.findByPname(name, mb.getMid());
//		List<OrdersVO> ordersVO = new ArrayList<OrdersVO>();
//		for (Object[] o : list) {
//			OrdersVO ord = (OrdersVO) o[0];
//			ordersVO.add(ord);
//		}
//		request.setAttribute("list", ordersVO);
		List<OrdersVO> list = ordServ.findByPname(name, mb.getMid());
		request.setAttribute("list", list);
		
		//準備轉交
		RequestDispatcher rd = request.getRequestDispatcher("/shopping/query_shopping_byname.jsp");
		rd.forward(request, response);
		return;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
