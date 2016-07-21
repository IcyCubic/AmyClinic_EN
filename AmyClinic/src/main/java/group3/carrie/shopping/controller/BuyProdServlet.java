package group3.carrie.shopping.controller;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.shopping.model.ShoppingCart;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 加入購物車
 */
@WebServlet("/shopping/BuyProdServlet")
public class BuyProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<String> errorMsgs = new LinkedList<String>();
		//取得session
		HttpSession session = request.getSession();
		
		//從session中取出ShoppingCart物件
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		
		//如果找不到就new一個新的並放入session物件中
		if(cart == null) {
			cart = new ShoppingCart();
			session.setAttribute("ShoppingCart", cart);
		}
		
		//取得請求參數並做格式轉換
		//裝到OrderItemsVO內，並放到ShoppingCart物件裡
		try {
			String idStr = request.getParameter("pid");
			Integer pid = new Integer((idStr).trim());
			String name = request.getParameter("pname");
			String priceStr = request.getParameter("price");
			Integer price_per = new Integer((priceStr).trim());
			String discountStr = request.getParameter("discount");
			Integer discount = new Integer(discountStr.trim());
			//有打折的話就以打折後的價格算
			if (discount != 0) {
				price_per = Math.round(price_per * (1 - (discount/100.0f)));
			}
			String qtyStr = request.getParameter("qty");
			Integer quantity = Integer.parseInt(qtyStr);
			OrderItemsVO oi = new OrderItemsVO(quantity, price_per, pid, name);
			try {
				cart.addToCart(pid, oi);
			} catch (Exception e) {
				throw new ServletException();
			}
		} catch (NumberFormatException e) {
			errorMsgs.add("輸入格式錯誤");
			response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
			return;
		}
		
		

//		String location = (String) session.getAttribute("location");
//		if (location != null) {
//			session.removeAttribute("location");
//			response.sendRedirect(location);
//			return;
//		} else {
//			response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
//			return;
//		}
			
	}

}
