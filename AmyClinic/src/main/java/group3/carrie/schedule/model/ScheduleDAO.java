package group3.carrie.schedule.model;

import group3.beef.employee.model.EmployeeVO;
import hibernate.util.HibernateUtil;

import java.sql.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class ScheduleDAO implements ScheduleDAO_interface {

	
	private static final String GET_ALL_STMT =
		      "FROM ScheduleVO order by sch_id";
	private static final String GET_ByDayAndHour_STMT =
			"select * from Schedule where DatePart(weekday , c_date) = ? and c_hours = ? and c_date between GETDATE() and GETDATE()+30";
	private static final String GET_ByDateAndHour_STMT =
		      "FROM ScheduleVO where c_date = ? and c_hours = ?";
	private static final String GET_ByDater_STMT =
		      "FROM ScheduleVO where c_date = ?";
	private static final String DELETE =
		      "DELETE FROM ScheduleVO where sch_id = ?";

	@Override
	public void insert(ScheduleVO scheduleVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scheduleVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}
		
	

	@Override
	public void update(ScheduleVO scheduleVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scheduleVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer sch_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(DELETE);
			query.setParameter(0, sch_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public ScheduleVO findByPrimaryKey(Integer sch_id) {
		ScheduleVO scheduleVO = null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			scheduleVO = (ScheduleVO) session.get(ScheduleVO.class, sch_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return scheduleVO;
	}
	

	@Override
	public List<ScheduleVO> findByDateAndHour(Date date, String c_hours) {
		List<ScheduleVO> list = null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ByDateAndHour_STMT);
			query.setParameter(0, date);
			query.setParameter(1, c_hours);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list	;
	}
	
	@Override
	public List<ScheduleVO> findByDate(Date date) {
		List<ScheduleVO> list = null;
		ScheduleVO scheduleVO = null;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ByDater_STMT);
			query.setParameter(0, date);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list	;
	}



	@Override
	public List<ScheduleVO> getAll() {
		List<ScheduleVO> list = null;
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
	public List<ScheduleVO> getByDayAndHour(Integer day, String c_hours) {
		List<ScheduleVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session.createSQLQuery(GET_ByDayAndHour_STMT);
			query.setParameter(0, day);
			query.setParameter(1, c_hours);
			//用原生SQL語法抓回來的東西是Object型別，需要加下列方法來轉回原型
			query.addEntity(ScheduleVO.class);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
		return list;
	}



	public static void main(String[] args) {
		ScheduleDAO dao = new ScheduleDAO();
		EmployeeVO empVO = new EmployeeVO();
		
		//新增
//		ScheduleVO scheduleVO1 = new ScheduleVO();
//		empVO.setEid(2);
//		scheduleVO1.setEmployeeVO(empVO);
//		scheduleVO1.setC_date(java.sql.Date.valueOf("2016-06-28"));
//		scheduleVO1.setC_hours("早診");
//		scheduleVO1.setAppt_num(1);
//		scheduleVO1.setAppt_status(1);
//		scheduleVO1.setMemo("");
//		dao.insert(scheduleVO1);
		
		//修改
//		ScheduleVO scheduleVO2 = new ScheduleVO();
//		scheduleVO2.setSch_id(1004);
//		empVO.setEid(2);
//		scheduleVO2.setEmployeeVO(empVO);
//		scheduleVO2.setC_date(java.sql.Date.valueOf("2016-06-30"));
//		scheduleVO2.setC_hours("晚診");
//		scheduleVO2.setAppt_num(3);
//		scheduleVO2.setAppt_status(0);
//		scheduleVO2.setMemo("");
//		dao.update(scheduleVO2);
		
		//刪除
//		dao.delete(1004);
		
		//查單一
//		ScheduleVO scheduleVO3 = dao.findByPrimaryKey(1001);
//		System.out.print(scheduleVO3.getSch_id()+",");
//		System.out.print(scheduleVO3.getEmployeeVO().getName()+",");
//		System.out.print(scheduleVO3.getC_date()+",");
//		System.out.print(scheduleVO3.getC_hours()+",");
//		System.out.print(scheduleVO3.getAppt_num()+",");
//		System.out.print(scheduleVO3.getAppt_status()+",");
//		System.out.print(scheduleVO3.getMemo());
		
		//用日期和時段查
		List<ScheduleVO> list = dao.findByDateAndHour(Date.valueOf("2016-06-04"), "早診");
		for(ScheduleVO scheduleVO6 : list) {
			System.out.print(scheduleVO6.getSch_id()+",");
			System.out.print(scheduleVO6.getEmployeeVO().getName()+",");
			System.out.print(scheduleVO6.getC_date()+",");
			System.out.print(scheduleVO6.getC_hours()+",");
			System.out.print(scheduleVO6.getAppt_num()+",");
			System.out.print(scheduleVO6.getAppt_status()+",");
			System.out.print(scheduleVO6.getMemo());
			System.out.println("");
		}
		
		//查全部
//		List<ScheduleVO> list = dao.getAll();
//		for(ScheduleVO scheduleVO4 : list) {
//			System.out.print(scheduleVO4.getSch_id()+",");
//			System.out.print(scheduleVO4.getEmployeeVO().getName()+",");
//			System.out.print(scheduleVO4.getC_date()+",");
//			System.out.print(scheduleVO4.getC_hours()+",");
//			System.out.print(scheduleVO4.getAppt_num()+",");
//			System.out.print(scheduleVO4.getAppt_status()+",");
//			System.out.print(scheduleVO4.getMemo());
//			System.out.println("");
//		}
		
		//依時段查詢
//		List<ScheduleVO> list = dao.getByDayAndHour(2, "早診");
//		for(ScheduleVO scheduleVO5 : list) {
//			System.out.print(scheduleVO5.getSch_id()+",");
//			System.out.print(scheduleVO5.getEmployeeVO().getName()+",");
//			System.out.print(scheduleVO5.getC_date()+",");
//			System.out.print(scheduleVO5.getC_hours()+",");
//			System.out.print(scheduleVO5.getAppt_num()+",");
//			System.out.print(scheduleVO5.getAppt_status()+",");
//			System.out.print(scheduleVO5.getMemo());
//			System.out.println("");
//		}
	}

}
