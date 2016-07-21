package group3.carrie.orders.model;

import group3.carrie.orderitems.model.OrderItemsVO;

import java.util.List;
import java.util.Set;

public interface OrdersDAO_interface {
	    public void insert(OrdersVO ordersVO);
	    public void update(OrdersVO ordersVO);
	    public void delete(Integer oid);
	    public OrdersVO findByPrimaryKey(Integer oid);
	    public List<OrdersVO> getAll();
	    public List<OrdersVO> findByMid(Integer mid);
	    public List<OrdersVO> findByPname(String name,Integer mid);
//	    public List<Object[]> findByPname(String name,Integer mid);
	    //查詢某筆訂單的明細(一對多)(回傳 Set)
	    public Set<OrderItemsVO> getOrderItemsByOid(Integer oid);

}
