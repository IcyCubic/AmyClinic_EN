package group3.carrie.catagory.model;

import group3.carrie.product.model.ProductVO;

import java.util.List;
import java.util.Set;


public interface CatagoryDAO_interface {
    public void insert(CatagoryVO catagoryVO);
    public void update(CatagoryVO catagoryVO);
    public void delete(Integer cid);
    public CatagoryVO findByPrimaryKey(Integer cid);
    public List<CatagoryVO> getAll();
    //查詢某個商品種類的商品(一對多)(回傳 Set)
    public Set<ProductVO> getProductByCid(Integer cid);

}
