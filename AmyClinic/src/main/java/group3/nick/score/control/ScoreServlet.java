package group3.nick.score.control;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.carrie.app.model.AppService;
import group3.carrie.app.model.AppVO;
import group3.henry.login.model.MemberVO;
import group3.nick.score.model.ScoreService;
import group3.nick.score.model.ScoreVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;


@WebServlet("/Score/ScoreServlet")
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScoreServlet() {
        super();

    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		HttpSession session =req.getSession(false);
		//對應Score Table的Service方法				聊天
		ScoreService daoScore = new ScoreService();
		//對應EmployeeService Table的Service方法	員工
		EmployeeService	dao=new EmployeeService();
		//對應AppService Table的Service方法		預約
		AppService appDao   = new AppService(); 
		

		
//============顯現一開始Score.jsp的畫面=========================		
		//JSON 回傳資料
		if ("getEmpScore".equals(action)){
			List<EmployeeVO> emp =dao.getAll();
			List l1 = new LinkedList();
			for(EmployeeVO empvo :emp ){
				Map m1 = new HashMap();
				m1.put("eid", empvo.getEid());
				m1.put("name", empvo.getName());
				List<ScoreVO> scoreVO=daoScore.getEmpScore(empvo.getEid());
				//呼叫底下的方法 AVG 跟 ChooseStar
				double avgScore=AVG(scoreVO);
				String avgPicture=ChooseStar(avgScore);
				m1.put("avgScore",avgScore );
				m1.put("avgPicture",avgPicture );
				l1.add(m1);
			}
			String jsonString = JSONValue.toJSONString(l1);
			out.println(jsonString);

			}
		
		
		
		// getOneScore  JSON版   回傳資料
		if ("getOne_ScoreJSON".equals(action)){
			List l1 = new LinkedList();
			String seid=req.getParameter("eid");
			int eid=Integer.parseInt(seid);
			List<ScoreVO> scoreVO =daoScore.getEmpScore(eid);
			Map m1 = new HashMap();
			double avgScore=AVG(scoreVO);
			String avgPicture=ChooseStar(avgScore);
			m1.put("eid",eid);
			m1.put("avgScore",avgScore );
			m1.put("avgPicture",avgPicture );
			l1.add(m1);
			String jsonString = JSONValue.toJSONString(l1);
			out.println(jsonString);

			}
		
		
//查詢單一位員工的所有流言及評分		
		if ("getOne_Score".equals(action)){
			String sEid=req.getParameter("eid");
			int eid=Integer.parseInt(sEid);

			//查詢該員工在評分清單裡的資料
			List<ScoreVO> scoreVO =daoScore.getEmpScore(eid);
			
			//查詢該員工的基本資料
			EmployeeVO employeeVO=dao.getOneEmployee(eid);
			
			double avgScore=AVG(scoreVO);
			String avgPicture=ChooseStar(avgScore);
			req.setAttribute("avgPicture",avgPicture);
			req.setAttribute("avgScore",avgScore);
			req.setAttribute("scoreVO", scoreVO);
			req.setAttribute("employeeVO",employeeVO);
			String str = "/Score/ListOneScore.jsp";
			RequestDispatcher rd= req.getRequestDispatcher(str);
			rd.forward(req, res);
		}

//在預約歷史紀錄 顯現撰寫評論or修改評論
		if ("add_score".equals(action)){
			MemberVO mb = (MemberVO) session.getAttribute("memberVO");
			List<AppVO> appVOs = appDao.findByMid_BF(mb.getMid());
			List l1 = new LinkedList();
			for(AppVO appVO:appVOs){
				Map m1 = new HashMap();
				m1.put("eid", appVO.getEmployeeVO().getEid());
				//如果該預約記錄已經評論過 就給flase(撰寫評論)  否 則給true(修改評論)
				if (daoScore.getAidScore(appVO.getAid()).size() != 0) {
					m1.put("ok",false);
				}else{
					m1.put("ok",true);
					List<ScoreVO> lu=daoScore.getAidScore(appVO.getAid());
					for(ScoreVO ss:lu){
						m1.put("ScoreDate", ss.getScoreDate());
					}
				}
				m1.put("eid", appVO.getEmployeeVO().getEid());
				m1.put("aid",appVO.getAid());
				l1.add(m1);
			}
			String jsonString = JSONValue.toJSONString(l1);
//			System.out.println(jsonString);
			out.println(jsonString);
		}
		

//撰寫評論		
		if ("gotoAddScore".equals(action)){
			req.setAttribute("eid", req.getParameter("eid")); 
			req.setAttribute("aid", req.getParameter("aid")); 
			String str="/Score/addScore.jsp";
			RequestDispatcher rd= req.getRequestDispatcher(str);
			rd.forward(req, res);
		}
	
//確定新增該筆評論
		if("addNewComment".equals(action)){
		String seid =req.getParameter("eid");
		int eid = Integer.parseInt(seid);
		MemberVO memberVO =(MemberVO) session.getAttribute("memberVO");
		int mid = memberVO.getMid();
		String said= req.getParameter("aid");
		int aid = Integer.parseInt(said);
		String sscores = req.getParameter("score");
		int	score = Integer.parseInt(sscores);
		String comment = req.getParameter("comment");
		daoScore.addScore(comment, score, eid, mid,aid);
		session.removeAttribute("ScoreEid");
		session.setAttribute("ScoreEid", eid);
		res.sendRedirect(req.getContextPath()+"/Score/waitToForward.jsp");
		}
		
//前往修改該則評論		
		if("gotoAdjustScore".equals(action)){
			String said=req.getParameter("aid");
			int aid = Integer.parseInt(said);
			List<ScoreVO> L1=daoScore.getAidScore(aid);
			for(ScoreVO scoreVO:L1){
				req.setAttribute("score_id",scoreVO.getScore_id());
				req.setAttribute("scores",scoreVO.getScores());
				req.setAttribute("comment",scoreVO.getComment());
			}
			RequestDispatcher rd=req.getRequestDispatcher("/Score/adjustScore.jsp");
			rd.forward(req,res);
		}
		

//確認修改該則評論		
		if("adjustComment".equals(action)){
			String sscore_id=req.getParameter("score_id");
			int score_id=Integer.parseInt(sscore_id);
			ScoreVO scoreVO=daoScore.findMyScore(score_id);
			scoreVO.setScoreDate(new java.sql.Date(new Date().getTime()));
			String sscores=req.getParameter("score");
			int scores=Integer.parseInt(sscores);
			String comment=req.getParameter("comment");
			scoreVO.setComment(comment);
			scoreVO.setScores(scores);
			daoScore.updateScore(scoreVO);
			session.removeAttribute("ScoreEid");
			session.setAttribute("ScoreEid", scoreVO.getEmp().getEid());
			res.sendRedirect(req.getContextPath()+"/Score/waitToForward.jsp");
		}
		
		
		//後台List 全部評論
		if("ListAllScores".equals(action)){
			List<ScoreVO> li=daoScore.getAll();
			List l1 = new LinkedList();
			for(ScoreVO scoreVO :li){
				Map m1 = new HashMap();
				m1.put("MebName", scoreVO.getMb().getName());
				m1.put("EmpName", scoreVO.getEmp().getName());
				m1.put("Eid", scoreVO.getEmp().getEid());
				m1.put("Score", scoreVO.getScores());
				m1.put("Comment", scoreVO.getComment());
				m1.put("ScoreDate", scoreVO.getScoreDate().toString());
				m1.put("St", scoreVO.getSt());
				m1.put("ScoreId", scoreVO.getScore_id());
				l1.add(m1);
				
			}
			String jsonString = JSONValue.toJSONString(l1);
			out.println(jsonString);
			
		}
		
		//後台修改評論狀態		
				if("adjustSt".equals(action)){
					String sscore_id=req.getParameter("scoreId");
					String sst=req.getParameter("st");
					int st=Integer.parseInt(sst);
					int score_id=Integer.parseInt(sscore_id);
					ScoreVO scoreVO=daoScore.findMyScore(score_id);
					scoreVO.setSt(st);
					daoScore.updateScore(scoreVO);
					res.sendRedirect(req.getContextPath()+"/Backstage/backgroundScore.jsp");
				}
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	//=======計算平均星數的方法
	
	public double AVG (List<ScoreVO> scoreVO){
				//算總平均
				int times =0;
				double sum = 0;
				double avg =0;
				for(ScoreVO score : scoreVO){
					sum += score.getScores();
					times++;
				}
				//判斷是否有被評論過的紀錄
				if(times !=0){
				avg = (sum/times);
				String s=new Double(avg).toString().substring(0,3);
				Double	x =new Double(s);
				return x;
				
				}else{
					return 0;
				}

			}
	
	public String ChooseStar(double avg){
		//平均星數 給哪張圖片
		if(avg<0.5){
			return "0star.jpg";
		}else if(avg<1.5){
			return "1star.jpg";
		}else if(avg<2.5){
			return "2star.jpg";
		}else if (avg<3.5){
			return "3star.jpg";
		}else if(avg<4.5){
			return "4star.jpg";
		}else{
			return "5star.jpg";
		}
	}
	
	}


