package group3.beef.employee.model;

import group3.beef.encryption.AES_Encryption;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

public class EmployeeService {

	private EmployeeDAO_interface dao;

	public EmployeeService() {
		dao = new EmployeeDAO();
	}

	// 查全部
	public List<EmployeeVO> getAll() {
		return dao.getAll();
	}

	// 新增員工
	public EmployeeVO addEmp(String name, String pwd, String email, Blob photo,
			String education, String experience, String specialty) {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setName(name);
		employeeVO.setPwd(pwd);
		employeeVO.setEmail(email);
		employeeVO.setPhoto(photo);
		employeeVO.setEducation(education);
		employeeVO.setExperience(experience);
		employeeVO.setSpecialty(specialty);
		dao.insert(employeeVO);
		return employeeVO;

	}

	// 更新員工
	public EmployeeVO updateEmp(Integer eid, String name, String pwd,
			String email, Blob photo, String education, String experience,
			String specialty) {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEid(eid);
		employeeVO.setName(name);
		employeeVO.setPwd(pwd);
		employeeVO.setEmail(email);
		employeeVO.setPhoto(photo);
		employeeVO.setEducation(education);
		employeeVO.setExperience(experience);
		employeeVO.setSpecialty(specialty);
		dao.update(employeeVO);
		return employeeVO;

	}
	
	//查詢員工byMail
	public EmployeeVO findEmpByMail(String mail){
		return dao.findByMail(mail);
	}
	

	public void addEmp(EmployeeVO employeeVO) {
		dao.insert(employeeVO);
	}

	public EmployeeVO updateEmp(EmployeeVO employeeVO) {
		dao.update(employeeVO);
		return dao.findByPrimaryKey(employeeVO.getEid());
	}

	// 員工系統登入
	public EmployeeVO EmpLogin(String mail, String pwd) throws Exception {
		// 檢查userId與password是否正確
		AES_Encryption AES = new AES_Encryption();
		List<EmployeeVO> EmpList = dao.getAll();
		for (EmployeeVO empVO : EmpList) {
			if ((empVO.getEmail().equals(mail.trim()))
					&& (empVO.getPwd().equals(AES.getencrypt(pwd.trim())))) {
//			 System.out.println(empVO.getEmail());
//			 System.out.println(empVO.getPwd());
			 System.out.println(empVO.getName());
			 return empVO;
			}
		}
		return null;
		
	}

	// 抓一位員工的圖片
	public InputStream getOneEmployeePic(Integer eid) {
		return dao.findEmpPicByPrimaryKey(eid);

	}

	// 刪除員工
	public void deleteEmployee(Integer eid) {
		dao.delete(eid);
	}

	// 查一位
	public EmployeeVO getOneEmployee(Integer eid) {
		return dao.findByPrimaryKey(eid);
	}
	
	//用姓名查
	public EmployeeVO getOneEmployee(String name) {
		return dao.findByName(name);
	}
}
