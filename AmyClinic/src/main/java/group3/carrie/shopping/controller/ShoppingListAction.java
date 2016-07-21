package group3.carrie.shopping.controller;

import group3.carrie.shopping.model.ShoppingCart;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 1.修改數量/刪除購物車內的商品
 * 2.放棄購物
 */
public class ShoppingListAction extends ActionSupport {
	private Integer pid;
	private Integer newQy;
	private Integer amount;
	private Integer quantity;
	
	
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	public Integer getNewQy() {
		return newQy;
	}

	public void setNewQy(Integer newQy) {
		this.newQy = newQy;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String updateOIProd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if(cart == null) {
			return "nocart";
		}
		
		//在後端再檢查一次輸入的參數有沒有錯誤
		if(newQy < 0 || newQy == 0 || newQy == quantity || (amount - newQy) < 0) {
			return null;
		}			
		
		cart.updateQty(pid, newQy);
		System.out.println("數量更新囉~");
		return SUCCESS;
	}
	
	public String deleteOIProd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if(cart == null) {
			return "nocart";
		}
		cart.deleteProd(pid);
		System.out.println("deleteOIProd刪除囉！");
		return SUCCESS;
		
	}
	
	public String abanShopping() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if(cart != null) {
			session.removeAttribute("ShoppingCart");
		}
		System.out.println("放棄購物ing");
		return SUCCESS;
	}
	
}
