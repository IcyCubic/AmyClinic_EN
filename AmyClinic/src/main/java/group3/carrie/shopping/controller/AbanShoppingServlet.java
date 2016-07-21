package group3.carrie.shopping.controller;

import group3.carrie.shopping.model.ShoppingCart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 放棄購物
 */
@WebServlet("/shopping/AbanShoppingServlet")
public class AbanShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		//放棄購物
			HttpSession session = request.getSession();
			ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
			
			if (cart != null) {
				session.removeAttribute("ShoppingCart");
			}
			return;
		
	}

}
