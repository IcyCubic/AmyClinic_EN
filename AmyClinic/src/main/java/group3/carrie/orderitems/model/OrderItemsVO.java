package group3.carrie.orderitems.model;

import group3.carrie.orders.model.OrdersVO;
import group3.carrie.product.model.ProductVO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "OrderItems")
public class OrderItemsVO implements java.io.Serializable {
	private Integer id;
//	private Integer oid;
//	private Integer pid;
	private Integer quantity;
	private Integer price_per;
	//訂單明細和產品是多對一
	private ProductVO productVO;
	//訂單明細和訂單是多對一
	private OrdersVO ordersVO;

	public OrderItemsVO() {

	}
	
	public OrderItemsVO(Integer quantity,Integer price_per,Integer pid,String name) {
		this.quantity = quantity;
		this.price_per = price_per;
		ProductVO productVO = new ProductVO();
		productVO.setPid(pid);
		productVO.setName(name);
		this.productVO = productVO;
	}

	@Id
	@Column(name = "id")
	@SequenceGenerator(name="idgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="idgen") 
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getPrice_per() {
		return price_per;
	}

	public void setPrice_per(Integer price_per) {
		this.price_per = price_per;
	}

	@ManyToOne
	@JoinColumn(name = "pid")
	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	@ManyToOne
	@JoinColumn(name = "oid")
	public OrdersVO getOrdersVO() {
		return ordersVO;
	}

	public void setOrdersVO(OrdersVO ordersVO) {
		this.ordersVO = ordersVO;
	}
	
	

}