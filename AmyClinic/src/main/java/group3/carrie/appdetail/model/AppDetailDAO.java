package group3.carrie.appdetail.model;

import group3.carrie.app.model.AppVO;
import group3.carrie.proc.model.ProcVO;
import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;


public class AppDetailDAO implements AppDetailDAO_interface {
	private static final String GET_ALL_STMT = "FROM AppDetailVO order by ad_id";
	private static final String DELETE = "DELETE FROM AppDetailVO where ad_id = ?";

	@Override
	public void insert(AppDetailVO appDetailVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(appDetailVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
		
	}

	@Override
	public void update(AppDetailVO appDetailVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(appDetailVO);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
		
	}

	@Override
	public void delete(Integer ad_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(DELETE);
			query.setParameter(0, ad_id);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
		
	}

	@Override
	public AppDetailVO findByPrimaryKey(Integer ad_id) {
		AppDetailVO appDetailVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			appDetailVO = (AppDetailVO) session.get(AppDetailVO.class, ad_id);
			session.getTransaction().commit();
		} catch(RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
		return appDetailVO;
	}

	@Override
	public List<AppDetailVO> getAll() {
		List<AppDetailVO> list = null;
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
	
	public static void main(String[] args) {
		AppDetailDAO dao = new AppDetailDAO();
		ProcVO procVO = new ProcVO();
		AppVO appVO = new AppVO();
		procVO.setProcedure_id(23);
		appVO.setAid(1000);

		// 新增
//		AppDetailVO appDetailVO1 = new AppDetailVO();
//		appDetailVO1.setAppVO(appVO);
//		appDetailVO1.setProcVO(procVO);
//		dao.insert(appDetailVO1);

		// 修改
//		AppDetailVO appDetailVO2 = new AppDetailVO();
//		appDetailVO2.setAd_id(3);
//		appDetailVO2.setAppVO(appVO);
//		appDetailVO2.setProcVO(procVO);
//		dao.update(appDetailVO2);

		// 刪除
//		dao.delete(3);

		// 查單一
//		AppDetailVO appDetailVO3 = dao.findByPrimaryKey(1);
//		System.out.print(appDetailVO3.getAd_id() + ",");
//		System.out.print(appDetailVO3.getProcVO().getName() + ",");
//		System.out.println(appDetailVO3.getAppVO().getAid());
//		System.out.println("----------------------------------");

		// 查全部
		List<AppDetailVO> list = dao.getAll();
		for (AppDetailVO details : list) {
			System.out.print(details.getAd_id() + ",");
			System.out.print(details.getProcVO().getName() + ",");
			System.out.print(details.getAppVO().getAid());
			System.out.println();

		}

	}


}
