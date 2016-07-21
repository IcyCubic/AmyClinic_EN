package group3.beef.employee.controller;
import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;

import com.opensymphony.xwork2.ActionSupport;

public class EmpAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private EmployeeVO employeeVO;

	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	
	public String add(){
		EmployeeService empsvc = new EmployeeService();
		empsvc.addEmp(employeeVO);
		System.out.println("資料庫 insert 成功");
		return"success";
		
	}
	 
	

}
