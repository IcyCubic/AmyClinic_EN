package group3.carrie.app.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.carrie.app.model.AppService;
import group3.carrie.app.model.AppVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.carrie.proc.model.ProcService;
import group3.carrie.proc.model.ProcVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;
import group3.henry.global.utility.Mailer;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 將資料送到後端
 */
@WebServlet("/app/AddAppServlet")
public class AddAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String HEADER = "AmyClinic 預約完成通知信";

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errorMsgs = new HashMap<String, String>();
		request.setAttribute("error", errorMsgs);
		request.setCharacterEncoding("UTF-8");
		String st = null;
		// 把Session物件、Member物件取出
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}

		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		}

		// 取出各個請求參數+轉型
		try {
			Set<AppDetailVO> set = new HashSet<AppDetailVO>();
			// 目的
			String purposeStr = request.getParameter("purpose").trim();
			if (purposeStr == null || purposeStr.length() == 0) {
				errorMsgs.put("purposeErr","未選擇目的");
			}
			Integer purpose = Integer.parseInt(purposeStr);


			// 日期、時段
			String date_time = request.getParameter("s_app_time");
			Date date = null;
			String time = null;
//			try {
				if (date_time == null || date_time.trim().length() == 0) {
					errorMsgs.put("date_timeErr","請選擇預約時間");
				} else {
					String dateStr = date_time.substring(0, date_time.indexOf("　"));
					date = Date.valueOf(dateStr);
					time = date_time.substring(date_time.lastIndexOf("　") + 1);
				}
				
//			} catch (Exception e) {
//				RequestDispatcher rd = request.getRequestDispatcher("/app/add_app.jsp");
//				rd.forward(request, response);
//				return;
//			}
			
			// 療程，取出後塞到AppDetailVO的Set內

			if (purpose == 0) {
				String[] procs = request.getParameterValues("proc");
				if(procs == null) {
					errorMsgs.put("procsErr","請選擇療程");
//					RequestDispatcher rd = request.getRequestDispatcher("/app/add_app.jsp");
//					rd.forward(request, response);
//					return;
				}
//				try {
					if (procs.length == 0) {
						errorMsgs.put("procsErr","請選擇療程");
//						RequestDispatcher rd = request.getRequestDispatcher("/app/add_app.jsp");
//						rd.forward(request, response);
//						return;
					}
					StringBuffer sb = new StringBuffer();
					for (int i = 0; i < procs.length; i++) {
						if (i != procs.length-1) {
							sb.append(procs[i] + ",");
						} else if (i == procs.length-1) {
							sb.append(procs[i]);
						}
					}
					st = sb.toString();
					List<Integer> procVal = new ArrayList<Integer>();
					for (String p : procs) {
						Integer id = Integer.parseInt(p);
						procVal.add(id);
					}
					ProcService procServ = new ProcService();
					for (Integer i : procVal) {
						ProcVO procVO = procServ.getOneProc(i);
						AppDetailVO appdtVO = new AppDetailVO(procVO);
						set.add(appdtVO);
					}
//				} catch (Exception e) {
//					e.printStackTrace();
//					request.setAttribute("procs", procs);
////					errorMsgs.add("未正確操作");
//					RequestDispatcher rd = request.getRequestDispatcher("/app/add_app.jsp");
//					rd.forward(request, response);
//					return;
//				}

			}

			// 需求描述
			String descrip = request.getParameter("descrip");

			// 醫生姓名
			String ename = request.getParameter("ename").trim();
			if (ename == null || ename.length() == 0) {
				errorMsgs.put("enameErr","醫生姓名空白");
			}
			
			//排班表PK
			String idStr = request.getParameter("id").trim();
			if (idStr == null || idStr.length() == 0) {
				errorMsgs.put("idErr","查無此時間");
			}
			Integer id = Integer.parseInt(idStr);
			
			if (!errorMsgs.isEmpty()) {
				request.setAttribute("date_time", date_time);
				request.setAttribute("descrip", descrip);
				request.setAttribute("id", id);
				System.out.println("03");
				RequestDispatcher rd = request.getRequestDispatcher("/app/add_app.jsp");
				rd.forward(request, response);
				return;
			}
			// 更改排班表的狀態
			ScheduleService scheServ = new ScheduleService();
			ScheduleVO scheVO = scheServ.findByPrimaryKey(id);
			Integer appt_num = scheVO.getAppt_num();
			// 如果有別人先讓預約數滿了，就回到預約頁面
			if (appt_num >= 3) {
				request.setAttribute("descrip", descrip);
				request.setAttribute("id", id);
				errorMsgs.put("apptErr","預約人數已滿");
				RequestDispatcher rd = request.getRequestDispatcher("/app/add_app.jsp");
				rd.forward(request, response);
				return;
			}
			scheVO.setAppt_num(scheVO.getAppt_num() + 1);
			// 如果預約人數滿了，就將預約狀態改為不可預約
			if (scheVO.getAppt_num() >= 3) {
				scheVO.setAppt_status(0);
			}
			scheServ.updateSchedule(scheVO);
			
			EmployeeService empServ = new EmployeeService();
			EmployeeVO empVO = empServ.getOneEmployee(ename);

			// 全部塞進AppVO內
			AppService appServ = new AppService();
			AppVO appVO = appServ.addApp(mb, purpose, date, time, descrip,
					empVO, set);
			

			
			// 寄出通知信給使用者
			Mailer m = new Mailer();
			String msg = msgForEmail(mb, empVO, date_time, appVO);
			m.send(mb.getName(), mb.getEmail(), HEADER, msg, "HTML");
			
			// 準備轉交
			request.setAttribute("date_time", date_time);
			request.setAttribute("appVO", appVO);
			request.setAttribute("empVO", empVO);
			RequestDispatcher rd = request.getRequestDispatcher("/app/fin_app.jsp");
			rd.forward(request, response);
			return;

			

		} catch (Exception e) {
//			errorMsgs.add("操作錯誤");
			RequestDispatcher rd = request.getRequestDispatcher("/app/add_app.jsp");
			request.setAttribute("proc",st);
			rd.forward(request, response);
			return;
			

		}

	}
	
	protected String msgForEmail(MemberVO mb,EmployeeVO empVO,String date_time,AppVO appVO) {
		String msg = "";
		StringBuffer msgBuffer = new StringBuffer();
		msgBuffer.append("<br>感謝您使用愛美診所的線上預約看診功能，您的預約已完成<br><br>");
		msgBuffer.append("姓名：" + mb.getName() + "<br>");
		msgBuffer.append("電話：" + mb.getPhone() + "<br>");
		msgBuffer.append("E-mail：" + mb.getEmail() + "<br>");
		if (appVO.getPurpose() == 0) {
			msgBuffer.append("預約目的：開始新療程<br>");
			msgBuffer.append("你所選擇的療程：");
			Set<AppDetailVO> appDetails = appVO.getAppDetails();
			AppDetailVO[] appDetailArray = (AppDetailVO[])appDetails.toArray(new AppDetailVO[0]);
			for(int i = 0; i < appDetailArray.length; i++ ) {
				if (i != appDetailArray.length - 1) {
					msgBuffer.append(appDetailArray[i].getProcVO().getName() + "、");
				} else if (i == appDetailArray.length - 1) {
					msgBuffer.append(appDetailArray[i].getProcVO().getName() + "<br>");
				}
				
			}
		} else if (appVO.getPurpose() == 1) {
			msgBuffer.append("預約目的：回診<br>");
		}
		if (!appVO.getDescrip().equals("")) {
			msgBuffer.append("預約描述：" + appVO.getDescrip() + "<br>");
		}
		msgBuffer.append("預約時間：" + date_time + "<br>");
		msgBuffer.append("醫師：" + empVO.getName() + "<br>");
		
		msg = msgBuffer.toString();
		return msg;
		
	}

}
