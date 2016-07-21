package group3.henry.login.model;

/*
 Hibernate is providing a factory.getCurrentSession() method for retrieving the current session. A
 new session is opened for the first time of calling this method, and closed when the transaction is
 finished, no matter commit or rollback. But what does it mean by the ��current session��? We need to
 tell Hibernate that it should be the session bound with the current thread.

 <hibernate-configuration>
 <session-factory>
 ...
 <property name="current_session_context_class">thread</property>
 ...
 </session-factory>
 </hibernate-configuration>

 */

import org.hibernate.*;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.app.model.AppVO;
import hibernate.util.HibernateUtil;

import java.util.*;

public class MemberDAO implements MemberDAO_interface {

	private static final String GET_ALL_STMT = "from MemberVO order by mid";

	@Override
	public void insert(MemberVO memberVO) {
		update(memberVO);
	}

	@Override
	public void update(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}
	
	

	@Override
	public void delete(Integer mid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			MemberVO memberVO = (MemberVO) session.get(MemberVO.class, mid);
			session.delete(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public MemberVO findByPrimaryKey(Integer mid) {
		MemberVO memberVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memberVO = (MemberVO) session.get(MemberVO.class, mid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberVO;
	}

//k
	@Override
	public List<MemberVO> findName(String name) {
//		MemberVO memberVO = null;
		List<MemberVO> list=null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery("from MemberVO where name=?");
			query .setParameter(0, name);
			list=query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}	
//k

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = null;
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

//	@Override
//	public Set<EmpVO> getEmpsByDeptno(Integer deptno) {		
//		Set<EmpVO>	set = findByPrimaryKeys(deptno).getEmps();
//		return set;
//	}
//
//	public static void main(String[] args) {
//
//		MemberDAO dao = new MemberDAO();
//		List<MemberVO> m= dao.findName("K");
//		for(MemberVO t:m){
////			m.iterator();
//			System.out.println(t.getPhone());
//		}
		
		//�� �s�W-1(�@��dept2.hbm.xml������cascade="save-update" ��cascade="all"���]�w)(���M�j�j,���L��ȤW�ä��`��)(��,�i�Φb�q��D�ɻP�����ɤ@���s�W���\)
//		DeptVO deptVO = new DeptVO(); // ����POJO
//		Set<EmpVO> set = new HashSet<EmpVO>();// �ǳƸm�J���u�ƤH,�H�Kcascade="save-update"������
//
//		EmpVO empXX = new EmpVO();   // ���uPOJO1
//		empXX.setEname("�d15");
//		empXX.setJob("MANAGER15");
//		empXX.setHiredate(java.sql.Date.valueOf("2001-01-15"));
//		empXX.setSal(new Double(15000));
//		empXX.setComm(new Double(150));
//		empXX.setDeptVO(deptVO);
//
//		EmpVO empYY = new EmpVO();   // ���uPOJO2
//		empYY.setEname("�d16");
//		empYY.setJob("MANAGER16");
//		empYY.setHiredate(java.sql.Date.valueOf("2001-01-16"));
//		empYY.setSal(new Double(16000));
//		empYY.setComm(new Double(160));
//		empYY.setDeptVO(deptVO);
//
//		set.add(empXX);
//		set.add(empYY);
//
//		deptVO.setDname("�s�y��");
//		deptVO.setLoc("���ꦿ��");
//		deptVO.setEmps(set);
//		dao.insert(deptVO);



		//�� �ק�-1(�@��dept2.hbm.xml������cascade="save-update" �� cascade="all"���]�w)(���M�j�j,���L��ȤW�ä��`��)(��,�i�����p�ϥΤ�)
//		DeptVO deptVO = new DeptVO(); // ����POJO
//		Set<EmpVO> set = new HashSet<EmpVO>(); // �ǳƸm�J���u�ƤH,�H�Kcascade="save-update"������
//
//		EmpVO empXX = new EmpVO(); // ���uPOJO1
//		empXX.setEmpno(7015); // �i�p�G�W�[ empXX.setEmpno(7015); �h�ܦ�update�j
//		empXX.setEname("�d��15");
//		empXX.setJob("MANAGER15");
//		empXX.setHiredate(java.sql.Date.valueOf("2001-01-15"));
//		empXX.setSal(new Double(15555));
//		empXX.setComm(new Double(155));
//		empXX.setDeptVO(deptVO);
//
//		EmpVO empYY = new EmpVO(); // ���uPOJO2
//		empYY.setEmpno(7016); // �i�p�G�W�[ empXX.setEmpno(7016); �h�ܦ�update�j
//		empYY.setEname("�d��16");
//		empYY.setJob("MANAGER16");
//		empYY.setHiredate(java.sql.Date.valueOf("2001-01-16"));
//		empYY.setSal(new Double(16666));
//		empYY.setComm(new Double(166));
//		empYY.setDeptVO(deptVO);
//
//		set.add(empXX);
//		set.add(empYY);
//
//		deptVO.setDeptno(50); // �i�p�G�W�[deptVO.setDeptno(50); �h�ܦ�update�j
//		deptVO.setDname("�s�y��1");
//		deptVO.setLoc("���ꦿ��1");
//		deptVO.setEmps(set);
//		dao.update(deptVO);



		//�� �ק�-2(���ݳ]�wcascade="save-update" �� cascade="all")(�o�O�g�`�n�Ψ쪺�@��ק�)
//		DeptVO deptVO2 = new DeptVO(); // ����POJO
//		deptVO2.setDeptno(50); // �i�p�G�W�[deptVO.setDeptno(50); �h�ܦ�update�j
//		deptVO2.setDname("�s�y��2");
//		deptVO2.setLoc("���ꦿ��2");
//		dao.update(deptVO2);



		//���R�� (�W�űj�j!�p�ߨϥ�!)(�@��dept2.hbm.xml������cascade="delete" �� cascade="all"���]�w, �A�[�Winverse="true"�]�w)
//		dao.delete(50);



		//�� �s�W-2(���ݭncascade="save-update" �� cascade="all"���]�w)(�o�O�g�`�n�Ψ쪺�@��s�W)
//		DeptVO deptVO = new DeptVO(); // ����POJO
//		deptVO.setDname("�s�y��s");
//		deptVO.setLoc("���ꦿ��s");
//		dao.insert(deptVO);



		//�� �d��-findByPrimaryKey (�u�q!) (�@��dept2.hbm.xml�����]��lazy="false")
//		DeptVO deptVO3 = dao.findByPrimaryKey(30);
//		System.out.print(deptVO3.getDeptno() + ",");
//		System.out.print(deptVO3.getDname() + ",");
//		System.out.print(deptVO3.getLoc());
//		System.out.println("\n-----------------");
//		Set<EmpVO> set3 = deptVO3.getEmps();
//		for (EmpVO aEmp : set3) {
//			System.out.print(aEmp.getEmpno() + ",");
//			System.out.print(aEmp.getEname() + ",");
//			System.out.print(aEmp.getJob() + ",");
//			System.out.print(aEmp.getHiredate() + ",");
//			System.out.print(aEmp.getSal() + ",");
//			System.out.print(aEmp.getComm() + ",");
//			System.out.print(aEmp.getDeptVO().getDeptno() + ",");
//			System.out.print(aEmp.getDeptVO().getDname() + ",");
//			System.out.print(aEmp.getDeptVO().getLoc());
//			System.out.println();
//		}



		//�� �d��-getAll-1 (�@��dept2.hbm.xml���γ]��lazy="false",�]���S�Ψ�h�誺����)
//		List<DeptVO> list1 = dao.getAll();
//		for (DeptVO aDept : list1) {
//			System.out.print(aDept.getDeptno() + ",");
//			System.out.print(aDept.getDname() + ",");
//			System.out.print(aDept.getLoc());
//			System.out.println();
//		}



		//�� �d��-getAll-2 (�u�q!!!) (�@��dept2.hbm.xml�����]��lazy="false")
//		List<MemberVO> list2 = dao.getAll();
//		for (MemberVO aMember : list2) {
//			System.out.print(aMember.getMid() + ",");
//			System.out.print(aMember.getName() + ",");
//			System.out.print(aMember.getEmail() + ",");
//			System.out.print(aMember.getPwd() + ",");
//			System.out.print(aMember.getPhone() + ",");
//			System.out.print(aMember.getAddr() + ",");
//			System.out.print(aMember.getJoin_date() + ",");
//
//			
//			System.out.println("\n-----------------");
//			Set<AppVO> set2 = aMember.getAppVO();
//			System.out.println(set2);
//			for (AppVO anApp : set2) {
//				System.out.print(aEmp.getEmpno() + ",");
//				System.out.print(aEmp.getEname() + ",");
//				System.out.print(aEmp.getJob() + ",");
//				System.out.print(aEmp.getHiredate() + ",");
//				System.out.print(aEmp.getSal() + ",");
//				System.out.print(aEmp.getComm() + ",");
//				System.out.print(aEmp.getDeptVO().getDeptno() + ",");
//				System.out.print(aEmp.getDeptVO().getDname() + ",");
//				System.out.print(aEmp.getDeptVO().getLoc());
//				System.out.println();
//			}
//			System.out.println();
//		}

	}

