package group3.carrie.product.model;

import group3.carrie.orderitems.model.OrderItemsVO;

import java.io.InputStream;
import java.util.List;
import java.util.Set;

public interface ProductDAO_interface {
    public void insert(ProductVO productVO);
    public void update(ProductVO productVO);
    public void delete(Integer pid);
    public ProductVO findByPrimaryKey(Integer pid);
    public InputStream getPhotoByPrimaryKey(Integer pid);
    public List<ProductVO> findByName(String name);
    public List<ProductVO> getAll();
    public List<ProductVO> findByCid(Integer cid);
    public Set<OrderItemsVO> getOrderItemsByPid(Integer pid);
}
