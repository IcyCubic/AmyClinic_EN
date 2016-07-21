package group3.carrie.orderitems.model;

import group3.carrie.orders.model.OrdersVO;
import group3.carrie.product.model.ProductVO;

import java.util.List;

public class OrderItemsService {
	
	private OrderItemsDAO_interface dao;
	
	public OrderItemsService() {
		dao = new OrderItemsDAO();
	}
	
	//新增
	public OrderItemsVO addOrderItems(Integer oid,Integer pid,Integer quantity,Integer price_per) {
		
		OrderItemsVO orderItemsVO = new OrderItemsVO();
		ProductVO productVO = new ProductVO();
		OrdersVO ordersVO = new OrdersVO();
		
		ordersVO.setOid(oid);
		productVO.setPid(pid);
		orderItemsVO.setOrdersVO(ordersVO);
		orderItemsVO.setProductVO(productVO);
		orderItemsVO.setQuantity(quantity);
		orderItemsVO.setPrice_per(price_per);
		dao.insert(orderItemsVO);
		
		return orderItemsVO;
	}
	
	//修改
	public OrderItemsVO updateOrderItems(Integer id,Integer oid,Integer pid,Integer quantity,Integer price_per) {
		OrderItemsVO orderItemsVO = new OrderItemsVO();
		ProductVO productVO = new ProductVO();
		OrdersVO ordersVO = new OrdersVO();
		
		orderItemsVO.setId(id);
		ordersVO.setOid(oid);
		productVO.setPid(pid);
		orderItemsVO.setOrdersVO(ordersVO);
		orderItemsVO.setProductVO(productVO);
		orderItemsVO.setQuantity(quantity);
		orderItemsVO.setPrice_per(price_per);
		dao.update(orderItemsVO);
		
		return dao.findByPrimaryKey(id);
	}
	
	//刪除
	public void deleteOrderItems(Integer id) {
		dao.delete(id);
	}
	
	//查單一
	public OrderItemsVO getOneOrderItems(Integer id) {
		return dao.findByPrimaryKey(id);
	}
	
	//依訂單編號查詢
	public List<OrderItemsVO> getByOid(Integer oid) {
		return dao.getByOid(oid);
	}
	
	//查全部
	public List<OrderItemsVO> getAll() {
		return dao.getAll();
	}

}
