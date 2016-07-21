package group3.carrie.app.model;

import group3.carrie.appdetail.model.AppDetailVO;

import java.sql.Date;
import java.util.List;
import java.util.Set;

public interface AppDAO_interface {
	public void insert(AppVO appVO);
    public void update(AppVO appVO);
    public void delete(Integer aid);
    public AppVO findByPrimaryKey(Integer aid);
    public List<AppVO> getAll();
    public List<AppVO> findByMid_BF(Integer mid);
    public List<AppVO> findByMid_AF(Integer mid);
    public List<AppVO> findByMid_Date_Time(Integer mid,Date apt_date,String apt_time);
    //查詢某次預約的明細(一對多)(回傳 Set)
    public Set<AppDetailVO> getAppDetailByAid(Integer aid);

}
