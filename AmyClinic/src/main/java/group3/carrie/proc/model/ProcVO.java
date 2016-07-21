package group3.carrie.proc.model;

import group3.carrie.appdetail.model.AppDetailVO;
import group3.carrie.proctype.model.ProcTypeVO;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Procedures")
public class ProcVO implements java.io.Serializable {
	private Integer procedure_id;
	private String name;
	private Integer fee;
	//private Integer pType_id;
	//療程和療程種類是多對一
	private ProcTypeVO procTypeVO;
	//療程和預約明細是一對多
	private Set<AppDetailVO> appDetails = new HashSet<AppDetailVO>();

	public ProcVO() {

	}

//	public Integer getpType_id() {
//		return pType_id;
//	}
//
//	public void setpType_id(Integer pType_id) {
//		this.pType_id = pType_id;
//	}

	@Id
	@Column(name = "procedure_id")
	@SequenceGenerator(name="procedure_idgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="procedure_idgen") 
	public Integer getProcedure_id() {
		return procedure_id;
	}

	public void setProcedure_id(Integer procedure_id) {
		this.procedure_id = procedure_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

//	@Column(insertable = false)
	public Integer getFee() {
		return fee;
	}

	public void setFee(Integer fee) {
		this.fee = fee;
	}
	
	@ManyToOne
	@JoinColumn(name = "pType_id")
	public ProcTypeVO getProcTypeVO() {
		return procTypeVO;
	}

	public void setProcTypeVO(ProcTypeVO procTypeVO) {
		this.procTypeVO = procTypeVO;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="procVO")
	@OrderBy("ad_id asc")
	public Set<AppDetailVO> getAppDetails() {
		return appDetails;
	}

	public void setAppDetails(Set<AppDetailVO> appDetails) {
		this.appDetails = appDetails;
	}
}
