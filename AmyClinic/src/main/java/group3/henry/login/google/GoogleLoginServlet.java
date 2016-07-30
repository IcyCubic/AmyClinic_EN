package group3.henry.login.google;

import group3.henry.global.utility.GetResource;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/GoogleLoginServlet")
public class GoogleLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private File fsaveDirectory;

    public GoogleLoginServlet() {
        super();        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hihi");
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GoogleLoginServlet doPost()");
		String idTokenString = request.getParameter("idtoken");
		this.session = request.getSession(); 
		this.fsaveDirectory = new File(request.getServletContext().getRealPath("/")+"\\user_photo");
		
		System.out.println("fsaveDirectory = " + fsaveDirectory);
		
		System.out.println("idTokenString = " + idTokenString);
		if (idTokenString != null && !idTokenString.isEmpty()){
			GoogleIdVerify verify = new GoogleIdVerify();
			GoogleBean gbean = verify.verify(idTokenString);
			if (gbean != null){				
				MemberServices service = new MemberServices();
				String email = gbean.getEmail();
				
				System.out.println("gbean.getEmail() = " + email);
				MemberVO memberVO = service.emailExists(email);
				if (memberVO != null){	//email already in use || change to find existing member and updating last visit date										
					java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());					
					memberVO.setLast_visit(today);
					memberVO = retrievePhoto(memberVO, gbean);
					service.update(memberVO);
					System.out.println("Google Login: " + email + " already in use, User Updated: " + memberVO.getName());
				} else {
					System.out.println("Google Login: " + email + " not in use, creating new account");
					memberVO = new MemberVO(); // create account					
					memberVO.setName(gbean.getName());
					memberVO.setEmail(email);
					memberVO.setPwd(gbean.getUserId());
					memberVO.setVerify("");
					Date defaultBirthday = new Date(0);
					memberVO.setBirthday(defaultBirthday);
					memberVO.setCountry("");
					memberVO.setAddr("");
					memberVO.setPhone("0000000000");
					memberVO.setGender(' ');
					memberVO.setHeight(0);
					memberVO.setMass(0);
					memberVO.setAct_status(1);
					memberVO.setReward_pts(0);
					memberVO = retrievePhoto(memberVO, gbean);
					service.addMember(memberVO);
					memberVO = service.emailExists(memberVO.getEmail());
					System.out.println("User added: " + memberVO.getName());
				}	
				session.setAttribute("account", memberVO.getName()); //set to logged in
				session.setAttribute("memberVO", memberVO);
																
				String contextPath = getServletContext().getContextPath();
				

				String location = (String)session.getAttribute("location");
		 	    String redirect;
				
				if (location != null) {
		            session.removeAttribute("location");
		            redirect = location;
		        } else {
		        	redirect = getServletContext().getContextPath() +"/web/index.jsp";
		        }
				System.out.println("Google Login servlet redirect URL: "+redirect);
								
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
//				out.write("[{\"success\":\"true\",\"redirect\":\"true\",\"redirectURL\":\""+contextPath+"/index.jsp\"}]");
				out.write("[{\"success\":\"true\",\"redirect\":\"true\",\"redirectURL\":\""+redirect+"\"}]");
				
				out.flush();
				//returns success					
			} else {
				//fail
				session.setAttribute("message", "登入失敗： Google 登入錯誤！");
				RequestDispatcher failureView = request.getRequestDispatcher("/login/login.jsp");
				failureView.forward(request, response);
			}
			
		}
	}

	private MemberVO retrievePhoto(MemberVO memberVO, GoogleBean gbean) {		
		String filename = null;
		GetResource gr = new GetResource(fsaveDirectory,gbean.getPictureUrl());
		try {
			filename = gr.download();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		if (filename!=null && !filename.isEmpty()){
			File original = new File(fsaveDirectory,filename); //photo.jpg
			String ext = filename.substring(filename.indexOf('.'));				
			filename = "img_"+memberVO.getEmail()+ext;			
			File renamed = new File(fsaveDirectory,filename); //img_email@company.com.jpg
			if (renamed.exists()){ //deletes old profile photo if exists
				renamed.delete();
			}
			original.renameTo(renamed); // rename downloaded file to proper format
			memberVO.setPhoto(filename);
		}
		return memberVO;
	}
	
	//validate token (call Google_ID_Verify.java), returns bean if valid, null if not
	//use returned bean to create member in DB 
	//	--alter SQL to only require name and email
	//	--Acquire/Save user photo
	//	--password field...?
	//set new memberVO in session
	//return success
	
}
