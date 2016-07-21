package group3.carrie.proc.model;

import group3.carrie.proctype.model.ProcTypeVO;

import java.util.List;

public class ProcService {
	
	private ProcDAO_interface dao;
	
	public ProcService() {
		dao = new ProcDAO();
	}
	
	//新增
	public ProcVO addProc(String name,Integer pType_id) {
		
		ProcVO procVO = new ProcVO();
		ProcTypeVO procTypeVO = new ProcTypeVO();
		
		procVO.setName(name);
		procTypeVO.setpType_id(pType_id);
		procVO.setProcTypeVO(procTypeVO);
		dao.insert(procVO);
		
		return procVO;
	}
	
	//新增2
public ProcVO addProc(String name,Integer pType_id,Integer fee) {
		ProcVO procVO = new ProcVO();
		ProcTypeVO procTypeVO = new ProcTypeVO();
		
		procVO.setName(name);
		procTypeVO.setpType_id(pType_id);
		procVO.setFee(fee);
		procVO.setProcTypeVO(procTypeVO);
		dao.insert(procVO);
		
		return procVO;
	}
	//修改
	public ProcVO updateProc(Integer procedure_id,String name,Integer pType_id,Integer fee) {
		
		ProcVO procVO = new ProcVO();
		ProcTypeVO procTypeVO = new ProcTypeVO();
		
		procVO.setProcedure_id(procedure_id);
		procVO.setName(name);
		procTypeVO.setpType_id(pType_id);
		procVO.setFee(fee);
		procVO.setProcTypeVO(procTypeVO);
		dao.update(procVO);
		
		return dao.findByPrimaryKey(procedure_id);
	}
	
	//刪除
	public void deleteProc(Integer procedure_id) {
		dao.delete(procedure_id);
	}
	
	//查單一
	public ProcVO getOneProc(Integer procedure_id) {
		return dao.findByPrimaryKey(procedure_id);
	}
	
	//查全部
	public List<ProcVO> getAll() {
		return dao.getAll();
	}
	//查單療程類別
	public List<ProcVO> findByPType_id(Integer pType_id){
		return dao.findByPType_id(pType_id);
	}
}