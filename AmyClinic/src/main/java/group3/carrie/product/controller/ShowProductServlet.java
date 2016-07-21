package group3.carrie.product.controller;

import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 購物系統用
 * show_prod.jsp顯示單樣產品的資料(名稱+價格+成分+描述)
 */
@WebServlet("/shopping/ShowProductServlet")
public class ShowProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<String> errorMsgs = new LinkedList<String>();
		request.setAttribute("errorMsgs", errorMsgs);
		
		try {
			String str = request.getParameter("pid");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("未輸入商品編號");
			}
			
			if (!errorMsgs.isEmpty()){
				response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
				return;
			}
			
			Integer pid = null;
			try {
				pid = new Integer(str);
			} catch (Exception e) {
				errorMsgs.add("格式錯誤");
			}
			
			if (!errorMsgs.isEmpty()) {
				response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
				return;
			}
			
			ProductService prodServ = new ProductService();
			ProductVO prodVO = prodServ.getOneProduct(pid);
			if (prodVO == null) {
				errorMsgs.add("查無資料");
			}
			
			if (!errorMsgs.isEmpty()) {
				response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
				return;
			}
			
			request.setAttribute("prodVO", prodVO);
			RequestDispatcher rd = request.getRequestDispatcher("/shopping/show_prod.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			errorMsgs.add("無法取得資料" + e.getMessage());
			response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
			return;
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
