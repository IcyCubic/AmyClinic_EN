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
 * 確認後進行重導至資料確認的頁面
 */
@WebServlet("/shopping/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null) {
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if(cart == null) {
			response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/shopping/data_confirm.jsp");
		return;
	}

}
