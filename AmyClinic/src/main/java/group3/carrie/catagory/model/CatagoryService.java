package group3.carrie.catagory.model;

import group3.carrie.product.model.ProductVO;

import java.util.List;
import java.util.Set;

public class CatagoryService {
	
	private CatagoryDAO_interface dao;
	
	public CatagoryService() {
		dao = new CatagoryDAO();
	}
	
	//新增
	public CatagoryVO addCatagory(String name) {
		
		CatagoryVO catagoryVO = new CatagoryVO();
		
		catagoryVO.setName(name);
		dao.insert(catagoryVO);
		
		return catagoryVO;
	}
	
	//修改
	public CatagoryVO updateCatagory(Integer cid,String name) {
		
		CatagoryVO catagoryVO = new CatagoryVO();
		
		catagoryVO.setCid(cid);
		catagoryVO.setName(name);
		dao.update(catagoryVO);
		
		return dao.findByPrimaryKey(cid);
	}
	
	//刪除
	public void deleteCatagory(Integer cid) {
		dao.delete(cid);
	}
	
	//查單一
	public CatagoryVO getOneCatagory(Integer cid) {
		return dao.findByPrimaryKey(cid);
	}
	
	//查全部
	public List<CatagoryVO> getAll() {
		return dao.getAll();
	}
	
	//查產品
	public Set<ProductVO> getProductByCid(Integer cid) {
		return dao.getProductByCid(cid);
	}

}
