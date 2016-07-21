package group3.beef.employee.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 顯示醫師的資料
 */
@WebServlet("/app/ShowDoctorServlet")
public class ShowDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		try {
			String idStr = request.getParameter("id").trim();
			if (idStr == null || idStr.length() == 0) {
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				return;
			}
			//用id去資料庫撈醫生的資料
			Integer id = Integer.parseInt(idStr);
			EmployeeService empServ = new EmployeeService();
			EmployeeVO empVO = empServ.getOneEmployee(id);
			
			if (empVO == null) {
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				return;
			}
			
			//轉交
			request.setAttribute("empVO", empVO);
			RequestDispatcher rd = request.getRequestDispatcher("/doctor/querydoctor.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;

		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
