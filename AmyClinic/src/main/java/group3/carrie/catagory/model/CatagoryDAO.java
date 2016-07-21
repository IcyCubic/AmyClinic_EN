package group3.carrie.catagory.model;

import group3.carrie.product.model.ProductVO;
import hibernate.util.HibernateUtil;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

public class CatagoryDAO implements CatagoryDAO_interface {
	private static final String GET_ALL_STMT =
		      "FROM CatagoryVO order by cid";
	private static final String DELETE_OdIt_STMT =
			"DELETE FROM OrderItemsVO where pid = (SELECT pid FROM ProductVO where cid = ?)";
	private static final String DELETE_Prod_STMT =
			"DELETE FROM ProductVO where cid = ?";
	private static final String DELETE_Cata_STMT =
			"DELETE FROM CatagoryVO where cid = ?";
	
	@Override
	public void insert(CatagoryVO catagoryVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(catagoryVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(CatagoryVO catagoryVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(catagoryVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer cid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int update_count1 = 0;
		int update_count2 = 0;
		
		try {
			session.beginTransaction();
			//先刪訂單明細
			Query query1 = session.createQuery(DELETE_OdIt_STMT);
			query1.setParameter(0, cid);
			update_count1 = query1.executeUpdate();
			
			//再刪產品
			Query query2 = session.createQuery(DELETE_Prod_STMT);
			query2.setParameter(0, cid);
			update_count2 = query2.executeUpdate();
			
			//再刪分類
			Query query3 = session.createQuery(DELETE_Cata_STMT);
			query3.setParameter(0, cid);
			query3.executeUpdate();
			
			session.getTransaction().commit();
			System.out.println("刪除產品分類編號" + cid +"時，共有" + update_count2 + "種產品被刪除，" + update_count1 + "筆訂單明細被刪除");
			
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public CatagoryVO findByPrimaryKey(Integer cid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		CatagoryVO catagoryVO = null;
		try {
			session.beginTransaction();
			catagoryVO = (CatagoryVO) session.get(CatagoryVO.class, cid);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return catagoryVO;
	}

	@Override
	public List<CatagoryVO> getAll() {
		List<CatagoryVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public Set<ProductVO> getProductByCid(Integer cid) {
		Set<ProductVO> set = findByPrimaryKey(cid).getProducts();
		return set;
	}
	
	public static void main(String[] args) {
		CatagoryDAO dao = new CatagoryDAO();
		
		//新增
//		CatagoryVO catagoryVO1 = new CatagoryVO();
//		catagoryVO1.setName("測試");
//		dao.insert(catagoryVO1);
		
		//修改
//		CatagoryVO catagoryVO2 = new CatagoryVO();
//		catagoryVO2.setCid(30);
//		catagoryVO2.setName("測試aaaxxxxxz");
//		dao.update(catagoryVO2);
				
		//刪除
		//dao.delete(20);
				
		//查單一
//		CatagoryVO catagoryVO3 = dao.findByPrimaryKey(20);
//		System.out.print(catagoryVO3.getCid() + ",");
//		System.out.println(catagoryVO3.getName());
//		System.out.println("-----------------------------");
				
		//查全部
//		List<CatagoryVO> list = dao.getAll();
//		for (CatagoryVO catagory : list) {
//			System.out.print(catagory.getCid() + ",");
//			System.out.print(catagory.getName());
//			System.out.print(catagory.getName());
//			System.out.println();
//		}
		
		//依產品分類查產品
//		List<CatagoryVO> list = dao.getAll();
//		for (CatagoryVO catagory : list) {
//			System.out.print(catagory.getCid() + ",");
//			System.out.print(catagory.getName());
//			System.out.println("\n------------------------");
//		Set<ProductVO> set = catagory.getProducts();
//		for (ProductVO product : set) {
//			System.out.print(product.getPid() + ",");
//			System.out.print(product.getName() + ",");
//			System.out.print(product.getPhoto() + ",");
//			System.out.print(product.getAmount() + ",");
//			System.out.print(product.getCatagoryVO().getName() + ",");
//			System.out.print(product.getPrice() + ",");
//			System.out.print(product.getDiscount() + ",");
//			System.out.print(product.getDescrip() + ",");
//			System.out.print(product.getIngredients());
//			System.out.println();
//		}
//		System.out.println();
//		}
		
		Set<ProductVO> set = dao.getProductByCid(20);
		for (ProductVO product : set) {
			System.out.print(product.getPid() + ",");
			System.out.print(product.getName() + ",");
			System.out.print(product.getPhoto() + ",");
			System.out.print(product.getAmount() + ",");
			System.out.print(product.getCatagoryVO().getName() + ",");
			System.out.print(product.getPrice() + ",");
			System.out.print(product.getDiscount() + ",");
			System.out.print(product.getDescrip() + ",");
			System.out.print(product.getIngredients());
			System.out.println();
		}
	}

}
