package group3.carrie.shopping.controller;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.henry.global.utility.Mailer;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;


/**
 * 完成信用卡付款後會跳轉至此頁面
 * 1.更改訂單狀態為已付款，並調整會員的紅利點數
 * 2.寄出通知信給使用者
 * 3.跳轉至fin_shopping.jsp，顯示使用者本次訂單的內容
 */
public class FinPayAction extends ActionSupport {
	private static final String HEADER = "AmyClinic 訂購完成通知信";
	private Integer oid;
	
	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}
	
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			return "nomb";
		}
		
		OrdersService ordServ = new OrdersService();
		OrdersVO ordersVO = ordServ.getOneOrders(oid);
		
		//如果該筆訂單的mid跟Session當中的mid不一樣，或是訂單已付款，就導向首頁
		if ((!ordersVO.getMemberVO().getMid().equals(mb.getMid())) || ordersVO.getOstatus() != 0 || ordersVO.getPayment() == 1) {
			System.out.println("訂單已付款囉，掰掰");
			return "failure";
		}
		
		//設定付款狀態為已付款，更新資料庫
		ordersVO.setPayment(1);
		ordServ.updateOrders(ordersVO);
		
		//將調整後的會員紅利點數以及總花費的紅利點數寫回資料庫
		
		//本次訂單所花的紅利點數
		Integer reward_pts = ordersVO.getPoints_spent();
		//整數除整數會出現小數被無條件捨去的狀況，要用整數除小數再去四捨五入才正常
		Integer myNewRwd = Math.round(ordersVO.getTotal()/100.0f);
		//會員目前所擁有的紅利點數
		Integer oldPts = mb.getReward_pts();
		System.out.println("Reward_pts1=" + mb.getReward_pts());
		mb.setReward_pts(oldPts - reward_pts + myNewRwd);
		mb.setSpent_pts(mb.getSpent_pts() + reward_pts);
		MemberServices mbServ = new MemberServices();
		mbServ.update(mb);
		
		//將訂單成立時間的毫秒拿掉，放到request物件，前端取日期時取這個不要取ordersVO内的
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = df.format(ordersVO.getOdate());
		request.setAttribute("odate",date);
		
		//寄通知信給使用者
		Mailer m = new Mailer();
		String msg = msgForEmail(mb, ordersVO, date);
		try {
			m.send(ordersVO.getRecipient(), ordersVO.getEmail(), HEADER, msg, "html");
		} catch(Exception e) {
			request.setAttribute("ordersVO", ordersVO);
			return ERROR;
		}	
		
		
		//將訂單放入request物件中，準備轉交
		request.setAttribute("ordersVO", ordersVO);
		System.out.println("付款完嚕~");
		return SUCCESS;
	}




	//寄給使用者的email內要寫的文字
	protected String msgForEmail(MemberVO mb,OrdersVO ordersVO,String date) {
		String msg = "";
		DecimalFormat df=new DecimalFormat(",###");
		StringBuffer msgBuffer = new StringBuffer();
		msgBuffer.append("<br>您的訂購已完成，以下是您的訂單明細：<br><br>");
		msgBuffer.append("<table border='1' width='1000px' style='border-collapse:collapse'>");
		msgBuffer.append("<tr><td colspan='4'>訂單編號："+ordersVO.getOid()+"</td></tr>");
		msgBuffer.append("<tr><td colspan='4'>訂購時間："+date+"</td></tr>");
		msgBuffer.append("<tr><td>商品名稱</td><td>數量</td><td>單價</td><td>小計</td></tr>");
		Set<OrderItemsVO> set = ordersVO.getOrderItems();
		for (OrderItemsVO orderItems : set) {
			msgBuffer.append("<tr><td>"+orderItems.getProductVO().getName()+"</td>");
			msgBuffer.append("<td>"+orderItems.getQuantity()+"</td>");
			msgBuffer.append("<td>"+df.format(orderItems.getPrice_per())+"元</td>");
			msgBuffer.append("<td>"+df.format(orderItems.getPrice_per()*orderItems.getQuantity())+"元</td></tr>");
		}
		msgBuffer.append("<tr><td></td><td></td><td>合計</td><td>"+df.format(ordersVO.getTotal()+ordersVO.getPoints_spent())+"元</td></tr>");
		msgBuffer.append("<tr><td></td><td></td><td>使用的紅利點數</td><td>"+df.format(ordersVO.getPoints_spent())+"點</td></tr>");
		msgBuffer.append("<tr><td></td><td></td><td>本次所得的紅利點數</td><td>"+df.format(Math.round(ordersVO.getTotal()/100.0))+"點</td></tr>");
		msgBuffer.append("<tr><td></td><td></td><td>剩餘的紅利點數</td><td>"+df.format(mb.getReward_pts())+"點</td></tr>");
		msgBuffer.append("<tr><td></td><td></td><td>總金額</td><td>"+df.format(ordersVO.getTotal())+"元</td></tr></table>");
		msgBuffer.append("<table border='1' width='1000px' style='border-collapse:collapse'>");
		msgBuffer.append("<tr><td><br>收件人姓名："+ordersVO.getRecipient()+"<br><br>地址："+ordersVO.getAddr()+"<br><br>電話："+ordersVO.getPhone()+"<br><br>E-mail："+ordersVO.getEmail()+"<br><br></td></tr></table>");
		
		msg = msgBuffer.toString();
		System.out.println("我在寄信");
		return msg;
		
	}

}
