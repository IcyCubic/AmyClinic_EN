package group3.carrie.orderitems.model;

import group3.carrie.orders.model.OrdersVO;
import group3.carrie.product.model.ProductVO;
import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class OrderItemsDAO implements OrderItemsDAO_interface {
	private static final String GET_ALL_STMT =
		      "FROM OrderItemsVO order by id";
	private static final String GET_BY_OID_STMT =
			"FROM OrderItemsVO where oid = ? order by id";
	private static final String DELETE =
		      "DELETE FROM OrderItemsVO where id = ?";

	@Override
	public void insert(OrderItemsVO orderItemsVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderItemsVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(OrderItemsVO orderItemsVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderItemsVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(DELETE);
			query.setParameter(0, id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public OrderItemsVO findByPrimaryKey(Integer id) {
		OrderItemsVO orderItemsVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			orderItemsVO = (OrderItemsVO)session.get(OrderItemsVO.class, id);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return orderItemsVO;
	}
	
	

	@Override
	public List<OrderItemsVO> getByOid(Integer oid) {
		List<OrderItemsVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_OID_STMT);
			query.setParameter(0, oid);
			list = query.list();
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<OrderItemsVO> getAll() {
		List<OrderItemsVO> list = null;
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
	
	public static void main(String[] args) {
		OrderItemsDAO dao = new OrderItemsDAO();
		OrdersVO ordersVO = new OrdersVO();
		ProductVO productVO = new ProductVO();
		
		//新增
//		OrderItemsVO orderItemsVO1 = new OrderItemsVO();
//		ordersVO.setOid(1);
//		productVO.setPid(2);
//		orderItemsVO1.setQuantity(10);
//		orderItemsVO1.setPrice_per(6000);
//		orderItemsVO1.setOrdersVO(ordersVO);
//		orderItemsVO1.setProductVO(productVO);
//		dao.insert(orderItemsVO1);
		
		//修改
//		OrderItemsVO orderItemsVO2 = new OrderItemsVO();
//		ordersVO.setOid(3);
//		productVO.setPid(4);
//		orderItemsVO2.setQuantity(100);
//		orderItemsVO2.setPrice_per(3000);
//		orderItemsVO2.setId(3);
//		orderItemsVO2.setOrdersVO(ordersVO);
//		orderItemsVO2.setProductVO(productVO);
//		dao.update(orderItemsVO2);
				
		//刪除
//		dao.delete(2);
				
		//查單一
//		OrderItemsVO orderItemsVO3 = dao.findByPrimaryKey(1);
//		System.out.print(orderItemsVO3.getId() + ",");
//		System.out.print(orderItemsVO3.getOrdersVO().getOid() + ",");
//		System.out.print(orderItemsVO3.getProductVO().getPid() + ",");
//		System.out.print(orderItemsVO3.getProductVO().getName() + ",");
//		System.out.print(orderItemsVO3.getQuantity() + ",");
//		System.out.println(orderItemsVO3.getPrice_per());
//		System.out.println("---------------------------------------");
	
		//依訂單編號查詢
		List<OrderItemsVO> list1 = dao.getByOid(1);
		for (OrderItemsVO orderItems : list1) {
			System.out.print(orderItems.getId() + ",");
			System.out.print(orderItems.getOrdersVO().getOid() + ",");
			System.out.print(orderItems.getProductVO().getPid() + ",");
			System.out.print(orderItems.getProductVO().getName() + ",");
			System.out.print(orderItems.getQuantity() + ",");
			System.out.print(orderItems.getPrice_per());
			System.out.println();
		}
		
				
		//查全部
//		List<OrderItemsVO> list = dao.getAll();
//		for (OrderItemsVO orderItems : list) {
//			System.out.print(orderItems.getId() + ",");
//			System.out.print(orderItems.getOrdersVO().getOid() + ",");
//			System.out.print(orderItems.getProductVO().getPid() + ",");
//			System.out.print(orderItems.getProductVO().getName() + ",");
//			System.out.print(orderItems.getQuantity() + ",");
//			System.out.print(orderItems.getPrice_per());
//			System.out.println();
//		}

	}

}
