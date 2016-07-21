package group3.beef.member.controller_backstage;

import group3.carrie.app.model.AppVO;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class Mem_detail
 */
@WebServlet("/appBack/Mem_detail")
public class MemDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html");
		PrintWriter out =res.getWriter();
		int mid = Integer.parseInt(req.getParameter("mid"));
		MemberServices mSvc = new MemberServices();
		MemberVO memVO = mSvc.getOneMember(mid);
		Set<AppVO> apps = memVO.getAppVO();
		
		List<HashMap<String, String>> l1 =new ArrayList<HashMap<String, String>>();
		
		HashMap<String, String> m1 = new HashMap();
		m1.put("mid", memVO.getMid().toString());
		m1.put("name", memVO.getName());
		m1.put("name", memVO.getName());
		m1.put("email", memVO.getEmail());
		m1.put("bday", memVO.getBirthday().toString());
		m1.put("cuntry", memVO.getCountry());
		m1.put("addr", memVO.getAddr());
		m1.put("phone", memVO.getPhone());
		m1.put("height", memVO.getHeight().toString());
		m1.put("mass", memVO.getMass().toString());
		m1.put("act_satus", memVO.getAct_status().toString());
		m1.put("num_trans", memVO.getNum_trans().toString());
		m1.put("num_treatment", memVO.getNum_treatment().toString());
		m1.put("num_visits", memVO.getNum_visits().toString());
		m1.put("total_spent", memVO.getTotal_spent().toString());
		m1.put("last_visit", memVO.getLast_visit().toString());
		m1.put("join_date", memVO.getJoin_date().toString());
		l1.add(m1);
		
		for (AppVO a : apps){
			HashMap<String, String> m2=  new HashMap<String, String>();
			m2.put("aid", a.getAid().toString());
			m2.put("ename",a.getEmployeeVO().getName());
			m2.put("apt_dat",a.getApt_date().toString());
			m2.put("apt_time", a.getApt_time());
			m2.put("desc", a.getDescrip());
			l1.add(m2);

			
			
		}
		
		
		Gson gson = new Gson();
		String json = gson.toJson(l1);
		out.print(json);
		 
		 

	}

//	public static void main(String[] args) {
//		MemberServices mSvc = new MemberServices();
//		
//		MemberVO memVO = mSvc.getOneMember(1000);
//		Set<AppVO> apps = memVO.getAppVO();
//		
//		List l1 =new ArrayList();
//		for (AppVO a : apps){
//			HashMap<String, String> m1=  new HashMap<String, String>();
//			m1.put("name", a.getMemberVO().getName());
//			m1.put("aid", a.getAid().toString());
//			m1.put("des", a.getDescrip());
//			m1.put("apt_dat",a.getApt_date().toString());
//			m1.put("apt_time", a.getApt_time());
//			m1.put("desc", a.getDescrip());
//			l1.add(m1);
//			
//		}
//		
//		
//		Gson gson = new Gson();
//		String json = gson.toJson(l1);
//		System.out.println(json);
//	
//	
//	 
//	 
		 
//		Gson gson = new GsonBuilder().registerTypeAdapter(MemberVO.class,
//				new JsonSerializer<MemberVO>() {
//
//					@Override
//					public JsonElement serialize(MemberVO src, Type typeOfSrc,
//							JsonSerializationContext context) {
//						JsonObject obj = new JsonObject();
//						obj.addProperty("name", src.getAddr());
//						obj.addProperty("name", src.get);
//						return obj;
//						
//					}
//				}).create();

//
////		 String json = gson.toJson(memVO);
////		 System.out.println(json);
		 
	//}
}
