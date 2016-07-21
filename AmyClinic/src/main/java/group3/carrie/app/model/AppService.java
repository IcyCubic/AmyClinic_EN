package group3.carrie.app.model;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.henry.login.model.MemberVO;

import java.sql.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AppService {
	
	private AppDAO_interface dao;
	
	public AppService() {
		dao = new AppDAO();
	}
		
	//新增
//	public AppVO addApp(Integer mid,Integer purpose,java.sql.Date apt_date,String apt_time,String descrip,Integer eid){
//		
//		AppVO appVO = new AppVO();
//		MemberVO memberVO = new MemberVO();
//		EmployeeVO employeeVO = new EmployeeVO();
//		
//		appVO.setPurpose(purpose);
//		appVO.setApt_date(apt_date);
//		appVO.setApt_time(apt_time);
//		appVO.setProcedureid(procedureid);
//		appVO.setDescrip(descrip);
//		memberVO.setMid(mid);
//		employeeVO.setEid(eid);
//		appVO.setMemberVO(memberVO);
//		appVO.setEmployeeVO(employeeVO);
//		
//		dao.insert(appVO);
//	
//		return appVO;
//	}
	
//預約主檔+預約明細新增
	public AppVO addApp(MemberVO memberVO,Integer purpose,java.sql.Date apt_date,String apt_time,String descrip,EmployeeVO employeeVO,Set<AppDetailVO> set){
		
		AppVO appVO = new AppVO();
		Set<AppDetailVO> appVOs = new HashSet<AppDetailVO>();
		
		for(AppDetailVO a : set) {
			a.setAppVO(appVO);
			appVOs.add(a);
		}
		
		appVO.setPurpose(purpose);
		appVO.setApt_date(apt_date);
		appVO.setApt_time(apt_time);
		appVO.setDescrip(descrip);
		appVO.setMemberVO(memberVO);
		appVO.setEmployeeVO(employeeVO);
		appVO.setAppDetails(appVOs);
		
		dao.insert(appVO);
	
		return appVO;
	}
	
	
	
	//修改
	public AppVO updateApp(Integer aid,Integer mid,Integer purpose,java.sql.Date apt_date,String apt_time,String descrip,Integer eid){
		
		AppVO appVO = new AppVO();
		MemberVO memberVO = new MemberVO();
		EmployeeVO employeeVO = new EmployeeVO();
		
		appVO.setAid(aid);
		appVO.setPurpose(purpose);
		appVO.setApt_date(apt_date);
		appVO.setApt_time(apt_time);
//		appVO.setProcedureid(procedureid);
		appVO.setDescrip(descrip);
		memberVO.setMid(mid);
		employeeVO.setEid(eid);
		appVO.setMemberVO(memberVO);
		appVO.setEmployeeVO(employeeVO);
		dao.update(appVO);
		
		return dao.findByPrimaryKey(aid);
	}
	
	//整個物件丟進去修改
	public void updateApp(AppVO appVO) {
		dao.update(appVO);
	}
	
	//刪除
	public void deleteApp(Integer aid){
		dao.delete(aid);
	}
	
	//查單一
	public AppVO getOneApp(Integer aid){
		return dao.findByPrimaryKey(aid);
	}

	//查全部
	public List<AppVO> getAll(){
		return dao.getAll();
	}
	
	//依照會員編號查今天以前的歷史預約
	public List<AppVO> findByMid_BF(Integer mid){
		return dao.findByMid_BF(mid);
	}
	
	//依照會員編號查今天(含)之後的預約
	 public List<AppVO> findByMid_AF(Integer mid){
		 return dao.findByMid_AF(mid);
	 }
	
	//查預約明細
	public Set<AppDetailVO> getAppDetailByAid(Integer aid){
		return dao.getAppDetailByAid(aid);
	}
	
	//查會員有沒有預約過該時段
	public List<AppVO> findByMid_Date_Time(Integer mid, Date apt_date, String apt_time) {
		return dao.findByMid_Date_Time(mid, apt_date, apt_time);
	}

}

