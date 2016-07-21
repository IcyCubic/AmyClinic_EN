package group3.beef.employee.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;

import com.opensymphony.xwork2.ActionSupport;

public class EmpnoAction extends ActionSupport {
	 
	private Integer eid;

	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}
	
	
	public String getOne_Emp_Update(){
		if(getOne()){
			System.out.println("getOne_Emp_Update 成功");
			return "success";
		}else{
			super.addFieldError("eid", "查無資料");
			return "input";
		}
			
	}
	
	
	public boolean getOne(){
		EmployeeService esvc = new EmployeeService();
		EmployeeVO  employeeVO = esvc.getOneEmployee(eid);
		if(employeeVO != null){
			HttpServletRequest requrst = ServletActionContext.getRequest();
			requrst.setAttribute("employeeVO", employeeVO);
			return true;
		}else
			return false;
		
		
	}
}
