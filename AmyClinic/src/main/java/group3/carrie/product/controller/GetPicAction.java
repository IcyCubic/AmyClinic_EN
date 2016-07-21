package group3.carrie.product.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import group3.carrie.product.model.ProductService;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 用在購物系統
 * 在prod_list.jsp(全部)、show_prod.jsp(單項產品)顯示產品圖片
 */
public class GetPicAction extends ActionSupport {
	
	private Integer num;

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
	
	public String execute() {
		System.out.println("我在抓商品圖片");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("image/*");
		ProductService prodServ = new ProductService();
		try (
				InputStream in = prodServ.getPhotoByPrimaryKey(num);
				OutputStream out = response.getOutputStream();
					
				) {
			if(in != null) {
				byte[] data = new byte[8192];
				int len = 0;
				while ((len = in.read(data)) != -1) {
					out.write(data, 0, len);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
