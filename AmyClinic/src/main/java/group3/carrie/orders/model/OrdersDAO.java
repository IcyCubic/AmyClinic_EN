package group3.carrie.orders.model;

import group3.carrie.orderitems.model.OrderItemsVO;
import hibernate.util.HibernateUtil;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

public class OrdersDAO implements OrdersDAO_interface {
	private static final String GET_ALL_STMT =
		     "FROM OrdersVO order by oid";
	private static final String GET_BY_PROD_NAME_STMT =
			"SELECT DISTINCT o FROM OrdersVO AS o INNER JOIN o.orderItems AS oi INNER JOIN oi.productVO AS p where p.name like ? and o.memberVO.mid = ? and o.ostatus != 3 order by o.odate desc";
//	private static final String GET_BY_PROD_NAME_STMT =
//			"select o.oid from Orders o join OrderItems oi on o.oid = oi.oid join Products p on oi.pid = p.pid where p.name like ? order by o.oid";
	private static final String GET_BY_MID_STMT =
			"FROM OrdersVO where mid = ? order by odate desc";
	private static final String GET_ORDERITS_BYOid_STMT =
			"FROM OrderItemsVO where oid = ?";
	private static final String DELETE_ITEM =
		      "DELETE FROM OrderItemsVO where oid = ?";
	private static final String DELETE_ORDER =
		      "DELETE FROM OrdersVO where oid = ?";

