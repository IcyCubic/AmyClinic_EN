package group3.carrie.product.controller;

import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.List;

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
 * 給prod_list.jsp用來做商品搜尋 like %?%
 * 給shopping_list.jsp找商品目前的庫存量
 */
@WebServlet("/shopping/ProductSearchServlet")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");

		
		if ("getById".equals(action)) {
			String idStr = request.getParameter("pid");
			Integer pid = new Integer(idStr.trim());
			ProductService prodServ = new ProductService();
			ProductVO productVO = prodServ.getOneProduct(pid);
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
			String str = gson.toJson(productVO);
			System.out.println(str);
			PrintWriter out = response.getWriter();
			out.print(str);
		}
		
		
		if ("getByName".equals(action)) {
			String prodname = request.getParameter("prodname");

			ProductService prodServ = new ProductService();
			List<ProductVO> products = prodServ
					.findByName("%" + prodname + "%");
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
			String str = gson.toJson(products);
			System.out.println(str);
			PrintWriter out = response.getWriter();
			out.print(str);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
