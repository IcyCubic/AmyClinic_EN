package group3.carrie.catagory.controller;

import group3.carrie.catagory.model.CatagoryService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

/*
 * 用在購物系統
 * 1.在prod_list.jsp側邊欄顯示產品分類(超連結)
 * 2.點超連結後顯示該產品分類的產品，並將當前選中分類的文字換色
 */
@WebServlet("/shopping/CatagoryServlet")
public class CatagoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("cid");
		Integer id = Integer.parseInt(cid);
		System.out.println(id);
		CatagoryService cataServ = new CatagoryService();
		Set<ProductVO> products = cataServ.getProductByCid(id);
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
		String str = gson.toJson(products);
		System.out.println(str);
		PrintWriter out = response.getWriter();
		out.print(str);
		// out.flush();
		// out.close();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
