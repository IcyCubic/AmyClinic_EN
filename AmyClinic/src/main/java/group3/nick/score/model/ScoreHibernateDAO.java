package group3.nick.score.model;

import group3.beef.employee.model.EmployeeVO;
import group3.henry.login.model.MemberVO;
import hibernate.util.HibernateUtil;

import org.hibernate.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javassist.compiler.MemberCodeGen;

public class ScoreHibernateDAO implements Score_interface {
	
	@Override
	public List<ScoreVO> getAidScore(Integer aid) {
		List<ScoreVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery("from ScoreVO where aid=? order by scoreDate ");
			query.setParameter(0, aid);
			list = query.list();
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
		}
		
		return list;
	}
	
	private static final String GET_ALL_STMT = "from ScoreVO order by score_id";

	@Override
	public void insert(ScoreVO scoreVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scoreVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(ScoreVO scoreVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scoreVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer score_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete ScoreVO where score_id=?");
			query.setParameter(0, score_id);
			System.out.println("刪除的筆數=" + query.executeUpdate());
			session.getTransaction().commit();
		}
			catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		
	}

	@Override
	public ScoreVO findByPrimaryKey(Integer score_id) {
		ScoreVO scoreVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			scoreVO = (ScoreVO) session.get(ScoreVO.class, score_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return scoreVO;
	}

	@Override
	public List<ScoreVO> getAll() {
		List<ScoreVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	
	}
	@Override
	public List<ScoreVO> getEmpScore(Integer eid){
		List<ScoreVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try{
			session.beginTransaction();
			Query query = session.createQuery("from ScoreVO where eid=? order by scoreDate desc");
			query.setParameter(0, eid);
			list = query.list();
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
		}
		
		return list;
	}
	
	
////測試用	
//	public static void main(String[] args) {
//		ScoreHibernateDAO dao 	= new ScoreHibernateDAO();
//		ScoreVO scorevo = new ScoreVO();

//		MemberVO memberVO = new MemberVO();
//		EmployeeVO employeeVO = new EmployeeVO();
//=====================		
		
//		scorevo.setComment("想吃飯");
//		employeeVO.setEid(3);
//		scorevo.setEmp(employeeVO);
//		memberVO.setMid(1000);
//		scorevo.setMb(memberVO);
//		scorevo.setScores(2);
//		scorevo.setComment("廢物畫多");
//		scorevo.setScoreDate(java.sql.Date.valueOf("1991-08-01"));
//		dao.insert(scorevo);
		
//=============
//		
//		List<ScoreVO> list=dao.getAidScore(1009);
//		for( ScoreVO test: list){
//			System.out.println(test.getEmp().getName());
//			System.out.println(test.getComment());
//			System.out.println(test.getScore_id());
//			System.out.println(test.getMb().getName());
//			System.out.println(test.getScoreDate());
//			System.out.println(test.getAid());
//			System.out.println(test.getSt());
//			System.out.println("=================");
//		}
//		
//		
//		
//		
//	
//		
//	}
}
