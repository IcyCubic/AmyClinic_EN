package group3.k.order.controller;


import group3.carrie.orderitems.model.OrderItemsService;
import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.henry.login.model.MemberServices;


import group3.henry.login.model.MemberVO;
import group3.nick.score.model.ScoreVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;





import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;

@WebServlet("/Backstage/updateOrder")
public class updateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public updateOrder() { super(); }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	//@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		HttpSession session =req.getSession(false);
		MemberServices memberServices=new MemberServices();
		OrdersService ordersService=new OrdersService();
		OrderItemsService orderItemsService=new OrderItemsService();
		System.out.println("doPost_ok");
		
		if ("getAll".equals(action)){
		System.out.println("getAll_ok");
		List<OrdersVO> ordersVoAll=ordersService.getAll();
		List l1 = new LinkedList();
		for(OrdersVO ordersVO :ordersVoAll ){
			Map m1 = new HashMap();
			Integer oid=ordersVO.getOid();
			m1.put("oid", ordersVO.getOid());
			m1.put("odate",(ordersVO.getOdate()+"").substring(0,10));
			m1.put("total", ordersVO.getTotal());
			m1.put("ostatus", ordersVO.getOstatus());
			m1.put("payment", ordersVO.getPayment());
			m1.put("del_status", ordersVO.getDel_status());
			OrdersVO orders=ordersService.getOneOrders(oid);
			MemberVO member=orders.getMemberVO();
			m1.put("name", member.getName());
	
			l1.add(m1);
			}
		String jsonString = JSONValue.toJSONString(l1);
		out.println(jsonString);
		out.close();
		return;
		}
//-------upDate-----------------------------------------------------------------------------		
		if ("upDate".equals(action)){
			System.out.println("upDate_ok");
		Integer oid =new Integer( req.getParameter("oid"));
		OrdersVO ordersVO=ordersService.getOneOrders(oid);
//		String odate=req.getParameter("odate");
//		String total = req.getParameter("total");
		Integer ostatus =new Integer(req.getParameter("ostatus"));
		ordersVO.setOstatus(ostatus);
		Integer payment =new Integer( req.getParameter("payment"));
		ordersVO.setPayment(payment);
		Integer del_status =new Integer(req.getParameter("del_status"));
		ordersVO.setDel_status(del_status);
		System.out.println("編號 :"+oid+"訂單狀態 :"+ostatus+"付款狀態 :"+payment+"配送狀態 :"+del_status);		
//		System.out.println("編號 :"+oid+"日期 :"+odate+"總金額 :"+total+"訂單狀態 :"+ostatus+"付款狀態 :"+payment+"配送狀態 :"+del_status);		
		ordersService.updateOrders(ordersVO);	
		Map<String,String> msg = new HashMap<String,String>();
		req.setAttribute("msg", msg);
		msg.put("msg", "修改成功");
		System.out.println("修改-成功");
		res.sendRedirect(req.getContextPath()+"/Backstage/orders.jsp");
		return;
		}
	}
}