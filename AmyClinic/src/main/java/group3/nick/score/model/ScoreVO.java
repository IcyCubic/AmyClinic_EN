package group3.nick.score.model;



import group3.beef.employee.model.EmployeeVO;
import group3.carrie.app.model.AppVO;
import group3.henry.login.model.MemberVO;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



@Entity 
@Table(name = "Score")
public class ScoreVO implements java.io.Serializable {

	private Integer score_id;
	private Date scoreDate;
//	private Integer mid;
//	private Integer eid;
	private String comment;
	private Integer scores;
	private Integer st;
	private Integer aid;
	//多評論對一位員工
	private EmployeeVO emp ;

	private MemberVO mb;

	

	public ScoreVO() { //必需有一個不傳參數建構子(JavaBean基本知識)
	}
	
	@Id //@Id代表這個屬性是這個Entity的唯一識別屬性，並且對映到Table的主鍵 
	@Column(name = "score_id")  //@Column指這個屬性是對應到資料庫Table的哪一個欄位   //【非必要，但當欄位名稱與屬性名稱不同時則一定要用】
	@SequenceGenerator(name="xxx", allocationSize=1) //1.先用@SequenceGenerator建立一個generator
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="xxx")//2.再用@GeneratedValue的generator屬性指定要用哪個generator //【strategy的GenerationType, 有四種值: AUTO, IDENTITY, SEQUENCE, TABLE】 
	public Integer getScore_id() {
		return score_id;
	}

	public void setScore_id(Integer score_id) {
		this.score_id = score_id;
	}
	
	@Column(name = "score_date" ,insertable=false )
	public Date getScoreDate() {
		return scoreDate;
	}
	public void setScoreDate(Date scoreDate) {
		this.scoreDate = scoreDate;
	}
//	@Column(name = "mid")
//	public Integer getMid() {
//		return mid;
//	}
//	public void setMid(Integer mid) {
//		this.mid = mid;
//	}
//	@Column(name = "eid")
//	public Integer getEid() {
//		return eid;
//	}
//	public void setEid(Integer eid) {
//		this.eid = eid;
//	}
	@Column(name = "comment")
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Column(name = "scores")
	public Integer getScores() {
		return scores;
	}
	public void setScores(Integer scores) {
		this.scores = scores;
	}

	//多評論對一員工
	@ManyToOne
	@JoinColumn(name = "eid")
	public EmployeeVO getEmp() {
		return emp;
	}
	
	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}
	
	//多評論對一會員
	@ManyToOne
	@JoinColumn(name="mid")
	public MemberVO getMb() {
		return mb;
	}
	
	public void setMb(MemberVO mb) {
		this.mb = mb;
	}
	


	@Column(name = "aid")
	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}
	@Column(name = "st" ,insertable=false)
	public Integer getSt() {
		return st;
	}
	
	public void setSt(Integer st) {
		this.st = st;
	}

	
}
