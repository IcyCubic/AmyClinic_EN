package group3.carrie.product.controller;

import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 給prod_list.jsp用來做商品搜尋 like %?%
 * 給shopping_list.jsp找商品目前的庫存量
 */
public class ProductSearchAction extends ActionSupport {
	private String prodname;
	private Integer pid;

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	public String getById() {
		System.out.println("用id查商品！");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductService prodServ = new ProductService();
		ProductVO productVO = prodServ.getOneProduct(pid);
		Gson gson = createGson();
		String str = gson.toJson(productVO);
//		System.out.println(str);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(str);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getByName() {
		System.out.println("用名字查商品！");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductService prodServ = new ProductService();
		List<ProductVO> products = prodServ
				.findByName("%" + prodname + "%");
		Gson gson = createGson();
		String str = gson.toJson(products);
//		System.out.println(str);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(str);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	


	public Gson createGson() {
		System.out.println("Gson好棒棒");
		Gson gson = new GsonBuilder().registerTypeAdapter(ProductVO.class,
				new JsonSerializer<ProductVO>() {

					@Override
					public JsonElement serialize(ProductVO src,
							Type typeOfSrc, JsonSerializationContext context) {
						JsonObject o = new JsonObject();
						o.addProperty("pid", src.getPid());
						o.addProperty("name", src.getName());
						o.addProperty("amount", src.getAmount());
						o.addProperty("price", src.getPrice());
						o.addProperty("discount", src.getDiscount());
						o.addProperty("descrip", src.getDescrip());
						o.addProperty("ingredients", src.getIngredients());
						return o;
					}

				}).create();
		return gson;
	}	

}
