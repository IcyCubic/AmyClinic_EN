package group3.nick.score.model;

import group3.beef.employee.model.EmployeeVO;
import group3.henry.login.model.MemberVO;

import java.sql.Date;
import java.util.List;

public class ScoreService {

	private Score_interface dao;
	
	public ScoreService() {
		dao = new ScoreHibernateDAO();
	}
	//增加一筆評論
	public void addScore(String comment,Integer scores,Integer eid,Integer mid,Integer aid){
		ScoreVO scoreVO=new ScoreVO();
		EmployeeVO empVO = new EmployeeVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setMid(mid);
		empVO.setEid(eid);
		scoreVO.setComment(comment);
		scoreVO.setEmp(empVO);
		scoreVO.setMb(memberVO);
		scoreVO.setScores(scores);
		scoreVO.setAid(aid);
		dao.insert(scoreVO);
		
	}
	
	//刪除一筆評論
	public void deleteScore(Integer score_id){
		dao.delete(score_id);
		
	}
	//修改一則評論
	public void updateScore(ScoreVO scoreVO){
//		ScoreVO scoreVO = new ScoreVO();
//		EmployeeVO empVO = new EmployeeVO();
//		MemberVO memberVO = new MemberVO();
//		memberVO.setMid(mid);
//		empVO.setEid(eid);
//		scoreVO.setComment(comment);
//		scoreVO.setEmp(empVO);
//		scoreVO.setMb(memberVO);
//		scoreVO.setScores(scores);
//		scoreVO.setAid(aid);
//		scoreVO.setScore_id(score_id);
		dao.update(scoreVO);
		
	}
	//找到自己的評論
	public ScoreVO findMyScore(Integer score_id){
		return dao.findByPrimaryKey(score_id);

	}
	
	//看到全部評論
	public List<ScoreVO> getAll(){
		return dao.getAll();
	}
	
	//列出某位員工的留言
	public List<ScoreVO> getEmpScore(Integer eid){
		
		return dao.getEmpScore(eid);
	}
	
	//查看某個評分的紀錄
	public List<ScoreVO> getAidScore(Integer aid) {
		return dao.getAidScore(aid);
	}
	
	
	
	
	
	
	
	
	
	
	
}
