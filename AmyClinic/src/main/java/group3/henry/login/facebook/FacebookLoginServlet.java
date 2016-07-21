package group3.henry.login.facebook;

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

import com.google.gson.Gson;


@WebServlet("/FacebookLoginServlet")
public class FacebookLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private File fsaveDirectory;
 
    public FacebookLoginServlet() {
        super();        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----------------------------");
		System.out.println("FacebookLoginServlet doPost()");		
		this.session = request.getSession(); 
		this.fsaveDirectory = new File(request.getServletContext().getRealPath("/")+"\\user_photo");
		System.out.println("fsaveDirectory = " + fsaveDirectory);
		String json = request.getParameter("data");
		Gson g = new Gson();
		FaceBookBean fbBean = g.fromJson(json, FaceBookBean.class);
		if (null!=fbBean){				
			MemberServices service = new MemberServices();
			String email = fbBean.getEmail();
			System.out.println("fbBean.getEmail() = " + email);
			MemberVO memberVO = service.emailExists(email);
			if (null!=memberVO){
				java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());					
				memberVO.setLast_visit(today);
				memberVO = retrievePhoto(memberVO, fbBean);
				service.update(memberVO);	
				System.out.println("fReward_pts1: " + memberVO.getReward_pts());
				System.out.println("Facebook Login: " + email + " already in use, User Updated: " + memberVO.getName());
			} else {
				System.out.println("Google Login: " + email + " not in use, creating new account");
				memberVO = new MemberVO(); // create account					
				memberVO.setName(fbBean.getName());
				memberVO.setEmail(email);
				memberVO.setPwd(fbBean.getId());
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
				memberVO = retrievePhoto(memberVO, fbBean);
				service.addMember(memberVO);
				memberVO = service.emailExists(memberVO.getEmail());
				System.out.println("User added: " + memberVO.getName());
			}
			session.setAttribute("account", memberVO.getName()); //set to logged in
			session.setAttribute("memberVO", memberVO);
			System.out.println("fReward_pts3: " + memberVO.getReward_pts());
						
			String location = (String)session.getAttribute("location");
	 	    String redirect;
			
			if (location != null) {
	            session.removeAttribute("location");
	            redirect = location;
	        } else {
	        	redirect = getServletContext().getContextPath() +"/index.jsp";
	        }
			System.out.println(redirect);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write("[{\"success\":\"true\",\"redirect\":\"true\",\"redirectURL\":\""+redirect+"\"}]");
			
			out.flush();
			//returns success
		} else {
			//fail
			session.setAttribute("message", "登入失敗： Facebook 登入錯誤！");
			RequestDispatcher failureView = request.getRequestDispatcher("/login/login.jsp");
			failureView.forward(request, response);
		}

	}

	private MemberVO retrievePhoto(MemberVO memberVO, FaceBookBean fbBean) {		
		String filename = null;
		GetResource gr = new GetResource(fsaveDirectory,fbBean.getPicture());
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
			System.out.println("fReward_pts4: " + memberVO.getReward_pts());
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
