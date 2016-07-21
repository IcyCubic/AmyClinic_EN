package group3.carrie.product.controller;

import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 購物系統用
 * show_prod.jsp顯示單樣產品的資料(名稱+價格+成分+描述)
 */
public class ShowProductAction extends ActionSupport{
	private Integer pid;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	public String execute() {
	System.out.println("showprod正常運作中");
	HttpServletRequest request = ServletActionContext.getRequest();
	ProductService prodServ = new ProductService();
	ProductVO prodVO = prodServ.getOneProduct(pid);
	if (prodVO == null) {
		System.out.println("找不到產品，哭哭");
		return "noprod";
	} else {
		System.out.println("找~到~惹~");
		request.setAttribute("prodVO", prodVO);
		return SUCCESS;
	}
	
	}
	
	
}
