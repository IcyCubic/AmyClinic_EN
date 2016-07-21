package group3.carrie.product.model;

import group3.carrie.catagory.model.CatagoryVO;
import group3.carrie.orderitems.model.OrderItemsVO;
import hibernate.util.HibernateUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

public class ProductDAO implements ProductDAO_interface {
	private static final String GET_ALL_STMT = "FROM ProductVO order by pid";
	private static final String GET_BY_NAME = "FROM ProductVO where name like ? order by pid";
//	private static final String GET_ODItems_BYPid_STMT = "FROM OrderItemsVO where pid = ?";
	private static final String GET_BY_CID = "FROM ProductVO where cid = ? order by pid";
	private static final String DELETE_ITEM = "DELETE FROM OrderItemsVO where pid = ?";
	private static final String DELETE_PROD = "DELETE FROM ProductVO where pid = ?";

	@Override
	public void insert(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer pid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int update_count = 0;
		try {
			session.beginTransaction();
			// 刪訂單明細
			Query query1 = session.createQuery(DELETE_ITEM);
			query1.setParameter(0, pid);
			update_count = query1.executeUpdate();

			// 刪產品
			Query query2 = session.createQuery(DELETE_PROD);
			query2.setParameter(0, pid);
			query2.executeUpdate();
			session.getTransaction().commit();
			System.out.println("刪除產品編號" + pid + "時，共有" + update_count
					+ "筆明細被刪除");
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public ProductVO findByPrimaryKey(Integer pid) {
		ProductVO productVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			productVO = (ProductVO) session.get(ProductVO.class, pid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return productVO;
	}
	
	@Override
	public InputStream getPhotoByPrimaryKey(Integer pid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		InputStream in = null;
		try {
			session.beginTransaction();
			try {
			ProductVO productVO = (ProductVO) session.get(ProductVO.class, pid);
			in = productVO.getPhoto().getBinaryStream();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return in;
	}

	@Override
	public List<ProductVO> findByName(String name) {
		List<ProductVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_NAME);
			query.setParameter(0, name);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = null;
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
	public List<ProductVO> findByCid(Integer cid) {
		List<ProductVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_CID);
			query.setParameter(0, cid);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public Set<OrderItemsVO> getOrderItemsByPid(Integer pid) {
		Set<OrderItemsVO> set = findByPrimaryKey(pid).getOrderItems();
		return set;
	}

	public static void main(String[] args) {
		ProductDAO dao = new ProductDAO();

		// 新增
		ProductVO productVO1 = new ProductVO();
		CatagoryVO catagoryVO = new CatagoryVO();
		productVO1.setName("測試用4");
		File file = new File("d:/test1.jpg");
		try {
			if (file != null) {
				InputStream fin = new FileInputStream(file);
				if (fin != null) {
					@SuppressWarnings("deprecation")
					Blob photo = Hibernate.createBlob(fin);
					productVO1.setPhoto(photo);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		productVO1.setAmount(0);
		catagoryVO.setCid(20);
		productVO1.setPrice(1000);
		productVO1.setDiscount(0);
		productVO1.setDescrip("描述");
		productVO1.setIngredients("成份");
		productVO1.setCatagoryVO(catagoryVO);
		dao.insert(productVO1);

		// 修改
//		ProductVO productVO2 = new ProductVO();
//		CatagoryVO catagoryVO1 = new CatagoryVO();
//		Set<OrderItemsVO> set1 = dao.getOrderItemsByPid(2);
//		productVO2.setOrderItems(set1);
//		productVO2.setPid(2);
//		productVO2.setName("測試用01");
//		File file = new File("d:/test1.jpg");
//		try {
//			if (file != null) {
//				InputStream fin = new FileInputStream(file);
//				if (fin != null) {
//					@SuppressWarnings("deprecation")
//					Blob photo = Hibernate.createBlob(fin);
//					productVO2.setPhoto(photo);
//				}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		productVO2.setAmount(99);
//		catagoryVO1.setCid(40);
//		productVO2.setPrice(7000);
//		productVO2.setDiscount(0);
//		productVO2.setDescrip("aaa");
//		productVO2.setIngredients("bbb");
//		productVO2.setCatagoryVO(catagoryVO1);
//		dao.update(productVO2);

		// 刪除
//		 dao.delete(2);

		// 查單一
		// ProductVO productVO3 = dao.findByPrimaryKey(1);
		// System.out.print(productVO3.getPid() + ",");
		// System.out.print(productVO3.getName() + ",");
		// System.out.print(productVO3.getPhoto() + ",");
		// System.out.print(productVO3.getAmount() + ",");
		// System.out.print(productVO3.getCid() + ",");
		// System.out.print(productVO3.getPrice() + ",");
		// System.out.print(productVO3.getDiscount() + ",");
		// System.out.print(productVO3.getDescrip() + ",");
		// System.out.println(productVO3.getIngredients());
		// System.out.println("-----------------------------------------");

		// 查全部
//		List<ProductVO> list = dao.getAll();
//		for (ProductVO product : list) {
//			System.out.print(product.getPid() + ",");
//			System.out.print(product.getName() + ",");
//			System.out.print(product.getPhoto() + ",");
//			System.out.print(product.getAmount() + ",");
//			System.out.print(product.getCatagoryVO().getCid() + ",");
//			System.out.print(product.getCatagoryVO().getName() + ",");
//			System.out.print(product.getPrice() + ",");
//			System.out.print(product.getDiscount() + ",");
//			System.out.print(product.getDescrip() + ",");
//			System.out.print(product.getIngredients());
//			System.out.println();
//		}
		
		//依名字查
//		List<ProductVO> list = dao.findByName("%測試用%");
//		for (ProductVO product : list) {
//			System.out.print(product.getPid() + ",");
//			System.out.print(product.getName() + ",");
//			System.out.print(product.getPhoto() + ",");
//			System.out.print(product.getAmount() + ",");
//			System.out.print(product.getCatagoryVO().getCid() + ",");
//			System.out.print(product.getCatagoryVO().getName() + ",");
//			System.out.print(product.getPrice() + ",");
//			System.out.print(product.getDiscount() + ",");
//			System.out.print(product.getDescrip() + ",");
//			System.out.print(product.getIngredients());
//			System.out.println();
//		}

		// 查訂單明細
//		List<ProductVO> list = dao.getAll();
//		for (ProductVO product : list) {
//			System.out.print(product.getPid() + ",");
//			System.out.print(product.getName() + ",");
//			System.out.print(product.getPhoto() + ",");
//			System.out.print(product.getAmount() + ",");
//			System.out.print(product.getCatagoryVO().getCid() + ",");
//			System.out.print(product.getCatagoryVO().getName() + ",");
//			System.out.print(product.getPrice() + ",");
//			System.out.print(product.getDiscount() + ",");
//			System.out.print(product.getDescrip() + ",");
//			System.out.print(product.getIngredients());
//			System.out.println("\n---------------------------------");
//		 Set<OrderItemsVO> set = product.getOrderItems();
//		 	for (OrderItemsVO orderItems : set) {
//		 		System.out.print(orderItems.getId() + ",");
//		 		System.out.print(orderItems.getProductVO().getName() + ",");
//		 		System.out.print(orderItems.getQuantity() + ",");
//		 		System.out.print(orderItems.getPrice_per());
//		 		System.out.println();
//		 	}
//		 	System.out.println();
//		}
	}

}
