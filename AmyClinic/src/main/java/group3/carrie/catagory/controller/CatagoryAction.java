package group3.carrie.catagory.controller;

import group3.carrie.catagory.model.CatagoryService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.Set;

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
 * 用在購物系統
 * 1.在prod_list.jsp側邊欄顯示產品分類(超連結)
 * 2.點超連結後顯示該產品分類的產品，並將當前選中分類的文字換色
 */
public class CatagoryAction extends ActionSupport {
	private Integer cid;
	
	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}
	
	public String execute() {
		System.out.println("我要查產品！");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		CatagoryService cataServ = new CatagoryService();
		Set<ProductVO> products = cataServ.getProductByCid(cid);
		Gson gson = createGson();
		String str = gson.toJson(products);
		System.out.println(str);
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
		Gson gson = new GsonBuilder().registerTypeAdapter(ProductVO.class,new JsonSerializer<ProductVO>(){

			@Override
			public JsonElement serialize(ProductVO src, Type typeOfSrc,
					JsonSerializationContext context) {
				JsonObject o=new JsonObject();
				o.addProperty("pid", src.getPid());
				o.addProperty("name", src.getName());
				o.addProperty("amount", src.getAmount());
				o.addProperty("price", src.getPrice());
				o.addProperty("discount", src.getDiscount());
				o.addProperty("descrip", src.getDescrip());
				o.addProperty("ingredients", src.getIngredients());
				o.addProperty("CatagoryName", src.getCatagoryVO().getName());
				return o;
			}
			
		}).create();
		return gson;
	}
}
