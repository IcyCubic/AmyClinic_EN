package group3.carrie.app.controller;

import group3.carrie.app.model.AppService;
import group3.carrie.app.model.AppVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 1.查詢預約/歷史預約
 * 2.取消預約，更新排班表狀態
 */
public class QueryAppAction extends ActionSupport {
	private Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String before() {
		System.out.println("查歷史預約唷");
		MemberVO mb = (MemberVO)ServletActionContext.getRequest().getSession().getAttribute("memberVO");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		AppService appServ = new AppService();
		List<AppVO> appVOs = appServ.findByMid_BF(mb.getMid());
		Gson gson = createGson();
		String str = gson.toJson(appVOs);
		System.out.println(str);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(str);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String after() {
		System.out.println("查未來的預約唷");
		MemberVO mb = (MemberVO)ServletActionContext.getRequest().getSession().getAttribute("memberVO");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		AppService appServ = new AppService();
		List<AppVO> appVOs = appServ.findByMid_AF(mb.getMid());
		Gson gson = createGson();
		String str = gson.toJson(appVOs);
		System.out.println(str);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(str);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String cancel() {
		System.out.println("取消預約囉~");
		MemberVO mb = (MemberVO)ServletActionContext.getRequest().getSession().getAttribute("memberVO");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
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
		Gson gson = createGson();
		String str = gson.toJson(appVOs);
		System.out.println(str);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(str);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public Gson createGson() {
		System.out.println("Gson好棒棒");
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
		return gson;
	}

}
