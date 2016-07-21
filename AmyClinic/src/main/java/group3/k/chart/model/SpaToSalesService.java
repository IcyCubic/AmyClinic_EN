package group3.k.chart.model;

import java.util.List;

public class SpaToSalesService {
	private SpaToSalesDAO_interface dao;
	
	public SpaToSalesService() {
		dao = new SpaToSalesDAO();
	}
	//查全部
		public List<SpaToSalesVO> getAll() { 
			return dao.getAll();
		}
	//依年限查
	public List<SpaToSalesVO> findByYear(Integer yaer){
		return dao.findByYear(yaer);
	}
}
