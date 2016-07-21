package group3.carrie.proctype.model;

import group3.carrie.proc.model.ProcVO;

import java.util.List;
import java.util.Set;

public interface ProcTypeDAO_interface {
	    public void insert(ProcTypeVO procTypeVO);
	    public void update(ProcTypeVO procTypeVO);
	    public void delete(Integer pType_id);
	    public ProcTypeVO findByPrimaryKey(Integer pType_id);
	    public List<ProcTypeVO> getAll();
	    //查詢某個療程種類的療程(一對多)(回傳 Set)
	    public Set<ProcVO> getProcByPType_id(Integer pType_id);

}
