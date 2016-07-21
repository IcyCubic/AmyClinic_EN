package group3.carrie.app.model;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.henry.login.model.MemberVO;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
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
@Table(name = "Appointments")
public class AppVO implements java.io.Serializable {
	private Integer aid;
//	private Integer mid;
	private Integer purpose;
	private Date apt_date;
	private String apt_time;
//	private String procedureid;
	private String descrip;
	private Integer apt_status;
//	private Integer eid;
	//預約和會員是多對一
	private MemberVO memberVO;
	//預約和員工是多對一
	private EmployeeVO employeeVO;
	//預約和預約明細是一對多
	private Set<AppDetailVO> appDetails = new HashSet<AppDetailVO>();

	public AppVO() {

	}

	@Id
	@Column(name = "aid")
	@SequenceGenerator(name="aidgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="aidgen")  
	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getPurpose() {
		return purpose;
	}

	public void setPurpose(Integer purpose) {
		this.purpose = purpose;
	}

	public Date getApt_date() {
		return apt_date;
	}

	public void setApt_date(Date apt_date) {
		this.apt_date = apt_date;
	}
	
	public String getApt_time() {
		return apt_time;
	}

	public void setApt_time(String apt_time) {
		this.apt_time = apt_time;
	}

//	public String getProcedureid() {
//		return procedureid;
//	}
//
//	public void setProcedureid(String procedureid) {
//		this.procedureid = procedureid;
//	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	@Column(insertable = false)
	public Integer getApt_status() {
		return apt_status;
	}

	public void setApt_status(Integer apt_status) {
		this.apt_status = apt_status;
	}

	@ManyToOne 
	@JoinColumn(name = "mid")
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@ManyToOne
	@JoinColumn(name = "eid")
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}
	//一對多
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="appVO")
	@OrderBy("ad_id asc")
	public Set<AppDetailVO> getAppDetails() {
		return appDetails;
	}

	public void setAppDetails(Set<AppDetailVO> appDetails) {
		this.appDetails = appDetails;
	}



}