	@Override
	public void insert(OrdersVO ordersVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(ordersVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(OrdersVO ordersVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(ordersVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer oid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int update_count = 0;
		try {
			session.beginTransaction();
//HQL			
//			//刪訂單明細
//			Query query1 = session.createQuery(DELETE_ITEM);
//			query1.setParameter(0, oid);
//			update_count = query1.executeUpdate();
//			
//			//刪訂單
//			Query query2 = session.createQuery(DELETE_ORDER);
//			query2.setParameter(0, oid);
//			query2.executeUpdate();
//			session.getTransaction().commit();
//			System.out.println("刪除訂單編號" + oid + "時，共有" + update_count + "筆明細被刪除");
			
//CASCADE
			OrdersVO ordersVO = (OrdersVO) session.get(OrdersVO.class, oid);
			session.delete(ordersVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public OrdersVO findByPrimaryKey(Integer oid) {
		OrdersVO ordersVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ordersVO = (OrdersVO) session.get(OrdersVO.class, oid);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return ordersVO;
	}

	@Override
	public List<OrdersVO> getAll() {
		List<OrdersVO> list = null;
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
	public List<OrdersVO> findByMid(Integer mid) {
		List<OrdersVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_MID_STMT);
			query.setParameter(0, mid);
			list = query.list();
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<OrdersVO> findByPname(String name,Integer mid) {
		List<OrdersVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_PROD_NAME_STMT);
			query.setParameter(0, "%"+name+"%");
			query.setParameter(1, mid);
			list = query.list();
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
//	@Override
//	public List<Object[]> findByPname(String name,Integer mid) {
//		List<Object[]> list = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Query query = session.createQuery(GET_BY_PROD_NAME_STMT);
//			query.setParameter(0, "%"+name+"%");
//			query.setParameter(1, mid);
//			list = query.list();
//			session.getTransaction().commit();
//		} catch(RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		return list;
//	}

	@Override
	public Set<OrderItemsVO> getOrderItemsByOid(Integer oid) {
		Set<OrderItemsVO> set = findByPrimaryKey(oid).getOrderItems();
		return set;
	}
	
	public static void main(String[] args) {
		OrdersDAO dao = new OrdersDAO();
		
		
		//普通新增
//		OrdersVO ordersVO1 = new OrdersVO();
//		MemberVO memberVO = new MemberVO();
//		memberVO.setMid(1003);
//		ordersVO1.setRecipient("測試用的");
//		ordersVO1.setTotal(300);
//		ordersVO1.setPoints_spent(500);
//		ordersVO1.setAddr("地址測試");
//		ordersVO1.setPhone("0911234567");
//		ordersVO1.setEmail("abc@aaaa.com");
//		ordersVO1.setOdate(new java.sql.Timestamp(new java.util.Date().getTime()));
//		ordersVO1.setOstatus(1);
//		ordersVO1.setDel_status(0);
//		ordersVO1.setPayment(0);
//		ordersVO1.setDiscount(0);
//		ordersVO1.setMemberVO(memberVO);
//		dao.insert(ordersVO1);
		
		//訂單主檔+訂單明細新增
//		OrdersVO ordersVO4 = new OrdersVO();
//		MemberVO memberVO = new MemberVO();
//		ProductVO productVO1 = new ProductVO();
//		ProductVO productVO2 = new ProductVO();
//		Set<OrderItemsVO> set1 = new HashSet<OrderItemsVO>();
//		
//		OrderItemsVO orderIT1 = new OrderItemsVO();
//		productVO1.setPid(5);
//		orderIT1.setPrice_per(600);
//		orderIT1.setQuantity(5);
//		orderIT1.setProductVO(productVO1);
//		orderIT1.setOrdersVO(ordersVO4);
//		
//		OrderItemsVO orderIT2 = new OrderItemsVO();
//		productVO2.setPid(4);
//		orderIT2.setPrice_per(700);
//		orderIT2.setQuantity(6);
//		orderIT2.setProductVO(productVO2);
//		orderIT2.setOrdersVO(ordersVO4);
//		
//		set1.add(orderIT1);
//		set1.add(orderIT2);
//		
//		memberVO.setMid(1003);
//		ordersVO4.setRecipient("測試用的");
//		ordersVO4.setTotal(300);
//		ordersVO4.setPoints_spent(500);
//		ordersVO4.setAddr("地址測試");
//		ordersVO4.setPhone("0911234567");
//		ordersVO4.setEmail("abc@aaa.com");
//		ordersVO4.setOdate(new java.sql.Timestamp(new java.util.Date().getTime()));
//		ordersVO4.setOstatus(1);
//		ordersVO4.setDel_status(0);
//		ordersVO4.setPayment(0);
//		ordersVO4.setDiscount(0);
//		ordersVO4.setMemberVO(memberVO);
//		ordersVO4.setOrderItems(set1);
//		dao.insert(ordersVO4);
		
		//修改
//		OrdersVO ordersVO2 = new OrdersVO();
//		MemberVO memberVO = new MemberVO();
//		memberVO.setMid(1003);
//		ordersVO2.setRecipient("測試用的1");
//		ordersVO2.setTotal(500);
//		ordersVO2.setPoints_spent(500);
//		ordersVO2.setAddr("地址測試1");
//		ordersVO2.setPhone("091123456");
//		ordersVO2.setEmail("abc@nnn.com");
//		ordersVO2.setOdate(new java.sql.Timestamp(new java.util.Date().getTime()));
//		ordersVO2.setOstatus(1);
//		ordersVO2.setDel_status(0);
//		ordersVO2.setPayment(1);
//		ordersVO2.setDiscount(0);
//		ordersVO2.setOid(5);
//		ordersVO2.setMemberVO(memberVO);
//		dao.update(ordersVO2);
				
		//刪除
//		dao.delete(2);
				
		//查單一
//		OrdersVO ordersVO3 = dao.findByPrimaryKey(1);
//		System.out.print(ordersVO3.getOid() + ",");
//		System.out.print(ordersVO3.getMemberVO().getName() + ",");
//		System.out.print(ordersVO3.getRecipient() + ",");
//		System.out.print(ordersVO3.getTotal() + ",");
//		System.out.print(ordersVO3.getPoints_spent() + ",");
//		System.out.print(ordersVO3.getAddr() + ",");
//		System.out.print(ordersVO3.getPhone() + ",");
//		System.out.print(ordersVO3.getEmail() + ",");
//		System.out.print(ordersVO3.getOdate() + ",");
//		System.out.print(ordersVO3.getOstatus() + ",");
//		System.out.print(ordersVO3.getDel_status() + ",");
//		System.out.print(ordersVO3.getPayment() + ",");
//		System.out.println(ordersVO3.getDiscount());
//		System.out.println("------------------------------------");
		
		//查全部
//		List<OrdersVO> list = dao.getAll();
//		for (OrdersVO orders : list) {
//			System.out.print(orders.getOid() + ",");
//			System.out.print(orders.getMemberVO().getName() + ",");
//			System.out.print(orders.getRecipient() + ",");
//			System.out.print(orders.getTotal() + ",");
//			System.out.print(orders.getPoints_spent() + ",");
//			System.out.print(orders.getAddr() + ",");
//			System.out.print(orders.getPhone() + ",");
//			System.out.print(orders.getEmail() + ",");
//			System.out.print(orders.getOdate() + ",");
//			System.out.print(orders.getOstatus() + ",");
//			System.out.print(orders.getDel_status() + ",");
//			System.out.print(orders.getPayment() + ",");
//			System.out.print(orders.getDiscount());
//			System.out.println();
//		}
		
		//依照mid查詢訂單
//		List<OrdersVO> list1 = dao.findByMid(1006);
//		for (OrdersVO orders1 : list1) {
//			System.out.print(orders1.getOid() + ",");
//			System.out.print(orders1.getMemberVO().getName() + ",");
//			System.out.print(orders1.getRecipient() + ",");
//			System.out.print(orders1.getTotal() + ",");
//			System.out.print(orders1.getPoints_spent() + ",");
//			System.out.print(orders1.getAddr() + ",");
//			System.out.print(orders1.getPhone() + ",");
//			System.out.print(orders1.getEmail() + ",");
//			System.out.print(orders1.getOdate() + ",");
//			System.out.print(orders1.getOstatus() + ",");
//			System.out.print(orders1.getDel_status() + ",");
//			System.out.print(orders1.getPayment() + ",");
//			System.out.print(orders1.getDiscount());
//			System.out.println("\n---------------------------");
//		}
		
		//依照商品名稱及會員編號查詢訂單
//		List<Object[]> list1 = dao.findByPname("super",1006);
//		for (Object[] o : list1) {
//			OrdersVO ordersVO = (OrdersVO) o[0];
//			OrderItemsVO oi = (OrderItemsVO) o[1];
//			ProductVO prodVO =(ProductVO) o[2];
//			System.out.println(ordersVO.getOid());
//			System.out.println(prodVO.getName());
//			}
		
		List<OrdersVO> list1 = dao.findByPname("b",1006);
		for (OrdersVO o : list1) {
			System.out.println(o);
			}
		
		
		//查訂單明細
//		List<OrdersVO> list = dao.getAll();
//		for (OrdersVO orders : list) {
//			System.out.print(orders.getOid() + ",");
//			System.out.print(orders.getMemberVO().getName() + ",");
//			System.out.print(orders.getRecipient() + ",");
//			System.out.print(orders.getTotal() + ",");
//			System.out.print(orders.getPoints_spent() + ",");
//			System.out.print(orders.getAddr() + ",");
//			System.out.print(orders.getPhone() + ",");
//			System.out.print(orders.getEmail() + ",");
//			System.out.print(orders.getOdate() + ",");
//			System.out.print(orders.getOstatus() + ",");
//			System.out.print(orders.getDel_status() + ",");
//			System.out.print(orders.getPayment() + ",");
//			System.out.print(orders.getDiscount());
//			System.out.println("\n---------------------------");
//		Set<OrderItemsVO> set = orders.getOrderItems();
//		for (OrderItemsVO orderItems : set) {
//			System.out.print(orderItems.getId() + ",");
//			System.out.print(orderItems.getProductVO().getPid() + ",");
//			System.out.print(orderItems.getProductVO().getName() + ",");
//			System.out.print(orderItems.getQuantity() + ",");
//			System.out.print(orderItems.getPrice_per());
//			System.out.println();
//		}
//		System.out.println();
//		}

	}

}
