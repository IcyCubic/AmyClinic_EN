package group3.carrie.product.controller;

import group3.carrie.catagory.model.CatagoryVO;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.hibernate.Hibernate;

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/Backstage/ProductServlet")
//@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductServlet() {
		super();
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("doGet_ok");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// ===================查詢一個商品類別=========================
		if ("getCatagory".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("查商品類別");
			try {
				Integer cid =new Integer( req.getParameter("cid"));
				ProductService prodService = new ProductService();
				List<ProductVO> products = prodService.findByCid(cid);
				/*************************** 2.開始查詢資料 *****************************************/
				for (ProductVO product : products) {
					System.out.print(product.getPid() + ",");
					System.out.print(product.getName() + ",");
					System.out.print(product.getPhoto() + ",");
					System.out.print(product.getAmount() + ",");
					System.out.print(product.getCatagoryVO().getName() + ",");
					System.out.print(product.getPrice() + ",");
					System.out.print(product.getDiscount() + ",");
					System.out.print(product.getDescrip() + ",");
					System.out.print(product.getIngredients());
					System.out.println();}
				//productVO.iterator();
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productss", products);
				RequestDispatcher successView = req.getRequestDispatcher("/Backstage/productList.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/product.jsp");
				failureView.forward(req, res);
			}
		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("doPost_ok");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// ===================查詢一個商品類別=========================
		if ("getCatagory".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("查商品類別");
			try {
				Integer cid =new Integer( req.getParameter("cid"));
				ProductService prodService = new ProductService();
				List<ProductVO> products = prodService.findByCid(cid);
				/*************************** 2.開始查詢資料 *****************************************/
				for (ProductVO product : products) {
					System.out.print(product.getPid() + ",");
					System.out.print(product.getName() + ",");
					System.out.print(product.getPhoto() + ",");
					System.out.print(product.getAmount() + ",");
					System.out.print(product.getCatagoryVO().getName() + ",");
					System.out.print(product.getPrice() + ",");
					System.out.print(product.getDiscount() + ",");
					System.out.print(product.getDescrip() + ",");
					System.out.print(product.getIngredients());
					System.out.println();}
				//productVO.iterator();
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productss", products);
				RequestDispatcher successView = req
						.getRequestDispatcher("/Backstage/productList.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/product.jsp");
				failureView.forward(req, res);
			}
		}
		
										//		查詢單一商品
		if ("getOne_For_Update".equals(action)) { // 來自addProduct.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數****************************************/
				Integer	pid = new Integer(req.getParameter("pid"));
				
				/***************************2.開始查詢資料****************************************/
				ProductService proSvc = new ProductService();
				ProductVO productVO = proSvc.getOneProduct(pid);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("productVO", productVO);         // 資料庫取出的productVO物件,存入req
				String url = "/Backstage/updateProduct.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 Backstage/updateProduct.jsp
				successView.forward(req, res);
				System.out.println("查詢一筆商品");
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/product.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================新增商品=========================
		if ("addProduct".equals(action)) {
			System.out.println("新增指令");
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);

			try {
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsg.add("產品名稱: 請勿空白");
				}
				String priceStr = req.getParameter("price");
				if (priceStr == null || priceStr.trim().length() == 0) {
					errorMsg.add("價格: 請勿空白");
				}
//				String pReg = "^[(0-9)]$";
//				if (!priceStr.trim().matches(pReg)) {
//					errorMsg.add("價格: 必須為整數");
//				}

				String discountStr = req.getParameter("discount");
//				if (discount == null || discount.trim().length() == 0) {
//					errorMsg.add("折扣: 請勿空白");
//				}//折扣可空白？
				String amountStr = req.getParameter("amount");
				String cidStr = req.getParameter("cid");
			
				String descrip = req.getParameter("descrip");
				if (descrip == null || descrip.trim().length() == 0) {
					errorMsg.add("商品描述: 請勿空白");
				}

				String ingredients = req.getParameter("ingredients");
				if (ingredients == null || ingredients.trim().length() == 0) {
					errorMsg.add("商品成分: 請勿空白");
				}

				Part filePart = req.getPart("photo");
				if (filePart.getSize() == 0){
					errorMsg.add("商品照片: 請勿空白");
				}
				InputStream is = filePart.getInputStream();
				int filesize = (int) filePart.getSize();
				if(filesize > 1024 * 300){
					errorMsg.add("商品照片: 大小請勿超過300KB");
				}
				@SuppressWarnings("deprecation")
				Blob photo = Hibernate.createBlob(is);
				
				int price,discount,amount,cid;
				
				try{
				price = Integer.parseInt(priceStr);
				discount = Integer.parseInt(discountStr);
				amount = Integer.parseInt(amountStr);
				cid = Integer.parseInt(cidStr);
				}catch(Exception e){
					price=0;
					discount=0;cid=0;	amount=0;
				}
				ProductVO productVO = new ProductVO();
				productVO.setName(name);
				productVO.setPrice(price);
				productVO.setDiscount(discount);
				productVO.setDescrip(descrip);
				productVO.setIngredients(ingredients);
				productVO.setPhoto(photo);
				System.out.println("新增1");
				if (!errorMsg.isEmpty()) {
					System.out.println("新增錯誤");
					for (String e : errorMsg) {
						System.out.println(e);
					}
					req.setAttribute("productVO", productVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/addProduct.jsp");
					failureView.forward(req, res);
					System.out.println("新增2");
					return;
				}
				/*************************** 2.5開始新增資料 ***************************************/
				ProductService proSvc = new ProductService();
				productVO = proSvc.addProduct(name,photo,amount,
						 cid,  price,  discount,  descrip,
						 ingredients);
				System.out.println("新增3");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/Backstage/product.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("新增4-成功");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				System.out.println("新增失敗");
				errorMsg.add("商品名稱重複");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/addProduct.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================修改=========================
		Integer price,discount,amount,pid = null,cid = null;
		
		
		if ("update".equals(action)) {			
			System.out.println("接收修改");
			
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);

			try {
				pid =new Integer( req.getParameter("pid"));
				
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsg.add("產品名稱: 請勿空白");
				}
				String priceStr = req.getParameter("price");
				if (priceStr == null || priceStr.trim().length() == 0) {
					errorMsg.add("價格: 請勿空白");
				}
//				String pReg = "^[(0-9)]$";
//				if (!priceStr.trim().matches(pReg)) {
//					errorMsg.add("價格: 必須為整數");
//				}

				String discountStr = req.getParameter("discount");
//				if (discount == null || discount.trim().length() == 0) {
//					errorMsg.add("折扣: 請勿空白");
//				}//折扣可空白？
				String amountStr = req.getParameter("amount");
				
				 cid = new Integer(req.getParameter("cid"));
				System.out.println("cid="+cid);
			
				String descrip = req.getParameter("descrip");
				if (descrip == null || descrip.trim().length() == 0) {
					errorMsg.add("商品描述: 請勿空白");
				}

				String ingredients = req.getParameter("ingredients");
				if (ingredients == null || ingredients.trim().length() == 0) {
					errorMsg.add("商品成分: 請勿空白");
				}
				Blob photo = null;
				Part filePart = req.getPart("photo");
				if (filePart.getSize() == 0){
				
				ProductService pSvc=new ProductService();	
				ProductVO productVO=pSvc.getOneProduct(pid);
				photo=productVO.getPhoto();
//				Blob photo = Hibernate.createBlob(is);
//				Hibernate.BLOB(p);
				}else {
					
				InputStream is = filePart.getInputStream();
				int filesize = (int) filePart.getSize();
				if(filesize > 1024 * 300){
					errorMsg.add("商品照片: 大小請勿超過3000KB");
				}
				
				photo = Hibernate.createBlob(is);
			}
				
				
				try{
				
				price = Integer.parseInt(priceStr);
				discount = Integer.parseInt(discountStr);
				amount = Integer.parseInt(amountStr);
				
				
				}catch(Exception e){
					price=0;
					discount=0;	amount=0;
				}
				ProductVO productVO = new ProductVO();
				CatagoryVO  catagoryVO=new CatagoryVO();
				
				productVO.setPid(pid);
				productVO.setName(name);
				productVO.setPrice(price);
				
				catagoryVO.setCid(cid);
				productVO.setCatagoryVO(catagoryVO);
				
				productVO.setDiscount(discount);
				productVO.setDescrip(descrip);
				productVO.setIngredients(ingredients);
				productVO.setPhoto(photo);
				System.out.println("修改-0");
				if (!errorMsg.isEmpty()) {
					System.out.println("修改-1");
					for (String e : errorMsg) {
						System.out.println(e);
					}
					req.setAttribute("productVO", productVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/updateProduct.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.5開始新增資料 ***************************************/
				ProductService proSvc = new ProductService();
				
				//proSvc.deleteProduct(pid);
				System.out.println("cid="+cid);
				productVO = proSvc.updateProduct(pid, name,  photo,  amount,
						 cid,  price,  discount,  descrip,
						 ingredients);
				System.out.println("修改執行");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/Backstage/product.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("修改成功");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				System.out.println("修改錯誤-2");
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/updateProduct.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================刪除商品=========================
		if ("delete".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();

			try {
				req.setAttribute("errorMsg", errorMsg);
				pid = new Integer(req.getParameter("pid").trim());
//				Integer pid = new Integer(req.getParameter("pid").trim());
				ProductService proSvc = new ProductService();
				proSvc.deleteProduct(pid);
				String url = "/Backstage/product.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("刪除成功");
			} catch (Exception e) {
				errorMsg.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/product.jsp");
				failureView.forward(req, res);
			}
		}
	}
}