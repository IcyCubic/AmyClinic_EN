package group3.nick.score.model;

import java.util.List;

public interface Score_interface {
	public void insert(ScoreVO scoreVO);
	public void update(ScoreVO scoreVO);
	public void delete(Integer score_id);
	public ScoreVO findByPrimaryKey(Integer score_id);
	public List<ScoreVO> getAll();
	public List<ScoreVO> getEmpScore(Integer eid);
	public List<ScoreVO> getAidScore(Integer aid);
	

}
