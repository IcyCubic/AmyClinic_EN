package group3.k.chart.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "SpaToSales")
public class SpaToSalesVO implements java.io.Serializable {
	
	private Integer year;
	private Integer month;   
	private Integer pType_id; 
	private String name;			//療程名稱
	private Integer counts;		//單月銷售總量
	
	@Id
	@Column(name = "id")
	@SequenceGenerator(name="id", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="id")  
	private Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public SpaToSalesVO() {}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getpType_id() {
		return pType_id;
	}

	public void setpType_id(Integer pType_id) {
		this.pType_id = pType_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getCounts() {
		return counts;
	}

	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	
}