package group3.carrie.schedule.model;

import group3.beef.employee.model.EmployeeVO;

import java.sql.Date;

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
@Table(name = "Schedule")
public class ScheduleVO implements java.io.Serializable {
	private Integer sch_id;
//	private Integer eid;   
	private Date c_date;
	private String c_hours;
	private Integer appt_num;
	private Integer appt_status;
	private String memo;
	//排班跟員工是多對一
	private EmployeeVO employeeVO;
	
	public ScheduleVO() {
		
	}

	@Id
	@Column(name = "sch_id")
	@SequenceGenerator(name="schidgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="schidgen")  
	public Integer getSch_id() {
		return sch_id;
	}


	public void setSch_id(Integer sch_id) {
		this.sch_id = sch_id;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public String getC_hours() {
		return c_hours;
	}

	public void setC_hours(String c_hours) {
		this.c_hours = c_hours;
	}

	public Integer getAppt_num() {
		return appt_num;
	}

	public void setAppt_num(Integer appt_num) {
		this.appt_num = appt_num;
	}

	public Integer getAppt_status() {
		return appt_status;
	}

	public void setAppt_status(Integer appt_status) {
		this.appt_status = appt_status;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@ManyToOne
	@JoinColumn(name = "eid")
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}

	
	
	
	
	
}
