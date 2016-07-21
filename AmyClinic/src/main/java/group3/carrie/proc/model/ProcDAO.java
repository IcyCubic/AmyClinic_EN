	package group3.carrie.proc.model;

import group3.carrie.proctype.model.ProcTypeVO;
import group3.carrie.product.model.ProductVO;
import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ProcDAO implements ProcDAO_interface {
	private static final String GET_ALL_STMT =
		      "FROM ProcVO order by procedure_id";
	private static final String DELETE =
		      "DELETE FROM ProcVO where procedure_id = ?";
	private static final String DELETE_APPDT =
		      "DELETE FROM AppDetailVO where procedure_id = ?";

	@Override
	public void insert(ProcVO procVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(procVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(ProcVO procVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(procVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer procedure_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		int update_count_AppDTs = 0;
		try {
			session.beginTransaction();
			
			Query query1 = session.createQuery(DELETE_APPDT);
			query1.setParameter(0, procedure_id);
			update_count_AppDTs = query1.executeUpdate();
			
			Query query2 = session.createQuery(DELETE);
			query2.setParameter(0, procedure_id);
			query2.executeUpdate();
//			ProcVO procVO = (ProcVO) session.get(ProcVO.class, procedure_id);
//			session.delete(procVO);
			session.getTransaction().commit();
			System.out.println("刪除療程編號" + procedure_id + "時，共有" + update_count_AppDTs + "筆預約明細被刪除");
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public ProcVO findByPrimaryKey(Integer procedure_id) {
		ProcVO procVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			procVO = (ProcVO) session.get(ProcVO.class, procedure_id);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return procVO;
	}

	@Override
	public List<ProcVO> getAll() {
		List<ProcVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	//k-----查療程類別所有療程
	private static final String GET_BY_PTYPE_ID = "FROM ProcVO where pType_id = ? order by procedure_id";
	@Override
	public List<ProcVO> findByPType_id(Integer pType_id) {
		List<ProcVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_BY_PTYPE_ID);
			query.setParameter(0, pType_id);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
//k
	public static void main(String[] args) {
		ProcDAO dao = new ProcDAO();
		ProcTypeVO procTypeVO = new ProcTypeVO();
		procTypeVO.setpType_id(2);
		
		//新增
//		ProcVO procVO1 = new ProcVO();
//		procVO1.setName("測試用");
//		procVO1.setProcTypeVO(procTypeVO);
//		dao.insert(procVO1);
		
		//修改
//		ProcVO procVO2 = new ProcVO();
//		procVO2.setName("測試用01");
//		procVO2.setProcTypeVO(procTypeVO);
//		procVO2.setProcedure_id(3);
//		dao.update(procVO2);
				
		//刪除
//		dao.delete(4);
				
		//查單一
//		ProcVO procVO3 = dao.findByPrimaryKey(1);
//		System.out.print(procVO3.getProcedure_id() + ",");
//		System.out.print(procVO3.getName() + ",");
//		System.out.println(procVO3.getProcTypeVO().getName());
//		System.out.println("---------------------------------");
				
		//查全部
		List<ProcVO> list = dao.findByPType_id(2);
		for (ProcVO proc : list) {
			System.out.print(proc.getProcedure_id() + ",");
			System.out.print(proc.getName() + ",");
			System.out.print(proc.getProcTypeVO().getName());
			System.out.println();
		}

	}


}
