package group3.carrie.schedule.controller;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/schedule/AddScheduleServlet")
public class AddScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddScheduleServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if (action.equals("addsch")) {
			System.out.println("call addsch");
			HashMap<String, String> errorMsg = new HashMap<String, String>();
			req.setAttribute("errorMsg", errorMsg);
			// req.setAttribute("errorMsg", errorMsg);
			String eid = req.getParameter("eid");
			int seid = Integer.parseInt(eid);

			String date = req.getParameter("c_date");
			System.out.println("date:" + date);
			if (date == null || date.trim().length() == 0) {
				System.out.println("date null!!");
				errorMsg.put("date", "請選擇日期");
			}
			if (!date.matches("\\d{4}-\\d{2}-\\d{2}")) {
				errorMsg.put("date", "日期格式錯誤");
			}

			String c_hours = req.getParameter("c_hours");
			String vac = req.getParameter("vac");

			// System.out.println("休假chk：" + vac);
			String memo = req.getParameter("memo");
			if (memo == null || memo.trim().length() == 0) {
				errorMsg.put("memo", "memo請勿空白");
			}

			if (!errorMsg.isEmpty()) {
				HashMap<String, String> retunData = new HashMap<String, String>();
				retunData.put("eid", eid);
				retunData.put("date", date);
				retunData.put("c_hours", c_hours);
				retunData.put("appt_status", vac);
				req.setAttribute("retunData", retunData);

				// req.setAttribute("schVO", schVO);
				RequestDispatcher rd = req
						.getRequestDispatcher("/schedule/main_datatable.jsp");
				rd.forward(req, res);
				return;
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = null;
			try {
				parsed = sdf.parse(date);
				System.out.println("parsed" + parsed);
			} catch (Exception e) {
				e.printStackTrace();
			}
			java.sql.Date c_date = new java.sql.Date(parsed.getTime()); // 將日期轉換成sqlDate
			System.out.println("c_date" + c_date);

			Integer appt_status = null; // 判斷是否休假
			System.out.println("vac=" + vac);

			if (vac == null) {
				appt_status = 1;
			} else {
				appt_status = 0;
			}

			System.out.println(appt_status);
			int appt_num = 0; // 預設預約人數都0人;

			// ===================================================================
			ScheduleService ss = new ScheduleService();
			ss.addSchedule(seid, c_date, c_hours, appt_num, appt_status, memo);
			System.out.println("新增成功");
			RequestDispatcher rd = req
					.getRequestDispatcher("/schedule/main_datatable.jsp");
			rd.forward(req, res);

		}

		if (action.equals("updatesch")) {
			System.out.println("call updatesch");
			int sch_id = Integer.parseInt(req.getParameter("sch_id"));
			int eid = Integer.parseInt(req.getParameter("eid"));
			String date = req.getParameter("c_date");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date parsed = null;
			try {
				parsed = sdf.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			java.sql.Date c_date = new java.sql.Date(parsed.getTime());

			String c_hours = req.getParameter("c_hours");
			String vac = req.getParameter("vac");
			int appt_status = 0;
			if (vac == null) {
				appt_status = 1;
			} else {
				appt_status = 0;
			}
			String memo = req.getParameter("memo");

			ScheduleVO schVO = new ScheduleVO();
			EmployeeVO empVO = new EmployeeVO();

			schVO.setSch_id(sch_id);
			schVO.setC_date(c_date);
			schVO.setC_hours(c_hours);
			schVO.setAppt_num(0);
			schVO.setAppt_status(appt_status);
			schVO.setMemo(memo);
			empVO.setEid(eid);
			schVO.setEmployeeVO(empVO);

			ScheduleService sSvc = new ScheduleService();
			sSvc.updateSchedule(schVO);
			System.out.println("更新成功");
			RequestDispatcher rd = req
					.getRequestDispatcher("/schedule/main_datatable.jsp");
			rd.forward(req, res);
			

		}

	}

}
