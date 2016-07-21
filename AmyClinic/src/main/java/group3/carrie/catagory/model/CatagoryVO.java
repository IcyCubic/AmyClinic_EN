package group3.carrie.catagory.model;

import group3.carrie.product.model.ProductVO;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Catagory")
public class CatagoryVO implements java.io.Serializable {
	private Integer cid;
	private String name;
	//產品分類和產品是一對多
	private Set<ProductVO> products = new HashSet<ProductVO>();

	public CatagoryVO() {

	}

	@Id
	@Column(name = "cid")
	@SequenceGenerator(name="cidgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="cidgen")  
	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	@OneToMany(fetch=FetchType.EAGER, mappedBy="catagoryVO")
	@OrderBy("pid asc")
	public Set<ProductVO> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductVO> products) {
		this.products = products;
	}
	
	

}
