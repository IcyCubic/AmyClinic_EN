package group3.k.SalesToProd.model;

import java.util.List;

public interface SalesToProdDAO_interface {
	public List<SalesToProdVO> getAll();
	public List<SalesToProdVO> findByYear(Integer year);
}
