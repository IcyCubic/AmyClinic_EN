package group3.k.SalesToProd.model;

import hibernate.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class SalesToProdDAO implements SalesToProdDAO_interface {
	 								
private static final String GET_By_HOTPROD=  " FROM SalesToProdVO  ORDER BY quantity DESC";
	//依輸入年查詢	0=年限
private static final String GET_By_HOTPROD_YEAR= "FROM SalesToProdVO  where years = ?";
//private static final String GET_By_HOTPROD= "select top 5 (sum(OrderItems.quantity)) as quantity , Products.name as name from OrderItems  inner join Products on OrderItems.pid = Products.pid group by Products.name ORDER BY quantity DESC";
/*依類別id排序*/
@Override
	public List<SalesToProdVO> getAll() {
		List<SalesToProdVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_By_HOTPROD);
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
	public List<SalesToProdVO> findByYear(Integer years) {
		List<SalesToProdVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_By_HOTPROD_YEAR);
			query.setParameter(0,years);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}return list;
	}
	
	public static void main(String[ ] args) {
		SalesToProdDAO dao = new SalesToProdDAO();
		//查全部
		List<SalesToProdVO> list = dao.getAll();
		for(SalesToProdVO salesToProdVO : list) {
			System.out.print(salesToProdVO.getQuantity()+",");
			System.out.print(salesToProdVO.getName()+",");
			System.out.print(salesToProdVO.getId()+",");
			System.out.print(salesToProdVO.getYears()+",");
			System.out.print(salesToProdVO.getPid());
			System.out.println(" ");
		}
		System.out.println("--------------------------------------- ");
		//依年查詢
		List<SalesToProdVO> list2 = dao.findByYear(2015);
		for(SalesToProdVO salesToProdVO : list2) {
			System.out.print(salesToProdVO.getQuantity()+",");
			System.out.print(salesToProdVO.getName()+",");
			System.out.print(salesToProdVO.getId()+",");
			System.out.print(salesToProdVO.getYears()+",");
			System.out.print(salesToProdVO.getPid());
			System.out.println(" ");
		}
		System.out.println("--------------------------------------- ");
		//依年查詢
				List<SalesToProdVO> list3 = dao.findByYear(2016);
				for(SalesToProdVO salesToProdVO : list3) {
					System.out.print(salesToProdVO.getQuantity()+",");
					System.out.print(salesToProdVO.getName()+",");
					System.out.print(salesToProdVO.getId()+",");
					System.out.print(salesToProdVO.getYears()+",");
					System.out.print(salesToProdVO.getPid());
					System.out.println(" ");
				}
	}//main
}