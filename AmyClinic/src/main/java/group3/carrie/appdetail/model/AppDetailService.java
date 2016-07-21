package group3.carrie.appdetail.model;

import group3.carrie.app.model.AppVO;
import group3.carrie.proc.model.ProcVO;

import java.util.List;

public class AppDetailService {

	private AppDetailDAO_interface dao;

	public AppDetailService() {
		dao = new AppDetailDAO();
	}

	// 新增
	public AppDetailVO addAppDetail(Integer procedure_id, Integer aid) {

		AppDetailVO appDetailVO = new AppDetailVO();
		AppVO appVO = new AppVO();
		ProcVO procVO = new ProcVO();

		procVO.setProcedure_id(procedure_id);
		appVO.setAid(aid);
		appDetailVO.setAppVO(appVO);
		appDetailVO.setProcVO(procVO);
		dao.insert(appDetailVO);

		return appDetailVO;
	}

	// 修改
	public AppDetailVO updateAppDetail(Integer ad_id, Integer procedure_id,
			Integer aid) {

		AppDetailVO appDetailVO = new AppDetailVO();
		AppVO appVO = new AppVO();
		ProcVO procVO = new ProcVO();
		
		appDetailVO.setAd_id(ad_id);
		procVO.setProcedure_id(procedure_id);
		appVO.setAid(aid);
		appDetailVO.setAppVO(appVO);
		appDetailVO.setProcVO(procVO);
		dao.update(appDetailVO);

		return dao.findByPrimaryKey(ad_id);
	}

	// 刪除
	public void deleteAppDetail(Integer ad_id) {
		dao.delete(ad_id);
	}

	// 查單一
	public AppDetailVO getOneAppDetail(Integer ad_id) {
		return dao.findByPrimaryKey(ad_id);
	}

	// 查全部
	public List<AppDetailVO> getAll() {
		return dao.getAll();
	}

}
