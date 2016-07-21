package group3.carrie.proctype.model;

import group3.carrie.proc.model.ProcVO;

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
@Table(name = "ProcedureType")
public class ProcTypeVO implements java.io.Serializable {
	private Integer pType_id;
	private String name;
	//療程種類和療程是一對多
	private Set<ProcVO> procs = new HashSet<ProcVO>();

	public ProcTypeVO() {

	}

	@Id
	@Column(name = "pType_id")
	@SequenceGenerator(name="pType_idgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="pType_idgen") 
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

	@OneToMany(fetch=FetchType.EAGER, mappedBy="procTypeVO")
	@OrderBy("procedure_id asc")
	public Set<ProcVO> getProcs() {
		return procs;
	}

	public void setProcs(Set<ProcVO> procs) {
		this.procs = procs;
	}
	
	

}
