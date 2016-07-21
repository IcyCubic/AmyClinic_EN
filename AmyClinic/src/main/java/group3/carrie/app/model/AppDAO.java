package group3.carrie.app.model;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.carrie.proc.model.ProcVO;
import group3.henry.login.model.MemberVO;
import hibernate.util.HibernateUtil;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class AppDAO implements AppDAO_interface {
	private static final String GET_ALL_STMT = 
			"FROM AppVO order by aid";
	private static final String GET_BY_MANY = "FROM AppVO where mid = ? and apt_date = ? and apt_time = ?";
	private static final String GET_BYMID_BF_STMT = 
			"select * from Appointments where mid = ? and apt_date < Convert(date,getdate()) order by apt_date desc";
	private static final String GET_BYMID_AF_STMT = 
			"select * from Appointments where mid = ? and apt_date >= Convert(date,getdate()) and apt_date <= Convert(date,getdate()+31) order by apt_date";
//	private static final String GET_APPDT_BYAid_STMT = 
//			"FROM AppDetailVO where aid = ? order by ad_id";
	private static final String DELETE_APP = 
			"DELETE FROM AppVO where aid = ?";
	private static final String DELETE_APPDT = 
			"DELETE FROM AppDetailVO where aid = ?";

	

	@Override
	public void insert(AppVO appVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(appVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(AppVO appVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(appVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer aid) {
//		int update_count_AppDTs = 0;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
//HQL刪除	
//			//刪預約明細
//			Query delAppDTs = session.createQuery(DELETE_APPDT);
//			delAppDTs.setParameter(0, aid);
//			update_count_AppDTs = delAppDTs.executeUpdate();
//			
//			//刪預約
//			Query delApp = session.createQuery(DELETE_APP);
//			delApp.setParameter(0, aid);
//			delApp.executeUpdate();
//			
//			session.getTransaction().commit();
//			System.out.println("刪除預約編號" + aid + "時，共有" + update_count_AppDTs + "筆明細被刪除");
			
//cascade
			AppVO appVO = (AppVO) session.get(AppVO.class, aid);
			MemberVO memberVO = (MemberVO) session.get(MemberVO.class, aid);
			memberVO.getAppVO().remove(appVO);
			session.delete(appVO);
			session.getTransaction().commit();
			
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public AppVO findByPrimaryKey(Integer aid) {
		AppVO appVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			appVO = (AppVO) session.get(AppVO.class, aid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
			
		return appVO;
	}

	@Override
	public List<AppVO> getAll() {
		List<AppVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return list;
	}
	
	@Override
	public List<AppVO> findByMid_BF(Integer mid) {
		List<AppVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session.createSQLQuery(GET_BYMID_BF_STMT);
			query.setParameter(0, mid);
			query.addEntity(AppVO.class);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return list;
	}

	@Override
	public List<AppVO> findByMid_AF(Integer mid) {
		List<AppVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session.createSQLQuery(GET_BYMID_AF_STMT);
			query.setParameter(0, mid);
			query.addEntity(AppVO.class);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return list;
	}

	
	
	@Override
	public List<AppVO> findByMid_Date_Time(Integer mid, Date apt_date, String apt_time) {
		List<AppVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_MANY);
			query.setParameter(0, mid);
			query.setParameter(1, apt_date);
			query.setParameter(2, apt_time);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list	;
	}

	@Override
	public Set<AppDetailVO> getAppDetailByAid(Integer aid) {
		Set<AppDetailVO> set = findByPrimaryKey(aid).getAppDetails();
		return set;
	}
	
	public static void main(String[] args) {
		AppDAO dao = new AppDAO();
		
		//普通新增
//		AppVO appVO1 = new AppVO();
//		MemberVO memberVO1 = new MemberVO();
//		EmployeeVO employeeVO1 = new EmployeeVO();
//		
//		memberVO1.setMid(1001);
//		appVO1.setPurpose(0);
//		try {
//		appVO1.setApt_date(new java.sql.Date(DateFormat.getDateInstance().parse("2016/06/30").getTime()));
//		} catch(ParseException e) {
//			e.printStackTrace();
//		}
//		appVO1.setApt_time("晚上");
//		appVO1.setProcedureid("整形手術");
//		appVO1.setDescrip("測試");
//		appVO1.setApt_status(1);
//		employeeVO1.setEid(3);
//		appVO1.setMemberVO(memberVO1);
//		appVO1.setEmployeeVO(employeeVO1);
//		dao.insert(appVO1);
		
		//預約主檔+預約明細新增
		AppVO appVO1 = new AppVO();
		MemberVO memberVO1 = new MemberVO();
		EmployeeVO employeeVO1 = new EmployeeVO();
		ProcVO procVO1 = new ProcVO();
		ProcVO procVO2 = new ProcVO();
		Set<AppDetailVO> set1 = new HashSet<AppDetailVO>();
		
		AppDetailVO appDT1 = new AppDetailVO();
		procVO1.setProcedure_id(1);
		appDT1.setProcVO(procVO1);
		appDT1.setAppVO(appVO1);
		
		
		AppDetailVO appDT2 = new AppDetailVO();
		procVO2.setProcedure_id(10);
		appDT2.setProcVO(procVO2);
		appDT2.setAppVO(appVO1);
		
		set1.add(appDT1);
		set1.add(appDT2);
		
		memberVO1.setMid(1001);
		appVO1.setPurpose(0);
		try {
		appVO1.setApt_date(new java.sql.Date(DateFormat.getDateInstance().parse("2016/06/30").getTime()));
		} catch(ParseException e) {
			e.printStackTrace();
		}
		appVO1.setApt_time("晚上");
//		appVO1.setProcedureid(procVO1.getProcedure_id() + "," + procVO2.getProcedure_id());
		appVO1.setDescrip("測試");
		appVO1.setApt_status(1);
		employeeVO1.setEid(3);
		appVO1.setMemberVO(memberVO1);
		appVO1.setEmployeeVO(employeeVO1);
		appVO1.setAppDetails(set1);
		dao.insert(appVO1);
		
		
		//修改
//		AppVO appVO2 = new AppVO();
//		MemberVO memberVO2 = new MemberVO();
//		EmployeeVO employeeVO2 = new EmployeeVO();
//		
//		memberVO2.setMid(1005);
//		appVO2.setPurpose(0);
//		try {
//		appVO2.setApt_date(new java.sql.Date(DateFormat.getDateInstance().parse("2016/06/30").getTime()));
//		} catch(ParseException e) {
//			e.printStackTrace();
//		}
//		appVO2.setApt_time("晚上");
//		appVO2.setProcedureid("整形手術");
//		appVO2.setDescrip("測試11");
//		appVO2.setApt_status(1);
//		employeeVO2.setEid(2);
//		appVO2.setAid(1003);
//		appVO2.setMemberVO(memberVO2);
//		appVO2.setEmployeeVO(employeeVO2);
//		dao.update(appVO2);
		
		//刪除
//		dao.delete(1002);
		
		//查單一
//		AppVO appVO3 = dao.findByPrimaryKey(1001);
//		System.out.print(appVO3.getAid() + ",");
//		System.out.print(appVO3.getMemberVO().getName() + ",");
//		System.out.print(appVO3.getPurpose() + ",");
//		System.out.print(appVO3.getApt_date() + ",");
//		System.out.print(appVO3.getApt_time() + ",");
//		System.out.print(appVO3.getProcedureid() + ",");
//		System.out.print(appVO3.getDescrip() + ",");
//		System.out.print(appVO3.getApt_status() + ",");
//		System.out.println(appVO3.getEmployeeVO().getName());
//		System.out.println("-------------------------------------");
		
		
		//查全部
//		List<AppVO> list = dao.getAll();
//		for (AppVO apps : list) {
//			System.out.print(apps.getAid() + ",");
//			System.out.print(apps.getMemberVO().getMid() + ",");
//			System.out.print(apps.getMemberVO().getName() + ",");
//			System.out.print(apps.getPurpose() + ",");
//			System.out.print(apps.getApt_date() + ",");
//			System.out.print(apps.getApt_time() + ",");
//			System.out.print(apps.getProcedureid() + ",");
//			System.out.print(apps.getDescrip() + ",");
//			System.out.print(apps.getApt_status() + ",");
//			System.out.print(apps.getEmployeeVO().getEid() + ",");
//			System.out.print(apps.getEmployeeVO().getName());
//			System.out.println();
//		}
		
		//查預約明細
		List<AppVO> list = dao.getAll();
		for (AppVO apps : list) {
			System.out.print(apps.getAid() + ",");
			System.out.print(apps.getMemberVO().getMid() + ",");
			System.out.print(apps.getMemberVO().getName() + ",");
			System.out.print(apps.getPurpose() + ",");
			System.out.print(apps.getApt_date() + ",");
			System.out.print(apps.getApt_time() + ",");
//			System.out.print(apps.getProcedureid() + ",");
			System.out.print(apps.getDescrip() + ",");
			System.out.print(apps.getApt_status() + ",");
			System.out.print(apps.getEmployeeVO().getEid() + ",");
			System.out.print(apps.getEmployeeVO().getName());
			System.out.println("\n---------------------------");
		Set<AppDetailVO> set = apps.getAppDetails();
		for(AppDetailVO appDetail : set){
			System.out.print(appDetail.getAd_id() + ",");
			System.out.print(appDetail.getProcVO().getName());
			System.out.println();
		}
		System.out.println();
		}

	}

	

}
