package group3.carrie.orders.controller;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;
import group3.carrie.shopping.model.ShoppingCart;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 成立新訂單/反悔不買了
 */
public class NewOrderAction extends ActionSupport {
	private Integer reward_pts;
	private Integer should_pay;
	private String mname;
	private String addr;
	private String phone;
	private String email;

	public Integer getReward_pts() {
		return reward_pts;
	}

	public void setReward_pts(Integer reward_pts) {
		this.reward_pts = reward_pts;
	}

	public Integer getShould_pay() {
		return should_pay;
	}

	public void setShould_pay(Integer should_pay) {
		this.should_pay = should_pay;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
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

	public String cancel() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			return "nomb";
		}
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if(cart == null) {
			System.out.println("找不到購物車唷1");
			return "nocart";
		}
		
		session.removeAttribute("ShoppingCart");
		return null;
		
	}
	
	public String ok() {
		System.out.println("成立新訂單囉~");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			return "nomb";
		}
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if(cart == null) {
			System.out.println("找不到購物車唷2");
			return "nocart";
		}
		
		//確定成立訂單，把購物車內的明細塞到另一個明細的Set裡面，同時更新所購買商品的庫存量
		Set<OrderItemsVO> orderItems = new HashSet<OrderItemsVO>();
		ProductService prodServ = new ProductService();
		Map<Integer,OrderItemsVO> shoppingCart = cart.getContent();
		Set<Integer> set = shoppingCart.keySet();
		for (Integer k : set) {
			OrderItemsVO oi = shoppingCart.get(k);
			ProductVO prodVO = prodServ.getOneProduct(oi.getProductVO().getPid());
			prodVO.setAmount(prodVO.getAmount()-oi.getQuantity());
			prodServ.updateProduct(prodVO);
			orderItems.add(oi);
		}
		
		//把明細放到訂單內，把購物車物件從Session移掉
		OrdersService ordServ = new OrdersService();
		OrdersVO odVO = ordServ.addOrders(mb, mname, should_pay, reward_pts, addr, phone, email, new Timestamp(new java.util.Date().getTime()), 0, 0, 0, 0, orderItems);
		session.removeAttribute("ShoppingCart");
		//把產生的OrdersVO丟到json物件裡傳到前端，方便下一個網頁抓出來使用
		Gson gson = new GsonBuilder().registerTypeAdapter(OrdersVO.class,new JsonSerializer<OrdersVO>(){

			@Override
			public JsonElement serialize(OrdersVO src, Type typeOfSrc,
					JsonSerializationContext context) {
				JsonObject o = new JsonObject();
				o.addProperty("oid", src.getOid());
				return o;
			}
			
		}).create();
		String str = gson.toJson(odVO);
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

}
