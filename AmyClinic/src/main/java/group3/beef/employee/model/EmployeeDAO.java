package group3.beef.employee.model;

import hibernate.util.HibernateUtil;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class EmployeeDAO implements EmployeeDAO_interface {
	private static final String GET_ALL_STMT = "from EmployeeVO order by eid";
	private static final String FIND_EMP_BY_MAIL = "from EmployeeVO where email=?";
	private static final String GET_BY_NAME_STMT = "from EmployeeVO where name = ?";

	public void insert(EmployeeVO employeeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	public void update(EmployeeVO employeeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	public void delete(Integer eid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			EmployeeVO employeeVO = (EmployeeVO) session.get(EmployeeVO.class,
					eid);
			session.delete(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	public InputStream findEmpPicByPrimaryKey(Integer eid)  {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		InputStream is = null;
		try {
			session.beginTransaction();
			EmployeeVO employeeVO = (EmployeeVO) session.get(EmployeeVO.class,eid);
			 is = employeeVO.getPhoto().getBinaryStream();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return is;
	}

	public EmployeeVO findByPrimaryKey(Integer eid) {
		EmployeeVO employeeVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			employeeVO = (EmployeeVO) session.get(EmployeeVO.class, eid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return employeeVO;
	}
	
	@Override
	public EmployeeVO findByName(String name) {
		EmployeeVO employeeVO = null;
		List<EmployeeVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_NAME_STMT);
			query.setParameter(0, name);
			list = query.list();
			for (EmployeeVO aArray : list) {
				employeeVO = aArray;
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return employeeVO;
	}
	
	public EmployeeVO findByMail(String mail) {
		List<EmployeeVO> list = null;
		EmployeeVO empVO = new EmployeeVO();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(FIND_EMP_BY_MAIL);
			query.setParameter(0, mail);
			list = query.list();
			if(!list.isEmpty()){
				
			for (EmployeeVO aEmp : list) {
				empVO.setEid(aEmp.getEid());
				empVO.setName(aEmp.getName());
				empVO.setPwd(aEmp.getPwd());
				empVO.setEmail(aEmp.getEmail());
				empVO.setPhoto(aEmp.getPhoto());
				empVO.setEducation(aEmp.getEducation());
				empVO.setExperience(aEmp.getExperience());
				empVO.setSpecialty(aEmp.getSpecialty());
				}
			return empVO;
			}
						session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
		
		
		
		
	}

	public List<EmployeeVO> getAll() {
		List<EmployeeVO> list = null;
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
	


//	public static void main(String[] args) {
//		String mail = "jave0925@gmail.com";
//			Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//			try {
//				session.beginTransaction();
//				Query query = session.createQuery("from EmployeeVO where email=?");
//				query.setParameter(0, mail);
//
//				List<EmployeeVO> list = query.list();
//				if(!list.isEmpty()){
//					for (EmployeeVO aEmp : list) {
//						System.out.print(aEmp.getEid() + ",");
//						System.out.print(aEmp.getEmail() + ",");
//						System.out.println();
//						}
//					
//				}else{
//					System.out.println("沒有此帳號!!");
//				}
//				session.getTransaction().commit();
//				
//			} catch (RuntimeException ex) {
//				session.getTransaction().rollback();
//				throw ex;
//			}
//			
//		}
	}

	

