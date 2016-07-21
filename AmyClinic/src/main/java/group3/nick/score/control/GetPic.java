package group3.nick.score.control;

import group3.beef.employee.model.EmployeeService;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 用在購物系統
 * 在prod_list.jsp(全部)、show_prod.jsp(單項產品)顯示產品圖片
 * 應已大致完成
 */
@WebServlet("/Score/GetPic")
public class GetPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/*");
		EmployeeService empServ = new EmployeeService();
		String no = req.getParameter("num");
		int num = Integer.parseInt(no);
		try (
				InputStream in = empServ.getOneEmployeePic(num);
				OutputStream out = res.getOutputStream();
					
				) {
			if(in != null) {
				byte[] data = new byte[8192];
				int len = 0;
				while ((len = in.read(data)) != -1) {
					out.write(data, 0, len);
				}
			}
		}
		
		
	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}

}
