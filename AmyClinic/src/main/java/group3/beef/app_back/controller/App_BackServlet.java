package group3.beef.app_back.controller;

import group3.carrie.app.model.AppService;
import group3.carrie.app.model.AppVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;

import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class App_BackServlet
 */
@WebServlet("/appBack/app_check")
public class App_BackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public App_BackServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("UTF-8");
		String action =req.getParameter("action");
		System.out.println(action);
				if(action.equals("appcancel")){
					System.out.println("call appcancel");
					try {
						int aid =Integer.parseInt(req.getParameter("aid"));
						AppService appSvc = new AppService();
						AppVO appVO = appSvc.getOneApp(aid);
						if(appVO.getApt_status()==0){
							System.out.println("預約已是取消狀態");
							res.sendRedirect(req.getContextPath()+"/appBack/get_all_app.jsp");
							return;
						}
						appVO.setApt_status(0); //完成取消
						
						ScheduleService scheSvc = new ScheduleService();
						java.sql.Date date= appVO.getApt_date();
						String time = appVO.getApt_time();
						System.out.println(date);
						System.out.println(time);
						List<ScheduleVO> list = scheSvc.findByDateAndHour(date, time);
						System.out.println(list.isEmpty());
						
						ScheduleVO schVO = list.get(0);
						schVO.setAppt_num(schVO.getAppt_num()-1);
						if(schVO.getAppt_num()<3){
							schVO.setAppt_status(1);
						}
						
							appSvc.updateApp(appVO);
							scheSvc.updateSchedule(schVO);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					res.sendRedirect(req.getContextPath()+"/appBack/get_all_app.jsp");
					
				}
		
		
		
		
//		System.out.println("call app_check");
//		res.setHeader("Access-Control-Allow-Origin", "*");
//		res.setHeader("content-type", "text/html;charset=UTF-8");
//		res.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
//		if(action.equals("fmid")){
//			System.out.println("呼叫fmid");
//			String sMid = req.getParameter("mid");
//			int mid = Integer.parseInt(sMid);
//		PrintWriter out = res.getWriter();
//		MemberDAO mdao = new MemberDAO();
//		MemberVO memVO = mdao.findByPrimaryKey(mid);
//		List<HashedMap> l1 = new LinkedList<HashedMap>();
//		
//		
//		HashedMap m1 = new HashedMap();
//		m1.put("mid", memVO.getMid().toString());
//		m1.put("name", memVO.getName());
//		m1.put("name", memVO.getName());
//		m1.put("email", memVO.getEmail());
//		m1.put("bday", memVO.getBirthday().toString());
//		m1.put("cuntry", memVO.getCountry());
//		m1.put("addr", memVO.getAddr());
//		m1.put("phone", memVO.getPhone());
//		m1.put("height", memVO.getHeight().toString());
//		m1.put("mass", memVO.getMass().toString());
//		m1.put("act_satus", memVO.getAct_status().toString());
//		m1.put("num_trans", memVO.getNum_trans().toString());
//		m1.put("num_treatment", memVO.getNum_treatment().toString());
//		m1.put("num_visits", memVO.getNum_visits().toString());
//		m1.put("total_spent", memVO.getTotal_spent().toString());
//		m1.put("last_visit", memVO.getLast_visit());
//		m1.put("join_date", memVO.getJoin_date());
//		l1.add(m1);
//		
//		
//		Set<AppVO> set =memVO.getAppVO();
//		List<HashedMap> l2 = new LinkedList<HashedMap>();
//		for(AppVO a : set){
//			HashedMap m2 = new HashedMap();
//			m2.put("ename", a.getEmployeeVO().getName());
//			m2.put("aid", a.getAid().toString());
//			m2.put("purpose", a.getPurpose().toString());
//			m2.put("apt_date", a.getApt_date().toString());
//			m2.put("apt_time", a.getApt_time());
//			m2.put("descrip", a.getDescrip());
//			m2.put("apt_status", a.getApt_status().toString());
//			l2.add(m2);
//		}
//		
//		
//		HashedMap m3 = new HashedMap();
//		m3.put("app", l2);
//		m3.put("mem", l1);
//		
//		
//		
//	
//		
//		Gson gson = new Gson();
//		//String str = gson.toJson(l1);
//		String str = gson.toJson(m3);
//		out.println(str);
//		}
		
		
		
		
		
//		Gson gson = new GsonBuilder().registerTypeAdapter(MemberVO.class, new JsonSerializer<MemberVO>() {
//
//			@Override
//			public JsonElement serialize(MemberVO src, Type typeOfSrc,
//					JsonSerializationContext context) {
//				JsonObject o = new JsonObject();
//				o.addProperty("mid",src.getMid());
//				o.addProperty("name",src.getName());
//				o.addProperty("email",src.getEmail());
//				Set<AppVO> set =src.getAppVO();
//				List<String> procname = new ArrayList<String>();
//				for(AppVO a : set){
//					String dec = a.getDescrip();
//					String apt_dat = a.getApt_date().toString();
//					o.addProperty("dec", dec);
//					o.addProperty("apt_dat", apt_dat);
//				}
//				JsonElement jsonProc = context.serialize(procname);
//				o.add("procName", jsonProc);
//				return o;
//			}}).create();
//		String str = gson.toJson(memVO);
//		out.print(str);
	}
	
	public static void main(String[] args) {
	 
		
		
		
//		AppService AppSvc = new AppService();
//		List<AppVO> list = AppSvc.getAll();
//		for (AppVO a :list){
//			System.out.println(a.getAid());
//			System.out.println(a.getEmployeeVO().getEid());
//			System.out.println(a.getEmployeeVO().getName());
//			
//		}
		
//		
//		MemberDAO mdao = new MemberDAO();
//		MemberVO memVO = mdao.findByPrimaryKey(1001);
//		Set<AppVO> set =memVO.getAppVO();
//		for(AppVO a : set){
//			System.out.print(a.getApt_time() + ",");
//			System.out.print(a.getApt_time() + ",");
//			System.out.print(a.getDescrip() + ",");
//			System.out.println(a.getEmployeeVO().getEid()+",");
//			
//		}
		
		
		
	}

}
