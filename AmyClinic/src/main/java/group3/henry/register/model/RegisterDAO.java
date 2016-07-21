package group3.henry.register.model;

//DEPRECIATED - NO LONGER USED IN PROJECT
//KEPT FOR REFERENCE ONLY

//
//import group3.henry.login.model.MemberDAO;
//import group3.henry.login.model.MemberVO;
//
//import java.util.*;
//
//import org.hibernate.*;
//import org.hibernate.criterion.Restrictions;
//
//import hibernate.util.HibernateUtil;
//
//public class RegisterDAO implements RegisterDAO_Interface {
//	private MemberDAO dao = new MemberDAO();
	
//	@Override
//	public void addMember(MemberVO memberVO) {	
//		dao.insert(memberVO);
//		return;
//	}

//	@Override
//	public MemberVO emailExists(String email) {		
//		List results = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Criteria cr = session.createCriteria(MemberVO.class);
//			cr.add(Restrictions.eq("email", email));
//			results = cr.list(); 		
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//		System.out.println(results);
//					
//		if (results.isEmpty())
//			return null;		
//		else
//			return (MemberVO)results.get(0);			
//	}
	
	// testing method
//	public static void main(String[] args){
//		RegisterDAO dao = new RegisterDAO();
//		System.out.println("Valid email = " + dao.emailExists("Henry@group3.com"));
//		System.out.println("Invalid email = " + dao.emailExists("I don't exist"));
//	}
//}
