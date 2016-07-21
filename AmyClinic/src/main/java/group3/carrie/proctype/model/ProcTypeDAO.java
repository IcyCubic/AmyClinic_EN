package group3.carrie.proctype.model;

import group3.carrie.proc.model.ProcVO;
import hibernate.util.HibernateUtil;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

public class ProcTypeDAO implements ProcTypeDAO_interface {
	private static final String GET_ALL_STMT = "FROM ProcTypeVO order by pType_id";
	private static final String GET_PROC_BYPType_id_STMT ="FROM ProcVO where pType_id = ?";
//	//子查詢有多筆資料時要用in
//	private static final String DELETE_APPDT =
//			"DELETE FROM AppDetailVO where procedure_id in (SELECT procedure_id FROM ProcVO where pType_id = ?)";
//	private static final String DELETE_PROC =
//			"DELETE FROM ProcVO where pType_id = ?";
//	private static final String DELETE_PTYPE =
//		      "DELETE FROM ProcTypeVO where pType_id = ?";
	
	@Override
	public void insert(ProcTypeVO procTypeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(procTypeVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(ProcTypeVO procTypeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(procTypeVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer pType_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		int update_count1 = 0;
//		int update_count2 = 0;
		try {
			session.beginTransaction();
//			//刪預約明細
//			Query query1 = session.createQuery(DELETE_APPDT);
//			query1.setParameter(0, pType_id);
//			update_count1 = query1.executeUpdate();
//			
//			//刪療程
//			Query query2 = session.createQuery(DELETE_PROC);
//			query2.setParameter(0, pType_id);
//			update_count2 = query2.executeUpdate();
//			
//			//刪療程分類
//			Query query3 = session.createQuery(DELETE_PTYPE);
//			query3.setParameter(0, pType_id);
//			query3.executeUpdate();
//			
//			session.getTransaction().commit();
//			System.out.println("刪除療程種類編號" + pType_id + "時，共有" + update_count2 + "個療程被刪除，" + update_count1 + "筆預約明細被刪除");
			
			ProcTypeVO procTypeVO = (ProcTypeVO) session.get(ProcTypeVO.class, pType_id);
			session.delete(procTypeVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public ProcTypeVO findByPrimaryKey(Integer pType_id) {
		ProcTypeVO procTypeVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			procTypeVO = (ProcTypeVO) session.get(ProcTypeVO.class, pType_id);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return procTypeVO;
	}

	@Override
	public List<ProcTypeVO> getAll() {
		List<ProcTypeVO> list = null;
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

	@Override
	public Set<ProcVO> getProcByPType_id(Integer pType_id) {
		Set<ProcVO> set = findByPrimaryKey(pType_id).getProcs();
		return set;
	}
	
	public static void main(String[] args) {
		ProcTypeDAO dao = new ProcTypeDAO();
		
		//新增
//		ProcTypeVO procTypeVO1 = new ProcTypeVO();
//		procTypeVO1.setName("測試用");
//		dao.insert(procTypeVO1);

		//修改
//		ProcTypeVO procTypeVO2 = new ProcTypeVO();
//		procTypeVO2.setpType_id(3);
//		procTypeVO2.setName("測試用011");
//		dao.update(procTypeVO2);
				
		//刪除
//		dao.delete(2);
				
		//查單一
//		ProcTypeVO procTypeVO3 = dao.findByPrimaryKey(1);
//		System.out.print(procTypeVO3.getpType_id() + ",");
//		System.out.println(procTypeVO3.getName());
//		System.out.println("---------------------------------");
				
		//查全部
//		List<ProcTypeVO> list = dao.getAll();
//		for (ProcTypeVO procType : list) {
//			System.out.print(procType.getpType_id() + ",");
//			System.out.print(procType.getName());
//			System.out.println();
//		}
//		查療程
		List<ProcTypeVO> list = dao.getAll();
		for (ProcTypeVO procType : list) {
			System.out.print(procType.getpType_id() + ",");
			System.out.print(procType.getName());
			System.out.println("\n--------------------------");
		Set<ProcVO> set = procType.getProcs();
		for (ProcVO proc : set) {
			System.out.print(proc.getProcedure_id() + ",");
			System.out.print(proc.getName());
			System.out.println();
		}
		System.out.println();
		}		
//		Set<ProcVO> set = procType.getProcs(1);
	}
}