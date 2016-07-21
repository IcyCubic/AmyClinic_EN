package group3.carrie.orders.model;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.henry.login.model.MemberVO;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class OrdersService {
	
	private OrdersDAO_interface dao;
	
	public OrdersService() {
		dao = new OrdersDAO();
	}
	
	//普通新增
//	public OrdersVO addOrders(Integer mid,String recipient,Integer total,Integer points_spent,String addr,String phone,String email,Timestamp odate,Integer ostatus,Integer del_status,Integer payment,Integer discount) {
//		
//		OrdersVO ordersVO = new OrdersVO();
//		MemberVO memberVO = new MemberVO();
//		
//		memberVO.setMid(mid);
//		ordersVO.setRecipient(recipient);
//		ordersVO.setTotal(total);
//		ordersVO.setPoints_spent(points_spent);
//		ordersVO.setAddr(addr);
//		ordersVO.setPhone(phone);
//		ordersVO.setEmail(email);
//		ordersVO.setOdate(odate);
//		ordersVO.setOstatus(ostatus);
//		ordersVO.setDel_status(del_status);
//		ordersVO.setPayment(payment);
//		ordersVO.setDiscount(discount);
//		ordersVO.setMemberVO(memberVO);
//		dao.insert(ordersVO);
//		
//		return ordersVO;
//	}
	
	//訂單主檔+訂單明細新增
	public OrdersVO addOrders(MemberVO memberVO,String recipient,Integer total,Integer points_spent,String addr,String phone,String email,Timestamp odate,Integer ostatus,Integer del_status,Integer payment,Integer discount,Set<OrderItemsVO> set) {
		OrdersVO ordersVO = new OrdersVO();
		Set<OrderItemsVO> orderItemsVOs = new HashSet<OrderItemsVO>();
		
		//把傳進來的Set抓出來塞OrdersVO進去，再塞到另一個Set內，這樣才會吃到oid
		for(OrderItemsVO k : set) {
			k.setOrdersVO(ordersVO);
			orderItemsVOs.add(k);
		}
		
		ordersVO.setRecipient(recipient);
		ordersVO.setTotal(total);
		ordersVO.setPoints_spent(points_spent);
		ordersVO.setAddr(addr);
		ordersVO.setPhone(phone);
		ordersVO.setEmail(email);
		ordersVO.setOdate(odate);
		ordersVO.setOstatus(ostatus);
		ordersVO.setDel_status(del_status);
		ordersVO.setPayment(payment);
		ordersVO.setDiscount(discount);
		ordersVO.setMemberVO(memberVO);
		ordersVO.setOrderItems(orderItemsVOs);
		dao.insert(ordersVO);
		
		return ordersVO;
		
	}
	
	//修改
	public OrdersVO updateOrders(Integer oid,Integer mid,String recipient,Integer total,Integer points_spent,String addr,String phone,String email,Timestamp odate,Integer ostatus,Integer del_status,Integer payment,Integer discount) {
		
		OrdersVO ordersVO = new OrdersVO();
		MemberVO memberVO = new MemberVO();
		
		ordersVO.setOid(oid);
		memberVO.setMid(mid);
		ordersVO.setRecipient(recipient);
		ordersVO.setTotal(total);
		ordersVO.setPoints_spent(points_spent);
		ordersVO.setAddr(addr);
		ordersVO.setPhone(phone);
		ordersVO.setEmail(email);
		ordersVO.setOdate(odate);
		ordersVO.setOstatus(ostatus);
		ordersVO.setDel_status(del_status);
		ordersVO.setPayment(payment);
		ordersVO.setDiscount(discount);
		ordersVO.setMemberVO(memberVO);
		dao.update(ordersVO);
		
		return dao.findByPrimaryKey(oid);
	}
	
	//另一版的修改
	public void updateOrders(OrdersVO ordersVO) {
		dao.update(ordersVO);
		
	}
	
	//刪除
	public void deleteOrders(Integer oid) {
		dao.delete(oid);
	}
	
	//查單一
	public OrdersVO getOneOrders(Integer oid) {
		return dao.findByPrimaryKey(oid);
	}
	
	//查全部
	public List<OrdersVO> getAll() {
		return dao.getAll();
	}
	
	//依照mid查詢
	public List<OrdersVO> findByMid(Integer mid) {
		return dao.findByMid(mid);
	}
	
	//依照商品名稱查詢
//	 public List<Object[]> findByPname(String name,Integer mid) {
//		return dao.findByPname(name,mid);
//	}
	
	 public List<OrdersVO> findByPname(String name,Integer mid) {
		return dao.findByPname(name,mid);
	}
	
	//查訂單明細
	public Set<OrderItemsVO> getOrderItemsByOid(Integer oid) {
		return dao.getOrderItemsByOid(oid);
	}

}
