package group3.k.chart.model;

import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class SpaToSalesDAO implements SpaToSalesDAO_interface {
	//取全部依類別	ID   							FROM ScheduleVO order by sch_id		
//	private static final String GET_ALL=  "select year ,month, name,pType_id,counts from SpaToSales  group by pType_id,year,month, name,counts order by pType_id";
//	private static final String GET_ALL="select * from SpaToSales";
private static final String GET_ALL=  "FROM SpaToSalesVO  order by pType_id";
	//依輸入年查詢	0=年限
//	private static final String GET_By_YEAR="select year ,month, name,pType_id,counts from SpaToSales where year = ?  group by pType_id,year,month, name,counts";
private static final String GET_By_YEAR= "FROM SpaToSalesVO  where year = ?";

private static final String GET_By_HOTPROD= "select top 5 (sum(OrderItems.quantity)) as quantity , Products.name as name from OrderItems  inner join Products on OrderItems.pid = Products.pid group by Products.name ORDER BY quantity DESC";
/*依類別id排序*/
@Override
	public List<SpaToSalesVO> getAll() {
		List<SpaToSalesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		SessionFactory sessionFactory = null;
//		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL);
			// 建立 SQLQuery
//			SQLQuery query = session.createSQLQuery(GET_ALL);
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			session.getTransaction().rollback();
			throw ex;
		}return list;
	}
	
	/*依年限查詢*/
	@Override
	public List<SpaToSalesVO> findByYear(Integer year) {
		List<SpaToSalesVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_By_YEAR);
			query.setParameter(0,year);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}return list;
	}
	
	
	
	public static void main(String[ ] args) {
		SpaToSalesDAO dao = new SpaToSalesDAO();
		//查全部
		List<SpaToSalesVO> list = dao.getAll();
		for(SpaToSalesVO spaToSalesVO : list) {
			System.out.print(spaToSalesVO.getYear()+",");
			System.out.print(spaToSalesVO.getMonth()+",");
			System.out.print(spaToSalesVO.getName()+",");
			System.out.print(spaToSalesVO.getpType_id()+",");
			System.out.print(spaToSalesVO.getCounts());
			System.out.println(" ");
		}
		System.out.println("--------------------------------------- ");
		//依年查詢
		List<SpaToSalesVO> list2 = dao.findByYear(2016);
		for(SpaToSalesVO spaToSalesVO : list2) {
			System.out.print(spaToSalesVO.getYear()+",");
			System.out.print(spaToSalesVO.getMonth()+",");
			System.out.print(spaToSalesVO.getName()+",");
			System.out.print(spaToSalesVO.getpType_id()+",");
			System.out.print(spaToSalesVO.getCounts());
			System.out.println(" ");
		}
	}//main
}