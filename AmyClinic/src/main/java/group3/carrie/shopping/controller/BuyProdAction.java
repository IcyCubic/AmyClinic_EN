package group3.carrie.shopping.controller;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.shopping.model.ShoppingCart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 加入購物車
 */
public class BuyProdAction extends ActionSupport {
	private Integer pid;
	private String pname;
	private Integer price;
	private Integer discount;
	private Integer qty;
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	public String getPname() {
		return pname;
	}
	
	public void setPname(String pname) {
		this.pname = pname;
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
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		
		//從session中取出ShoppingCart物件
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		
		//如果找不到就new一個新的並放入session物件中
		if(cart == null) {
			cart = new ShoppingCart();
			session.setAttribute("ShoppingCart", cart);
		}
		
		//把商品裝到OrderItemsVO內，並放到ShoppingCart物件裡
		if (discount != 0) {
			this.price = Math.round(price * (1 - (discount/100.0f)));
		}
		
		OrderItemsVO oi = new OrderItemsVO(qty, price, pid, pname);
		try {
			cart.addToCart(pid, oi);
		} catch (Exception e) {
			response.setStatus(503);
		}
		System.out.println("加入購物車囉~");
		return null;
	}
	

}
