package group3.carrie.shopping.model;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;

public class ShoppingCart {
	private Map<Integer, OrderItemsVO> cart = new LinkedHashMap<>();
	
	public ShoppingCart() {
		
	}
	
	//取得ShoppingCart物件的內容
	public Map<Integer, OrderItemsVO> getContent() {
		return this.cart;
	}
	
	//增加商品到ShoppingCart中
	public void addToCart(Integer pid,OrderItemsVO oi) throws Exception {
		if (oi.getQuantity() <= 0) {
			return;
		}
		
		//在Server端沒有該物品的資料，就加進cart裡
		if (cart.get(pid) == null) {
			System.out.println("h4");
			cart.put(pid, oi);
		} else {
		//在Server端已有該物品的資料，則更新數量
			OrderItemsVO oib = cart.get(pid);
			//新的數量+原有的數量
			ProductService prodServ = new ProductService();
			ProductVO prodVO = prodServ.getOneProduct(pid);
			System.out.println("h1");
			//如果新的數量+原有的數量沒超過庫存量才過關
			if (prodVO.getAmount() - (oi.getQuantity() + oib.getQuantity()) >= 0) {
				System.out.println("h2");
				oib.setQuantity(oi.getQuantity() + oib.getQuantity());
			} else {
				System.out.println("h3");
				throw new Exception();
			}
		}
	}
	
	//修改商品數量
	public Boolean updateQty(Integer pid, Integer newQty) {
		if(cart.get(pid) != null) {
			//從Map中拿出來，改完再放回去
			OrderItemsVO oi = (OrderItemsVO) cart.get(pid);
			ProductService prodServ = new ProductService();
			ProductVO prodVO = prodServ.getOneProduct(pid);
			if (prodVO.getAmount() - newQty >= 0) {
				oi.setQuantity(newQty);
				cart.put(pid, oi);
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	//刪除某商品
	public Integer deleteProd(Integer pid) {
		if(cart.get(pid) != null) {
			//從Map中把該筆記錄移掉
			cart.remove(pid);
			return 1;
		} else {
			return 0;
		}
	}
	
	//計算購物車內有幾項商品
	public Integer getItemSize() {
		return cart.size();
	}
	
	//計算購物車內商品的總額(目前先用Integer)
	public Integer getSubTotal() {
		Integer subTotal = 0;
		Set<Integer> set = cart.keySet();
		for(Integer n : set) {
			Integer price = cart.get(n).getPrice_per();
			Integer qty = cart.get(n).getQuantity();
			subTotal += price * qty;
		}
		return subTotal;
	}
	
	//不知道用途
	public void listCart() {
		Set<Integer> set = cart.keySet();
		for(Integer n : set) {
			System.out.printf("pid=%3d,  quantity=%3d,  price=%5.2f\n" , n , cart.get(n).getQuantity(), cart.get(n).getPrice_per());
		}
	}

}
