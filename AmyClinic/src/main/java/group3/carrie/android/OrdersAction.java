package group3.carrie.android;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport {

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		OrdersService ordServ = new OrdersService();
		List<OrdersVO> list = ordServ.findByMid(mb.getMid());
		Gson gson = new GsonBuilder().registerTypeAdapter(OrdersVO.class, new JsonSerializer<OrdersVO>() {

			@Override
			public JsonElement serialize(OrdersVO src, Type typeOfSrc,
					JsonSerializationContext context) {
				JsonObject o = new JsonObject();
				o.addProperty("oid", src.getOid());
				o.addProperty("recipient", src.getRecipient());
				o.addProperty("total", src.getTotal());
				o.addProperty("points_spent", src.getPoints_spent());
				o.addProperty("addr", src.getAddr());
				o.addProperty("phone", src.getPhone());
				o.addProperty("email", src.getEmail());
				o.addProperty("odate", src.getOdate().toString());
				o.addProperty("ostatus", src.getOstatus());
				o.addProperty("del_status", src.getDel_status());
				o.addProperty("payment", src.getPayment());
				o.addProperty("discount", src.getDiscount());
				Set<OrderItemsVO> set = src.getOrderItems();
				List<String> orderitem = new ArrayList<String>();
				JsonArray list1 = new JsonArray();
				for(OrderItemsVO a : set) {
					JsonObject objectInList = new JsonObject();
					objectInList.addProperty("name", a.getProductVO().getName());
					objectInList.addProperty("quantity", a.getQuantity());
					objectInList.addProperty("subtotal", (a.getPrice_per() * a.getQuantity()));
					list1.add(objectInList);
				}
				o.add("orderitem", list1);
				return o;
			}
		
		}).create();
		String str = gson.toJson(list);
		System.out.println(str);
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(str);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("我來查訂單的");
		return null;

	}

}
