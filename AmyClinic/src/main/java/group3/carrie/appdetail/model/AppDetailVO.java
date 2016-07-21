package group3.carrie.appdetail.model;

import group3.carrie.app.model.AppVO;
import group3.carrie.proc.model.ProcVO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "AppointmentDetail")
public class AppDetailVO implements java.io.Serializable {
	private Integer ad_id;
//	private Integer procedure_id;
//	private Integer aid;
	//預約明細和預約是多對一
	private AppVO appVO;
	//預約明細和療程是多對一
	private ProcVO procVO;

	public AppDetailVO() {

	}
	
	public AppDetailVO(ProcVO procVO) {
		this.procVO = procVO;
	}

	@Id
	@Column(name = "ad_id")
	@SequenceGenerator(name="ad_idgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="ad_idgen")  
	public Integer getAd_id() {
		return ad_id;
	}

	public void setAd_id(Integer ad_id) {
		this.ad_id = ad_id;
	}

	@ManyToOne 
	@JoinColumn(name = "aid")
	public AppVO getAppVO() {
		return appVO;
	}

	public void setAppVO(AppVO appVO) {
		this.appVO = appVO;
	}

	@ManyToOne 
	@JoinColumn(name = "procedure_id")
	public ProcVO getProcVO() {
		return procVO;
	}

	public void setProcVO(ProcVO procVO) {
		this.procVO = procVO;
	}

	

}
