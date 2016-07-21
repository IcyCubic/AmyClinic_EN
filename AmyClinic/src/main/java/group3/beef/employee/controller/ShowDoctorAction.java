package group3.beef.employee.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 顯示醫師的資料
 */
public class ShowDoctorAction extends ActionSupport {
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String execute() {
		System.out.println("我在抓醫生資料");
		HttpServletRequest request = ServletActionContext.getRequest();
		EmployeeService empServ = new EmployeeService();
		EmployeeVO empVO = empServ.getOneEmployee(id);
		
		if (empVO == null) {
			System.out.println("找不到醫生資料QQ");
			return "nodoctor";
		} else {
			System.out.println("找~到~惹！");
			request.setAttribute("empVO", empVO);
			return SUCCESS;
		}
	}
	
	
}
