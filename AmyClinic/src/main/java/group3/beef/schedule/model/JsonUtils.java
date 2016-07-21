package group3.beef.schedule.model;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.collections.map.HashedMap;

import com.google.gson.Gson;

import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;

public class JsonUtils {

	public String getJsonScheAll() {
		ScheduleService ss = new ScheduleService();
		List l1 = new LinkedList();
		List<ScheduleVO> list = ss.getAll();

		for (ScheduleVO scheduleVO : list) {
			//List m1 = new ArrayList();
			HashedMap m1 = new HashedMap();
			m1.put("getSch_id",scheduleVO.getSch_id());
			m1.put("Name",scheduleVO.getEmployeeVO().getName());
			m1.put("C_date",scheduleVO.getC_date());
			m1.put("C_hours",scheduleVO.getC_hours());
			m1.put("Appt_num",scheduleVO.getAppt_num());
			m1.put("Appt_status",scheduleVO.getAppt_status());
			m1.put("Memo",scheduleVO.getMemo());
			l1.add(m1);
		}
		Gson gson = new Gson();
		String str = gson.toJson(l1);
		return str;

	}
	
	
	public String getJsonScheByDayAndHour(Integer day, String c_hours) {
		ScheduleService ss = new ScheduleService();
		List l1 = new LinkedList();
		List<ScheduleVO> list = ss.getByDayAndHour(day,c_hours);

		for (ScheduleVO scheduleVO : list) {
			//List m1 = new ArrayList();
			HashedMap m1 = new HashedMap();
			m1.put("getSch_id",scheduleVO.getSch_id());
			m1.put("Name",scheduleVO.getEmployeeVO().getName());
			m1.put("C_date",scheduleVO.getC_date());
			m1.put("C_hours",scheduleVO.getC_hours());
			m1.put("Appt_num",scheduleVO.getAppt_num());
			m1.put("Appt_status",scheduleVO.getAppt_status());
			m1.put("Memo",scheduleVO.getMemo());
			l1.add(m1);
		}
		Gson gson = new Gson();
		String str = gson.toJson(l1);
		return str;

	}
	
	public String getJsonfindByDate(Date date) {
		ScheduleService ss = new ScheduleService();
		List l1 = new LinkedList();
		List<ScheduleVO> list = ss.findByDate(date);

		for (ScheduleVO scheduleVO : list) {
			//List m1 = new ArrayList();
			HashedMap m1 = new HashedMap();
			m1.put("getSch_id",scheduleVO.getSch_id());
			m1.put("Name",scheduleVO.getEmployeeVO().getName());
			m1.put("C_date",scheduleVO.getC_date());
			m1.put("C_hours",scheduleVO.getC_hours());
			m1.put("Appt_num",scheduleVO.getAppt_num());
			m1.put("Appt_status",scheduleVO.getAppt_status());
			m1.put("Memo",scheduleVO.getMemo());
			l1.add(m1);
		}
		Gson gson = new Gson();
		String str = gson.toJson(l1);
		return str;
	}
	

//	public static void main(String[] args) {
//		
//		
//	}

}
