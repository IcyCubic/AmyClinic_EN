package group3.carrie.schedule.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 根據點進去的位置來抓排班表
 */
public class QueryScheduleAction extends ActionSupport {
	private String c_hours;
	private Integer day;
	private String name;
	
	public String getC_hours() {
		return c_hours;
	}
	public void setC_hours(String c_hours) {
		this.c_hours = c_hours;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String execute() {
		System.out.println("查詢排班中...");
		HttpServletRequest request = ServletActionContext.getRequest();
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
		return SUCCESS;
	}

}
