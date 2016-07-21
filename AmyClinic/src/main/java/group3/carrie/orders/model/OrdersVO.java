package group3.carrie.orders.model;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.henry.login.model.MemberVO;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
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
@Table(name = "Orders")
public class OrdersVO implements java.io.Serializable {
	private Integer oid;
//	private Integer mid;
	private String recipient;
	private Integer total;
	private Integer points_spent;
	private String addr;
	private String phone;
	private String email;
	private Timestamp odate;
	private Integer ostatus;
	private Integer del_status;
	private Integer payment;
	private Integer discount;
	//訂單和訂單明細是一對多
	private Set<OrderItemsVO> orderItems = new HashSet<OrderItemsVO>();
	//訂單和會員是多對一
	private MemberVO memberVO;

	public OrdersVO() {

	}

	@Id
	@Column(name = "oid")
	@SequenceGenerator(name="oidgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="oidgen") 
	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public Integer getPoints_spent() {
		return points_spent;
	}
	
	public void setPoints_spent(Integer points_spent) {
		this.points_spent = points_spent;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(insertable = false)
	public Timestamp getOdate() {
		return odate;
	}

	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}

	@Column(insertable = false)
	public Integer getOstatus() {
		return ostatus;
	}

	public void setOstatus(Integer ostatus) {
		this.ostatus = ostatus;
	}

	@Column(insertable = false)
	public Integer getDel_status() {
		return del_status;
	}

	public void setDel_status(Integer del_status) {
		this.del_status = del_status;
	}

	public Integer getPayment() {
		return payment;
	}

	public void setPayment(Integer payment) {
		this.payment = payment;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="ordersVO")
	@OrderBy("id asc")
	public Set<OrderItemsVO> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItemsVO> orderItems) {
		this.orderItems = orderItems;
	}

	@ManyToOne
	@JoinColumn(name = "mid")
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	

}
