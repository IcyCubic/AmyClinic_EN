package group3.beef.employee.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.beef.encryption.AES_Encryption;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.commons.collections.map.HashedMap;
import org.hibernate.Hibernate;

import com.google.gson.Gson;

@MultipartConfig(maxFileSize = 16177215)
// @MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize
// = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet({"/empLogin/emp.do","/emp/emp.do"})
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);

	}

	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setHeader("Content-type", "text/html;charset=UTF-8");
		res.setContentType("UTF-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		// ===================查email是否已註冊(ajax)=========================
		if ("checkmail".equals(action)) {
			System.out.println("call checkmail");
			String regmail = (req.getParameter("regmail")).trim();
			EmployeeService eSvc = new EmployeeService();
			EmployeeVO empVO = eSvc.findEmpByMail(regmail);
			if (empVO != null) {
				System.out.println("帳號已存在");
				out.print("notnull");
			} else {
				System.out.println("帳號不存在");
				out.print("null");
			}
		}

		// ===================查詢一位員工=========================

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);

			try {
				String str = req.getParameter("eid");
				if (str == null || (str.trim().length() == 0)) {
					errorMsg.add("請輸入員工編號");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/empLogin/GetAllEMP.jsp");
					failureView.forward(req, res);
					return;
				}
				Integer empno = null;
				try {
					empno = new Integer(str);
				} catch (Exception e) {
					errorMsg.add("員工編號格式不正確");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/GetAllEMP.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				EmployeeService empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.getOneEmployee(empno);
				/*************************** 2.5員工密碼AES解密 ***************************************/
				AES_Encryption AES = new AES_Encryption();
				String pwd = AES.getdecrypt(empVO.getPwd());
				empVO.setPwd(pwd);

				if (empno == null) {
					errorMsg.add("查無資料");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/GetAllEMP.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("empVO", empVO);
				RequestDispatcher successView = req
						.getRequestDispatcher("/emp/update_emp_input.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsg.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		// ===================新增員工=========================
		if ("insert".equals(action)) {
			System.out.println("call insert");
			// List<String> errorMsg = new LinkedList<String>();
			HashMap<String, String> errorMsg = new HashMap<String, String>();
			req.setAttribute("errorMsg", errorMsg);
			EmployeeVO empVO = new EmployeeVO();
			EmployeeService empSvc = new EmployeeService();

			try {
				String ename = req.getParameter("name");
				if (ename == null || ename.trim().length() == 0) {
					// String err= "醫師姓名: 請勿空白";
					errorMsg.put("ename", "請勿空白");
				}
				String npwd = req.getParameter("pwd");
				String npwd2 = req.getParameter("pwd2");
				if (npwd == null || npwd.trim().length() == 0) {
					// errorMsg.put("npwd","請勿空白");
				}
				if (!npwd.equals(npwd2)) {
					errorMsg.put("npwd2", "密碼不一致");
				}
				String pwdReg = "^[(a-zA-Z0-9)]{4,10}$";
				if (!npwd.trim().matches(pwdReg)) {
					errorMsg.put("pwdReg", "密碼長度必需在4到10之間");
				}

				String email = req.getParameter("email");

				if (empSvc.findEmpByMail(email) != null) { // 判斷帳號是否已存在
					errorMsg.put("email", "帳號已存在");
				}

				if (email == null || email.trim().length() == 0) {
					errorMsg.put("email", "請勿空白");
				}

				String edu = req.getParameter("edu");
				if (edu == null || edu.trim().length() == 0) {
					errorMsg.put("edu", "請勿空白");
				}

				String exp = req.getParameter("exp");
				if (exp == null || exp.trim().length() == 0) {
					errorMsg.put("exp", "請勿空白");
				}

				String spec = req.getParameter("spec");
				if (spec == null || spec.trim().length() == 0) {
					errorMsg.put("spec", "請勿空白");
				}
				InputStream is = null;
				Part filePart = req.getPart("photo");

				if (filePart.getSize() == 0) {
					System.out.println("file part null!!");
					is = new FileInputStream("C:\\AmyDB\\e5.jpg"); // 若沒上傳照片，給預設圖片

				} else {
					is = filePart.getInputStream();
					int filesize = (int) filePart.getSize();
					if (filesize > 1024 * 300) {
						errorMsg.put("photo", "照片: 大小請勿超過300KB");
					}
				}

				@SuppressWarnings("deprecation")
				Blob photo = Hibernate.createBlob(is);

				empVO.setName(ename);
				empVO.setPwd(npwd);
				empVO.setEmail(email);
				empVO.setEducation(edu);
				empVO.setExperience(exp);
				empVO.setSpecialty(spec);
				empVO.setPhoto(photo);

				if (!errorMsg.isEmpty()) {
					System.out.println("errorMsg != null");
					req.setAttribute("empVO", empVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/empLogin/AddEMP.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2員工密碼AES加密 ***************************************/
				AES_Encryption AES = new AES_Encryption();
				String pwd = AES.getencrypt(npwd);
				empVO.setPwd(pwd);

				/*************************** 2.5開始新增資料 ***************************************/

				empVO = empSvc.addEmp(ename, pwd, email, photo, edu, exp, spec);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				System.out.println("員工新增成功");
				req.setAttribute("empVO", empVO);
				RequestDispatcher rd = req
						.getRequestDispatcher("/empLogin/add_success.jsp");
				rd.forward(req, res);
				// res.sendRedirect("/empLogin/add_success.jsp");
				// PrintWriter out = res.getWriter();
				// out.print("員工新增成功");
				return;

			} catch (Exception e) {
				System.out.println("catch errorMsg != null");
				System.out.println(e);
				errorMsg.put("otherErr", e.getMessage());
				req.setAttribute("empVO", empVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/empLogin/AddEMP.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================修改員工=========================
		if ("update".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			Integer eid = new Integer(req.getParameter("eid").trim());
			try {
				// String ename = "王牛肉";
				String ename = req.getParameter("name");
				System.out.println(ename);
				if (ename == null || ename.trim().length() == 0) {
					errorMsg.add("醫師姓名: 請勿空白");
				}
				String npwd = req.getParameter("pwd");
				String npwd2 = req.getParameter("pwd2");
				if (npwd == null || npwd.trim().length() == 0) {
					errorMsg.add("密碼: 請勿空白");
				}
				if (!npwd.equals(npwd2)) {
					errorMsg.add("密碼: 密碼不一致");
				}

				String pwdReg = "^[(a-zA-Z0-9)]{4,10}$";
				if (!npwd.trim().matches(pwdReg)) {
					errorMsg.add("密碼:英文字母、數字 , 且長度必需在4到10之間");
				}

				String email = req.getParameter("email");
				if (email == null || email.trim().length() == 0) {
					errorMsg.add("e-mail: 請勿空白");
				}

				String edu = req.getParameter("edu");
				if (edu == null || edu.trim().length() == 0) {
					errorMsg.add("教育程度: 請勿空白");
				}

				String exp = req.getParameter("exp");
				if (exp == null || exp.trim().length() == 0) {
					errorMsg.add("經歷: 請勿空白");
				}

				String spec = req.getParameter("spec");
				if (spec == null || spec.trim().length() == 0) {
					errorMsg.add("專長: 請勿空白");
				}
				Part filePart = req.getPart("photo");
				System.out.println(filePart.getSize());
				// if (filePart.getSize() == 0){
				// errorMsg.add("照片: 請勿空白");
				// }

				Blob photo = null;
				if (filePart.getSize()==0) { // 如果沒上傳照片，就從資料庫抓舊的
					System.out.println("photo null!!");
					EmployeeService eSvc = new EmployeeService();
					InputStream is = eSvc.getOneEmployeePic(eid);
					photo = Hibernate.createBlob(is);
				} else {
					System.out.println("photo not null!!");
					InputStream newis = filePart.getInputStream();
					int filesize = (int) filePart.getSize();
					if (filesize > 1024 * 300) {
						errorMsg.add("照片: 大小請勿超過300KB");
					}
					photo = Hibernate.createBlob(newis);
				}

				// InputStream is = filePart.getInputStream();
				// int filesize = (int) filePart.getSize();
				// if(filesize > 307200){
				// errorMsg.add("照片: 大小請勿超過300KB");
				// }
				EmployeeVO empVO = new EmployeeVO();
				empVO.setEid(eid);
				empVO.setName(ename);
				empVO.setPwd(npwd);
				empVO.setEmail(email);
				empVO.setEducation(edu);
				empVO.setExperience(exp);
				empVO.setSpecialty(spec);
				empVO.setPhoto(photo);

				if (!errorMsg.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/update_emp_input.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.員工密碼AES加密 ***************************************/
				AES_Encryption AES = new AES_Encryption();
				String pwd = AES.getencrypt(npwd);
				empVO.setPwd(pwd);
				/*************************** 2.5開始新增資料 ***************************************/
				EmployeeService empSvc = new EmployeeService();
				empVO = empSvc.updateEmp(eid, ename, pwd, email, photo, edu,
						exp, spec);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/emp/GetAllEMP.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/update_emp_input.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================刪除一位員工=========================

		if ("delete".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();

			try {
				req.setAttribute("errorMsg", errorMsg);
				Integer eid = new Integer(req.getParameter("eid").trim());
				EmployeeService empSvc = new EmployeeService();
				empSvc.deleteEmployee(eid);
				String url = "/empLogin/GetAllEMP.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsg.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/empLogin/GetAllEMP.jsp");
				failureView.forward(req, res);
			}

		}

	}
}
