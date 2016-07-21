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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

/**
 * 成立新訂單
 */
@WebServlet("/shopping/NewOrderServlet")
public class NewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/json");
		//把Session物件、Member物件、購物車物件取出
		HttpSession session = request.getSession(false);
		if (session == null) {
			throw new ServletException();
		}
		
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			throw new ServletException();
		}
		
		ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
		if (cart == null) {
			throw new ServletException();
		}
		
		//開始抓請求參數+驗證+輸入格式轉換
		String action = request.getParameter("action");
		
		//取消訂單
		if("cancel".equals(action)){
			session.removeAttribute("ShoppingCart");
			response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
			return;
		}
		
		//再做一次輸入格式的驗證
		if("ok".equals(action)){
		String reward_ptsStr = request.getParameter("reward_pts");
		Integer reward_pts = new Integer(reward_ptsStr.trim());
		if (reward_ptsStr == null || reward_pts < 0 || reward_ptsStr.trim().length() == 0) {
			throw new ServletException();
		}
		
		String should_payStr = request.getParameter("should_pay");
		Integer should_pay = new Integer(should_payStr.replaceAll(",", "").trim());
		if (should_payStr == null || should_payStr.trim().length() == 0 || should_pay < 0) {
			throw new ServletException();
		}
		
		String mname = request.getParameter("mname");
		String mnameReg = "^[^\u0020\u3000][\u4e00-\u9fa5\u0020a-zA-Z]{1,20}$";
		if (mname == null || mname.trim().length() == 0 || !mname.matches(mnameReg)) {
			throw new ServletException();
		}
		
		String addr = request.getParameter("addr");
		if (addr == null || addr.trim().length() == 0) {
			throw new ServletException();
		}
		
		String phone = request.getParameter("phone");
		String phoneReg = "^[0-9]+$";
		if (phone == null || phone.trim().length() == 0 || phone.trim().length() > 10 || !phone.matches(phoneReg)) {
			throw new ServletException();
		}
		
		String email = request.getParameter("email");
		String emailReg = "[a-zA-Z0-9_]*@[a-zA-Z0-9]+(\\.[a-zA-Z]+){1,3}";
		if (email == null || email.trim().length() == 0 || !email.matches(emailReg)) {
			throw new ServletException();
		}
		
//		String myNewRwdStr = request.getParameter("myNewRwd");
//		Integer myNewRwd = new Integer(myNewRwdStr.trim());
//		if (myNewRwdStr == null || myNewRwdStr.trim().length() == 0 || myNewRwd < 0) {
//			throw new ServletException();
//		}
		
		
		
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
		System.out.println(str);
		PrintWriter out = response.getWriter();
		out.print(str);
		
		//更新會員的紅利點數(挪到已付款後才加上去)
//		Integer oldPts = mb.getReward_pts();
//		mb.setReward_pts(oldPts - reward_pts + myNewRwd);
//		MemberService mbServ = new MemberService();
//		mbServ.update(mb);
		
		}
	}

}
