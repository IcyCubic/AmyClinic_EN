package group3.carrie.appdetail.model;

import java.util.List;

public interface AppDetailDAO_interface {
	public void insert(AppDetailVO appDetailVO);
    public void update(AppDetailVO appDetailVO);
    public void delete(Integer ad_id);
    public AppDetailVO findByPrimaryKey(Integer ad_id);
    public List<AppDetailVO> getAll();

}
