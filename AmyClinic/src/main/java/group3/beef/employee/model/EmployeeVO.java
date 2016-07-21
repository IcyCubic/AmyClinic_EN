package group3.beef.employee.model;

import group3.carrie.app.model.AppVO;
import group3.carrie.schedule.model.ScheduleVO;
import group3.nick.score.model.ScoreVO;

import java.io.Serializable;
import java.sql.Blob;
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
@Table(name = "Employees")
public class EmployeeVO implements Serializable {
	private Integer eid;
	private String name;
	private String pwd;
	private String email;
	private Blob photo;
	private String education;
	private String experience;
	private String specialty;
	//員工和預約是一對多
	private Set<AppVO> apps = new HashSet<AppVO>();
	//員工和排班是一對多
	private Set<ScheduleVO> schedules = new HashSet<ScheduleVO>();
	//員工和評分是一對多
	private Set<ScoreVO> scores = new HashSet<ScoreVO>();
	
	public EmployeeVO(){
		
	}

	@Id
	@Column(name = "eid")
	@SequenceGenerator(name="eidgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="eidgen")  
	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="employeeVO")
	@OrderBy("aid asc")
	public Set<AppVO> getApps() {
		return apps;
	}

	public void setApps(Set<AppVO> apps) {
		this.apps = apps;
	}
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="employeeVO")
	@OrderBy("sch_id asc")
	public Set<ScheduleVO> getSchedules() {
		return schedules;
	}

	public void setSchedules(Set<ScheduleVO> schedules) {
		this.schedules = schedules;
	}
	
	//一個員工對多個評論
	//【mappedBy="多方的關聯屬性名"：用在雙向關聯中，把關係的控制權反轉】【目前emp是ScoreVO的一個屬性】
	@OneToMany(fetch=FetchType.LAZY, mappedBy="emp")
	@OrderBy("score_id asc")
	public Set<ScoreVO> getScores() {
		return scores;
	}

	public void setScores(Set<ScoreVO> scores) {
		this.scores = scores;
	}
	
	

	
}
