package group3.k.chart.model;

import java.util.List;

public interface SpaToSalesDAO_interface {
	public List<SpaToSalesVO> getAll();
	public List<SpaToSalesVO> findByYear(Integer year);
}
