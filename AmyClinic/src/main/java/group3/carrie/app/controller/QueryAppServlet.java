package group3.carrie.app.controller;

import group3.carrie.app.model.AppService;
import group3.carrie.app.model.AppVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;
import group3.henry.login.model.MemberVO;
import group3.nick.score.model.ScoreVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

/**
 * 1.查詢預約/歷史預約
 * 2.取消預約，更新排班表狀態
 */
@WebServlet("/app/QueryAppServlet")
public class QueryAppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
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
		
		String action = request.getParameter("action");
		
		if("before".equals(action)) {
			AppService appServ = new AppService();
			List<AppVO> appVOs = appServ.findByMid_BF(mb.getMid());
			Gson gson = new GsonBuilder().registerTypeAdapter(AppVO.class, new JsonSerializer<AppVO>() {

				@Override
				public JsonElement serialize(AppVO src, Type typeOfSrc,
						JsonSerializationContext context) {
					JsonObject o = new JsonObject();
					o.addProperty("aid", src.getAid());
					o.addProperty("purpose", src.getPurpose());
					o.addProperty("apt_date", src.getApt_date().toString());
					o.addProperty("apt_time", src.getApt_time());
					o.addProperty("apt_status", src.getApt_status());
					o.addProperty("descrip", src.getDescrip());
					o.addProperty("ename", src.getEmployeeVO().getName());				
					o.addProperty("eid", src.getEmployeeVO().getEid());
					Set<AppDetailVO> set = src.getAppDetails();
					List<String> procname = new ArrayList<String>();
					for(AppDetailVO a : set) {
						String pname = a.getProcVO().getName();
						procname.add(pname);
					}
					JsonElement jsonProc = context.serialize(procname);
					o.add("procName", jsonProc);
					return o;
				}
			
			}).create();
			String str = gson.toJson(appVOs);
			System.out.println(str);
			PrintWriter out = response.getWriter();
			out.print(str);
			
		}
		
		if("after".equals(action)) {
			AppService appServ = new AppService();
			List<AppVO> appVOs = appServ.findByMid_AF(mb.getMid());
			Gson gson = new GsonBuilder().registerTypeAdapter(AppVO.class, new JsonSerializer<AppVO>() {

				@Override
				public JsonElement serialize(AppVO src, Type typeOfSrc,
						JsonSerializationContext context) {
					JsonObject o = new JsonObject();
					o.addProperty("aid", src.getAid());
					o.addProperty("purpose", src.getPurpose());
					o.addProperty("apt_date", src.getApt_date().toString());
					o.addProperty("apt_time", src.getApt_time());
					o.addProperty("descrip", src.getDescrip());
					o.addProperty("apt_status", src.getApt_status());
					o.addProperty("ename", src.getEmployeeVO().getName());
					Set<AppDetailVO> set = src.getAppDetails();
					List<String> procname = new ArrayList<String>();
					for(AppDetailVO a : set) {
						String pname = a.getProcVO().getName();
						procname.add(pname);
					}
					JsonElement jsonProc = context.serialize(procname);
					o.add("procName", jsonProc);
					return o;
				}
			
			}).create();
			String str = gson.toJson(appVOs);
			PrintWriter out = response.getWriter();
			out.print(str);
			
		}
		
		if("cancel".equals(action)){
			String idStr = request.getParameter("id").trim();
			Integer id = Integer.parseInt(idStr);
			//更新預約狀態為已取消
			AppService appServ = new AppService();
			AppVO appVO = appServ.getOneApp(id);
			appVO.setApt_status(0);
			//取出該筆排班做調整
			ScheduleService scheServ = new ScheduleService();
			List<ScheduleVO> list = scheServ.findByDateAndHour(appVO.getApt_date(), appVO.getApt_time());
			ScheduleVO scheVO = list.get(0);
			scheVO.setAppt_num(scheVO.getAppt_num() - 1);
			if (scheVO.getAppt_num() < 3) {
				scheVO.setAppt_status(1);
			}
			scheServ.updateSchedule(scheVO);
			appServ.updateApp(appVO);
			
			//將新的查詢結果用json傳回給jsp
			List<AppVO> appVOs = appServ.findByMid_AF(mb.getMid());
			Gson gson = new GsonBuilder().registerTypeAdapter(AppVO.class, new JsonSerializer<AppVO>() {

				@Override
				public JsonElement serialize(AppVO src, Type typeOfSrc,
						JsonSerializationContext context) {
					JsonObject o = new JsonObject();
					o.addProperty("aid", src.getAid());
					o.addProperty("purpose", src.getPurpose());
					o.addProperty("apt_date", src.getApt_date().toString());
					o.addProperty("apt_time", src.getApt_time());
					o.addProperty("descrip", src.getDescrip());
					o.addProperty("apt_status", src.getApt_status());
					o.addProperty("ename", src.getEmployeeVO().getName());
					Set<AppDetailVO> set = src.getAppDetails();
					List<String> procname = new ArrayList<String>();
					for(AppDetailVO a : set) {
						String pname = a.getProcVO().getName();
						procname.add(pname);
					}
					JsonElement jsonProc = context.serialize(procname);
					o.add("procName", jsonProc);
					return o;
				}
			
			}).create();
			String str = gson.toJson(appVOs);
			PrintWriter out = response.getWriter();
			out.print(str);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
