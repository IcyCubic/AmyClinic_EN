package group3.k.members.controller;

import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.google.gson.Gson;


@WebServlet("/Backstage/MemberServletTest")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {  super();  }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("呼叫MemberServletTest=ok");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		//ok ===================新增會員=========================
				if ("add".equals(action)) {
					System.out.println("新增指令");
					List<String> errorMsg = new LinkedList<String>();
					req.setAttribute("errorMsg", errorMsg);
					MemberVO memberVO = new MemberVO();
					try {
						
//						名稱
						String name = req.getParameter("name");
						if (name == null || name.trim().length() >= 10) {errorMsg.add("姓名(10字內): 請勿空白");}
						System.out.println("name="+name);
						memberVO.setName(name);
//						密碼			
						String pwd = req.getParameter("pwd");
						if (pwd == null || pwd.trim().length() >= 10) {errorMsg.add("密碼: 請勿空白");}
						System.out.println("pwd="+pwd);
						memberVO.setPwd(pwd);
//						信箱		
						String email = req.getParameter("email");
						if (email == null || email.trim().length() >= 30) {errorMsg.add("信箱: 請勿空白");}
						System.out.println("email="+email);
						memberVO.setEmail(email);
//						生日			
						String birthdayStr = req.getParameter("birthday");
						System.out.println("birthdayStr="+birthdayStr);
						Date sql=java.sql.Date.valueOf(birthdayStr);
//						SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
//				        Date parsed = (Date) format.parse(birthdayStr);
//				        @SuppressWarnings("deprecation")
//						java.sql.Date sql = new java.sql.Date(parsed.getDate());
//				        java.sql.Date.valueOf(birthdayStr)
						System.out.println("sql="+sql);
						memberVO.setBirthday(sql);
//						國家			
						String country = req.getParameter("country");
//						if (country == null || country.trim().length() >= 10) {errorMsg.add("城市: 請勿空白");}
						System.out.println("country="+country);
						memberVO.setCountry(country);
//						性別			
						char gender =( req.getParameter("gender")).charAt(0);
//						if (gender == null) {errorMsg.add("性別: 請勿空白");}
						System.out.println("gender="+gender);
						memberVO.setGender(gender);
//						地址		
						String addr = req.getParameter("addr");
//						if (addr == null ) {errorMsg.add("地址: 請勿空白");}
						System.out.println("addr="+addr);
						memberVO.setAddr(addr);
//						電話			
						String phone = req.getParameter("phone");
						if (phone == null ) {errorMsg.add("電話: 請勿空白");}
						System.out.println("phone="+phone);
						memberVO.setPhone(phone);
//						身高									
						Integer height =new Integer( req.getParameter("height"));
//						if (height == null || height.trim().length() >= 10) {errorMsg.add("身高: 請勿空白");}
						System.out.println("height="+height);
						memberVO.setHeight(height);
//						體重			
						Integer mass =new Integer( req.getParameter("mass"));
//						if (mass == null || mass.trim().length() >= 10) {errorMsg.add("體重: 請勿空白");}
						System.out.println("mass="+mass);
						memberVO.setMass(mass);
						
//						狀態		
						Integer act_status =new Integer( req.getParameter("act_status"));
						System.out.println("act_status="+act_status);
						memberVO.setAct_status(act_status);
									 					
						if (!errorMsg.isEmpty()) {
							for (String e : errorMsg) {System.out.println(e);}
							req.setAttribute("memberVO", memberVO);
							RequestDispatcher failureView = req
									.getRequestDispatcher("/Backstage/addMember.jsp");
							failureView.forward(req, res);
							System.out.println("新增錯誤2");
							return;
						}
						/*************************** 2.5開始新增資料 ***************************************/
						MemberServices memberSvc = new MemberServices();
						memberSvc.addMember(memberVO);
						System.out.println("新增2");
						/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
						String url = "/Backstage/members.jsp";
						Map<String,String> msg = new HashMap<String,String>();
						req.setAttribute("msg", msg);
						msg.put("msg", "新增成功");
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						System.out.println("新增3-成功");

					} catch (Exception e) {
						System.out.println(e.getMessage());
						e.printStackTrace();
						System.out.println("新增失敗");
						errorMsg.add("新增失敗，請輸入正確格式");
						RequestDispatcher failureView = req
								.getRequestDispatcher("/Backstage/addMember.jsp");
						failureView.forward(req, res);
					}
				}//add
				//getOneid ===================更新查詢=========================				
				if ("getOne_For_Update".equals(action)) {
					System.out.println("更新查詢指令");
					List<String> errorMsg = new LinkedList<String>();
					req.setAttribute("errorMsg", errorMsg);
					
					try {
//						id						
						Integer mid = new Integer(req.getParameter("mid"));
						System.out.println("mid = "+mid);
						/***************************2.開始查詢資料****************************************/
						MemberServices memberSvc = new MemberServices();
						MemberVO memberVO = new MemberVO();
						memberVO = memberSvc.getOneMember(mid);
						/***************************3.查詢完成,準備轉交(Send the Success view)************/
						req.setAttribute("memberVO", memberVO);         // 資料庫取出的memberVO物件,存入req
						String url = "/Backstage/updateMember.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 Backstage/updateProduct.jsp
						successView.forward(req, res);
						System.out.println("查詢一筆會員");
					}catch (Exception e) {
						e.printStackTrace();
						errorMsg.add("查詢失敗"+e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/Backstage/members.jsp");
						failureView.forward(req, res);
					}
				}//getOne_For_Update
				//ok ===================送出更新=========================
				if ("Update".equals(action)) {
					System.out.println("新增指令");
					List<String> errorMsg = new LinkedList<String>();
					req.setAttribute("errorMsg", errorMsg);
					MemberVO memberVO = new MemberVO();
					try {
//						編號
						Integer mid =new Integer( req.getParameter("mid"));
						System.out.println("name="+mid);
						memberVO.setMid(mid);
//						名稱
						String name = req.getParameter("name");
						if (name == null || name.trim().length() >= 10) {errorMsg.add("姓名(10字內): 請勿空白");}
						System.out.println("name="+name);
						memberVO.setName(name);
//						密碼			
						String pwd = req.getParameter("pwd");
						if (pwd == null ) {errorMsg.add("密碼: 請勿空白");}
						System.out.println("pwd="+pwd);
						memberVO.setPwd(pwd);
//						信箱		
						String email = req.getParameter("email");
						if (email == null || email.trim().length() >= 30) {errorMsg.add("信箱: 請勿空白");}
						System.out.println("email="+email);
						memberVO.setEmail(email);
//						生日			
						String birthdayStr = req.getParameter("birthday");
						System.out.println("birthdayStr="+birthdayStr);
						Date birthday=java.sql.Date.valueOf(birthdayStr);
//						SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
//				        Date parsed = (Date) format.parse(birthdayStr);
//				        @SuppressWarnings("deprecation")
//						java.sql.Date sql = new java.sql.Date(parsed.getDate());
//				        java.sql.Date.valueOf(birthdayStr)
						System.out.println("birthday="+birthday);
						memberVO.setBirthday(birthday);
//						國家			
						String country = req.getParameter("country");
//						if (country == null || country.trim().length() >= 10) {errorMsg.add("城市: 請勿空白");}
						System.out.println("country="+country);
						memberVO.setCountry(country);
//						性別			
						char gender =( req.getParameter("gender")).charAt(0);
//						if (gender == null) {errorMsg.add("性別: 請勿空白");}
						System.out.println("gender="+gender);
						memberVO.setGender(gender);
//						地址		
						String addr = req.getParameter("addr");
//						if (addr == null ) {errorMsg.add("地址: 請勿空白");}
						System.out.println("addr="+addr);
						memberVO.setAddr(addr);
//						電話			
						String phone = req.getParameter("phone");
						if (phone == null ) {errorMsg.add("電話: 請勿空白");}
						System.out.println("phone="+phone);
						memberVO.setPhone(phone);
//						身高									
						Integer height =new Integer( req.getParameter("height"));
//						if (height == null || height.trim().length() >= 10) {errorMsg.add("身高: 請勿空白");}
						System.out.println("height="+height);
						memberVO.setHeight(height);
//						體重			
						Integer mass =new Integer( req.getParameter("mass"));
//						if (mass == null || mass.trim().length() >= 10) {errorMsg.add("體重: 請勿空白");}
						System.out.println("mass="+mass);
						memberVO.setMass(mass);
//						狀態			
						Integer act_status =new Integer( req.getParameter("act_status"));
						System.out.println("act_status="+act_status);
						memberVO.setAct_status(act_status);
//						交易		
						Integer num_trans =new Integer( req.getParameter("num_trans"));
						System.out.println("num_trans="+num_trans);
						memberVO.setNum_trans(num_trans);
//						診療		
						Integer num_treatment =new Integer( req.getParameter("num_treatment"));
						System.out.println("num_treatment="+num_treatment);
						memberVO.setNum_treatment(num_treatment);
//						訪問次數		
						Integer num_visits =new Integer( req.getParameter("num_visits"));
						System.out.println("num_visits="+num_visits);
						memberVO.setNum_visits(num_visits);
//						獎勵點數		
						Integer reward_pts =new Integer( req.getParameter("reward_pts"));
						System.out.println("reward_pts="+reward_pts);
						memberVO.setReward_pts(reward_pts);
//						消費點數		
						Integer spent_pts =new Integer( req.getParameter("spent_pts"));
						System.out.println("spent_pts="+spent_pts);
						memberVO.setSpent_pts(spent_pts);
//						最後消費日期			
						String last_visitStr = req.getParameter("last_visit");
						System.out.println("last_visitStr="+last_visitStr);
						Date last_visit=java.sql.Date.valueOf(last_visitStr);
						System.out.println("last_visit="+last_visit);
						memberVO.setLast_visit(last_visit);
//						加入日期			
						String join_dateStr = req.getParameter("join_date");
						System.out.println("join_dateStr="+join_dateStr);
						Timestamp join_date=java.sql.Timestamp.valueOf(join_dateStr);
						System.out.println("join_date="+join_date);
						memberVO.setJoin_date(join_date);
//						備註			
						String memo = req.getParameter("memo");
						if (memo.trim().length() >= 50) {errorMsg.add("備註: 請勿超過50字");}
						System.out.println("memo="+memo);
						memberVO.setMemo(memo);
//						消費點數		
						Integer total_spent =new Integer( req.getParameter("total_spent"));
						System.out.println("total_spent="+total_spent);
						memberVO.setTotal_spent(total_spent);
//						驗證			
						String verify = req.getParameter("verify");
						System.out.println("verify="+verify);
						memberVO.setVerify(verify);
//						照片依信箱命名			
						String photo = req.getParameter("photo");
						System.out.println("photo="+photo);
						memberVO.setPhoto(photo);
									 					
						if (!errorMsg.isEmpty()) {
							for (String e : errorMsg) {System.out.println(e);}
							req.setAttribute("memberVO", memberVO);
							RequestDispatcher failureView = req
									.getRequestDispatcher("/Backstage/updateMember.jsp");
							failureView.forward(req, res);
							System.out.println("修改錯誤2");
							return;
						}
						/*************************** 2.5開始新增資料 ***************************************/
						MemberServices memberSvc = new MemberServices();
						memberSvc.update(memberVO);
						System.out.println("修改2");
						/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
						String url = "/Backstage/members.jsp";
						Map<String,String> msg = new HashMap<String,String>();
						req.setAttribute("msg", msg);
						msg.put("msg", "修改成功");
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						System.out.println("修改3-成功");

					} catch (Exception e) {
						System.out.println(e.getMessage());
						e.printStackTrace();
						System.out.println("修改失敗");
						errorMsg.add("修改失敗"+e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/Backstage/updateMember.jsp");
						failureView.forward(req, res);
					}
				}//update
				//getOneName===================更新查詢=========================				
				if ("getOne_Name_Update".equals(action)) {
					System.out.println("姓名查詢指令");
					List<String> errorMsg = new LinkedList<String>();
					req.setAttribute("errorMsg", errorMsg);				
					try {
//						name						
						String name = req.getParameter("myname");
						System.out.println("myname = "+name);
						/***************************2.開始查詢資料****************************************/
						MemberServices memberSvc = new MemberServices();
//						MemberVO memberVO = new MemberVO();
						List<MemberVO>  memberVO2= memberSvc.getOneNameMember(name);
						/***************************3.查詢完成,準備轉交(Send the Success view)************/
						req.setAttribute("memberVO2", memberVO2);         // 資料庫取出的memberVO物件,存入req
						String url = "/Backstage/updateMember.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 Backstage/updateProduct.jsp
						successView.forward(req, res);
						System.out.println("查詢一筆會員");
					}catch (Exception e) {
						e.printStackTrace();
						errorMsg.add("查詢失敗"+e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/Backstage/members.jsp");
						failureView.forward(req, res);
					}
				}//getOne_For_Update
				
				
					// ===================全部員工json=========================
				if ("getAllJson".equals(action)){
					
					System.out.println("call getAllJson");
					res.setContentType("application/json");
					res.setCharacterEncoding("UTF-8");
					PrintWriter out = res.getWriter();
					Gson gson = new Gson();
					MemberServices mSvc = new MemberServices();
					List<MemberVO> list = mSvc.getAll();
					List l1 = new LinkedList();
					for(MemberVO memVO : list){
						HashedMap m1 = new HashedMap();
						m1.put("mid", memVO.getMid().toString());
						m1.put("name", memVO.getName());
						m1.put("verify", memVO.getVerify());
						m1.put("email", memVO.getEmail());
						m1.put("birthday", memVO.getBirthday().toString());
						m1.put("cuntry", memVO.getCountry());
						m1.put("gender", memVO.getGender().toString());
						m1.put("addr", memVO.getAddr());
						m1.put("phone", memVO.getPhone());
						m1.put("height", memVO.getHeight().toString());
						m1.put("mass", memVO.getMass().toString());
						m1.put("act_satus", memVO.getAct_status().toString());
						m1.put("num_trans", memVO.getNum_trans().toString());
						m1.put("num_treatment", memVO.getNum_treatment().toString());
						m1.put("num_visits", memVO.getNum_visits().toString());
						m1.put("total_spent", memVO.getTotal_spent().toString());
						m1.put("reward_pts", memVO.getReward_pts().toString());
						m1.put("spent_pts", memVO.getSpent_pts().toString());
						m1.put("last_visit", memVO.getLast_visit());
						m1.put("join_date", memVO.getJoin_date());
						l1.add(m1);
					}
					
				
					//res.setHeader("Access-Control-Allow-Origin", "*");
					//res.setHeader("content-type", "text/html;charset=UTF-8");
					
					String json = gson.toJson(l1);
					out.print(json);
				
				}
				
				
				
				
	}
}