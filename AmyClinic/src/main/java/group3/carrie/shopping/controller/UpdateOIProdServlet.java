package group3.carrie.shopping.controller;

import group3.carrie.shopping.model.ShoppingCart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 修改數量/刪除購物車內的商品
 */
@WebServlet("/shopping/UpdateOIProdServlet")
public class UpdateOIProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//取得session
		HttpSession session = request.getSession();
		
		if (session == null) {
			response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
			return;
		}
		
		//取得ShoppingCart物件，沒取到就回商品列表
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (cart == null) {
			response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
			return;
		}
		
		//取得請求參數並做型態轉換
		String action = request.getParameter("action");
		String idStr = request.getParameter("pid");
		Integer pid = new Integer(idStr.trim());
		
		//判斷從網頁送來的請求
		
		//更新
		if ("update".equals(action)) {
			String newQyStr = request.getParameter("newQy");
			Integer newQy = new Integer(newQyStr.trim());
			String amountStr = request.getParameter("amount");
			Integer amount = new Integer(amountStr.trim());
			String qtyStr = request.getParameter("quantity");
			Integer qty = new Integer(qtyStr.trim());
			
			//在後端再檢查一次輸入的參數有沒有錯誤
			if(newQy < 0 || newQy == 0 || newQy == qty || (amount - newQy) < 0) {
				return;
			}			
			
			cart.updateQty(pid, newQy);
			RequestDispatcher rd = request.getRequestDispatcher("/shopping/shopping_list.jsp");
			rd.forward(request, response);
			return;
			
		//刪除	
		} else if ("delete".equals(action)) {
			cart.deleteProd(pid);
			RequestDispatcher rd = request.getRequestDispatcher("/shopping/shopping_list.jsp");
			rd.forward(request, response);
			return;
		}
	}

}
