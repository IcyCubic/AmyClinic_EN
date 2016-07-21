package group3.carrie.product.model;

import group3.carrie.catagory.model.CatagoryVO;
import group3.carrie.orderitems.model.OrderItemsVO;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class ProductVO implements java.io.Serializable {
	private Integer pid;
	private String name;
	private Blob photo;
	private Integer amount;
//	private Integer cid;
	private Integer price;
	private Integer discount;
	private String descrip;
	private String ingredients;
	//產品和產品分類是多對一
	private CatagoryVO catagoryVO;
	//產品和訂單明細是一對多
	private Set<OrderItemsVO> orderItems = new HashSet<OrderItemsVO>();

	public ProductVO() {

	}

	@Id
	@Column(name = "pid")
	@SequenceGenerator(name="pidgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="pidgen") 
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	@ManyToOne
	@JoinColumn(name = "cid")
	public CatagoryVO getCatagoryVO() {
		return catagoryVO;
	}

	public void setCatagoryVO(CatagoryVO catagoryVO) {
		this.catagoryVO = catagoryVO;
	}

	@OneToMany(fetch=FetchType.EAGER, mappedBy="productVO")
	@OrderBy("id asc")
	public Set<OrderItemsVO> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItemsVO> orderItems) {
		this.orderItems = orderItems;
	}
	
	

}
