package group3.k.SalesToProd.model;

import java.util.List;

public class SalesToProdService {
	private SalesToProdDAO_interface dao;
	
	public SalesToProdService() {
		dao = new SalesToProdDAO();
	}
	//查全部
		public List<SalesToProdVO> getAll() { 
			return dao.getAll();
		}
	//依年限查
	public List<SalesToProdVO> findByYear(Integer yaers){
		return dao.findByYear(yaers);
	}
}
