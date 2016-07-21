package group3.carrie.schedule.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 根據點進去的位置來抓排班表
 */
@WebServlet("/app/QueryScheduleServlet")
public class QueryScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		//把上一個網頁選擇的星期幾和時段帶進來
		String c_hours = request.getParameter("c_hours");
		String dayStr = request.getParameter("day");
		Integer day = Integer.parseInt(dayStr.trim());
		
		//醫生姓名
		String name = request.getParameter("name");
		
		//根據星期幾和時段找到近一個月的排班
		ScheduleService scheServ = new ScheduleService();
		List<ScheduleVO> list = scheServ.getByDayAndHour(day, c_hours);
		
		//根據姓名找到對應的醫生
		EmployeeService empServ = new EmployeeService();
		EmployeeVO empVO = empServ.getOneEmployee(name);
		
		//轉交到下一個網頁
		request.setAttribute("list", list);
		request.setAttribute("day", day);
		request.setAttribute("c_hours", c_hours);
		request.setAttribute("empVO", empVO);
		RequestDispatcher rd = request.getRequestDispatcher("sel_doc.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
