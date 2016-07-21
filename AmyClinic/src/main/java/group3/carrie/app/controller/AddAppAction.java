package group3.carrie.app.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.carrie.app.model.AppService;
import group3.carrie.app.model.AppVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.carrie.proc.model.ProcService;
import group3.carrie.proc.model.ProcVO;
import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;
import group3.henry.global.utility.Mailer;
import group3.henry.login.model.MemberVO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 將資料送到後端
 */
public class AddAppAction extends ActionSupport {
	private static final String HEADER = "AmyClinic 預約完成通知信";
	private Integer purpose;
	private String s_app_time;
	private String[] proc;
	private String descrip;
	private String ename;
	private Integer id;
	private String message_time;
	private String message_proc;
	
	public String getMessage_time() {
		return message_time;
	}

	public void setMessage_time(String message_time) {
		this.message_time = message_time;
	}

	public String getMessage_proc() {
		return message_proc;
	}

	public void setMessage_proc(String message_proc) {
		this.message_proc = message_proc;
	}

	public Integer getPurpose() {
		return purpose;
	}

	public void setPurpose(Integer purpose) {
		this.purpose = purpose;
	}

	public String getS_app_time() {
		return s_app_time;
	}

	public void setS_app_time(String s_app_time) {
		this.s_app_time = s_app_time;
	}

	public String[] getProc() {
		return proc;
	}

	public void setProc(String[] proc) {
		this.proc = proc;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String execute() {
		String st = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		MemberVO mb = (MemberVO) session.getAttribute("memberVO");
		if (mb == null) {
			System.out.println("沒mb");
			return "failure";
		}
		
			
		String dateStr = s_app_time.substring(0, s_app_time.indexOf("　"));
		Date date = Date.valueOf(dateStr);
		String time = s_app_time.substring(s_app_time.lastIndexOf("　") + 1);
		
		Set<AppDetailVO> set = new HashSet<AppDetailVO>();
		if (purpose == 0) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < proc.length; i++) {
				if (i != proc.length-1) {
					sb.append(proc[i] + ",");
				} else if (i == proc.length-1) {
					sb.append(proc[i]);
				}
			}
			st = sb.toString();
			List<Integer> procVal = new ArrayList<Integer>();
			for (String p : proc) {
				Integer id = Integer.parseInt(p);
				procVal.add(id);
			}
			ProcService procServ = new ProcService();
			for (Integer i : procVal) {
				ProcVO procVO = procServ.getOneProc(i);
				AppDetailVO appdtVO = new AppDetailVO(procVO);
				set.add(appdtVO);
			}
		}
		
		// 更改排班表的狀態
		ScheduleService scheServ = new ScheduleService();
		ScheduleVO scheVO = scheServ.findByPrimaryKey(id);
		Integer appt_num = scheVO.getAppt_num();
		
		// 如果有別人先讓預約數滿了，就回到預約頁面
		if (appt_num >= 3) {
			request.setAttribute("descrip", descrip);
			setMessage_time("預約人數已滿");
			return "appfail";
		}
		scheVO.setAppt_num(scheVO.getAppt_num() + 1);
		
		AppService appServ = new AppService();
		// 避免會員重複預約同時段
		if (appServ.findByMid_Date_Time(mb.getMid(), date, time).size() != 0) {
			request.setAttribute("descrip", descrip);
			setMessage_time("重複預約");
			return "appfail";
		}
		
		// 如果預約人數滿了，就將預約狀態改為不可預約
		if (scheVO.getAppt_num() >= 3) {
			scheVO.setAppt_status(0);
		}
		scheServ.updateSchedule(scheVO);
		
		EmployeeService empServ = new EmployeeService();
		EmployeeVO empVO = empServ.getOneEmployee(ename);

		// 全部塞進AppVO內
		AppVO appVO = appServ.addApp(mb, purpose, date, time, descrip, empVO, set);
		
		// 寄出通知信給使用者
		Mailer m = new Mailer();
		String msg = msgForEmail(mb, empVO, s_app_time, appVO);
		try {
			m.send(mb.getName(), mb.getEmail(), HEADER, msg, "HTML");
		} catch(Exception e) {
			request.setAttribute("empVO", empVO);
			return ERROR;
		}
		// 準備轉交
		request.setAttribute("s_app_time", s_app_time);
		request.setAttribute("appVO", appVO);
		request.setAttribute("empVO", empVO);
		return SUCCESS;
		
	}

	protected String msgForEmail(MemberVO mb,EmployeeVO empVO,String s_app_time,AppVO appVO) {
		String msg = "";
		StringBuffer msgBuffer = new StringBuffer();
		msgBuffer.append("<br>感謝您使用愛美診所的線上預約看診功能，您的預約已完成<br><br>");
		msgBuffer.append("姓名：" + mb.getName() + "<br>");
		msgBuffer.append("電話：" + mb.getPhone() + "<br>");
		msgBuffer.append("E-mail：" + mb.getEmail() + "<br>");
		if (appVO.getPurpose() == 0) {
			msgBuffer.append("預約目的：開始新療程<br>");
			msgBuffer.append("你所選擇的療程：");
			Set<AppDetailVO> appDetails = appVO.getAppDetails();
			AppDetailVO[] appDetailArray = (AppDetailVO[])appDetails.toArray(new AppDetailVO[0]);
			for(int i = 0; i < appDetailArray.length; i++ ) {
				if (i != appDetailArray.length - 1) {
					msgBuffer.append(appDetailArray[i].getProcVO().getName() + "、");
				} else if (i == appDetailArray.length - 1) {
					msgBuffer.append(appDetailArray[i].getProcVO().getName() + "<br>");
				}
				
			}
		} else if (appVO.getPurpose() == 1) {
			msgBuffer.append("預約目的：回診<br>");
		}
		if (!appVO.getDescrip().equals("")) {
			msgBuffer.append("預約描述：" + appVO.getDescrip() + "<br>");
		}
		msgBuffer.append("預約時間：" + s_app_time + "<br>");
		msgBuffer.append("醫師：" + empVO.getName() + "<br><br><br>");
		
		msg = msgBuffer.toString();
		return msg;
		
	}
	
	public void validate() {
		if (s_app_time == null || s_app_time.trim().length() == 0) {
			System.out.println("沒有預約時間");
			setMessage_time("請選擇預約時間");
			super.addFieldError("s_app_time", "請選擇預約時間");
		}
		
		if (purpose == 0) {
			System.out.println(proc);
			if (proc == null || proc.length == 0) {
				System.out.println("我執行了");
				setMessage_proc("請選擇療程");
				super.addFieldError("proc", "請選擇療程");
			}
		}
		
	}

}
