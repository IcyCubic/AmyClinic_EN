package group3.carrie.product.model;

import group3.carrie.catagory.model.CatagoryVO;
import group3.carrie.orderitems.model.OrderItemsVO;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;

public class ProductService {

	private ProductDAO_interface dao;

	public ProductService() {
		dao = new ProductDAO();
	}

	// 新增
	public ProductVO addProduct(String name, Blob photo, Integer amount,
			Integer cid, Integer price, Integer discount, String descrip,
			String ingredients) {

		ProductVO productVO = new ProductVO();
		CatagoryVO catagoryVO = new CatagoryVO();
		
		productVO.setName(name);
		
//		try {
//			File file = new File("d:/test1.jpg");
//			if (file != null) {
//				InputStream fin = new FileInputStream(file);
//				if (fin != null) {
//					@SuppressWarnings("deprecation")
//					Blob photo1 = Hibernate.createBlob(fin);
//					productVO.setPhoto(photo1);
//				}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		productVO.setAmount(amount);
		catagoryVO.setCid(cid);
		productVO.setPrice(price);
		productVO.setDiscount(discount);
		productVO.setDescrip(descrip);
		productVO.setPhoto(photo);
		productVO.setIngredients(ingredients);
		productVO.setCatagoryVO(catagoryVO);
		dao.insert(productVO);
		
		return productVO;
	}
	
	//修改
	public ProductVO updateProduct(Integer pid,String name, Blob photo, Integer amount,
			Integer cid, Integer price, Integer discount, String descrip,
			String ingredients) {

		ProductVO productVO = new ProductVO();
		CatagoryVO catagoryVO = new CatagoryVO();
		Set<OrderItemsVO> set = dao.getOrderItemsByPid(pid);
		
		productVO.setOrderItems(set);
		productVO.setPid(pid);
		productVO.setName(name);
//		try {
//			File file = new File("d:/test1.jpg");
//			if (file != null) {
//				InputStream fin = new FileInputStream(file);
//				if (fin != null) {
//					@SuppressWarnings("deprecation")
//					Blob photo1 = Hibernate.createBlob(fin);
//					productVO.setPhoto(photo1);
//				}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		productVO.setPhoto(photo);
		productVO.setAmount(amount);
		catagoryVO.setCid(cid);
		productVO.setPrice(price);
		productVO.setDiscount(discount);
		productVO.setDescrip(descrip);
		productVO.setIngredients(ingredients);
		productVO.setCatagoryVO(catagoryVO);
		dao.update(productVO);
		
		return dao.findByPrimaryKey(pid);
	}
	
	//整個物件丟進去修改
	public void updateProduct(ProductVO productVO) {
		dao.update(productVO);
	}
	
	//刪除
	public void deleteProduct(Integer pid) {
		dao.delete(pid);
	}
	
	//依名字查
	public List<ProductVO> findByName(String name){
		return dao.findByName(name);
	}
	
	//查單一
	public ProductVO getOneProduct(Integer pid) {
		return dao.findByPrimaryKey(pid);
	}
	
	//查照片
	public InputStream getPhotoByPrimaryKey(Integer pid) {
		return dao.getPhotoByPrimaryKey(pid);
	}
	
	//查全部
	public List<ProductVO> getAll() {
		return dao.getAll();
	}
	
	//查訂單明細
	public Set<OrderItemsVO> getOrderItemsByPid(Integer pid) {
		return dao.getOrderItemsByPid(pid);
	}
	
	//根據產品分類查詢
	 public List<ProductVO> findByCid(Integer cid) {
		 return dao.findByCid(cid);
	 }
}
