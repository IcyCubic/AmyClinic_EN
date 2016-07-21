package group3.carrie.proctype.model;

import group3.carrie.proc.model.ProcVO;

import java.util.List;
import java.util.Set;

public class ProcTypeService {
	
	private ProcTypeDAO_interface dao;
	
	public ProcTypeService() {
		dao = new ProcTypeDAO();
 	}
	
	//新增
	public ProcTypeVO addProcType(String name) {
		
		ProcTypeVO procTypeVO = new ProcTypeVO();
		procTypeVO.setName(name);
		dao.insert(procTypeVO);
		
		return procTypeVO;
	}
	
	//修改
	public ProcTypeVO updateProcType(Integer pType_id,String name) {
		
		ProcTypeVO procTypeVO = new ProcTypeVO();
		procTypeVO.setpType_id(pType_id);
		procTypeVO.setName(name);
		dao.update(procTypeVO);
		
		return dao.findByPrimaryKey(pType_id);
	}
	
	//刪除
	public void deleteProcType(Integer pType_id) {
		dao.delete(pType_id);
	}
	
	//查單一
	public ProcTypeVO getOneProcType(Integer pType_id) {
		return dao.findByPrimaryKey(pType_id);
	}
	
	//查全部
	public List<ProcTypeVO> getAll() {
		return dao.getAll();
	}
	
	//查療程
	public Set<ProcVO> getProcByPType_id(Integer pType_id) {
		return dao.getProcByPType_id(pType_id);
	}

}
