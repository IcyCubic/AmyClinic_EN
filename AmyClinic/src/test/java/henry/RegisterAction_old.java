package henry;


import java.io.File;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import group3.henry.global.utility.Mailer;
import group3.henry.global.utility.TokenGenerator;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction_old extends ActionSupport{
	private static final String HEADER = "AmyClinic Registration Confirmation";
	private MemberVO memberVO;	
	private String message;
	private File   fileUpload;            //Struts 2 將上傳的原始檔案，封裝到此(xxx)暫時File物件變數，暫時保存到伺服器的臨時目錄區，所以上傳後 Struts 2 會將之刪除
	private String fileUploadContentType; //Struts 2 將上傳的檔案類型，設定到此(xxxContentType)String 變數
	private String fileUploadFileName;    //Struts 2 將上傳的原始檔名，設定到此(xxxFileName)   String 變數
	private String saveDirectory;         //自訂上傳的目地目錄 (可同步定義於struts.xml內)

	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public File getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}
	public String getFileUploadContentType() {
		return fileUploadContentType;
	}
	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}
	public String getFileUploadFileName() {
		return fileUploadFileName;
	}
	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	public String getSaveDirectory() {
		return saveDirectory;
	}
	public void setSaveDirectory(String saveDirectory) {
		this.saveDirectory = saveDirectory;
	}
	
	private String compose(String token, String email){
		String nl = System.getProperty("line.separator");
		return "Thank you for registering on our site! Please click the link below to validate your email!" 
				+ nl + nl + "http://localhost:8080/AmyClinic/free/verify.action?auth=" + token + "&email=" + email;			
	}
	
	public String register(){
		MemberServices register = new MemberServices();
		Mailer m = new Mailer();
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(register.emailExists(memberVO.getEmail()));
		TokenGenerator gen = new TokenGenerator();
		
		if (register.emailExists(memberVO.getEmail())!=null){ // check if email already exists in DB (Unique field)
			this.setMessage("This Email " +memberVO.getEmail() + " has already been registered!");
			System.out.println("Email in use");
			return INPUT;
		} else {
			if (request.getAttribute("encpw")!=null)
				memberVO.setPwd((String)request.getAttribute("encpw")); // sets user pw to encrypted version
			System.out.println(memberVO.getEmail() + " has not been registered.");
												
			File fsaveDirectory = new File(request.getServletContext().getRealPath("/")+saveDirectory);
			if (!fsaveDirectory.exists()) fsaveDirectory.mkdirs(); // Create save directory if it does not exist	
			System.out.println("Photo save directory: "+fsaveDirectory);
			
			if (fileUploadFileName!=null && !fileUploadFileName.isEmpty()){
				String ext = fileUploadFileName.substring(fileUploadFileName.indexOf('.'));				
				fileUploadFileName = "img_"+memberVO.getEmail()+ext;
				File file2 = new File(fsaveDirectory,fileUploadFileName);
				fileUpload.renameTo(file2); // relocate temp file to saveDirectory
				memberVO.setPhoto(fileUploadFileName);
			}
			
//			File file = memberVO.getPhoto(); //this is the uploaded photo
//			byte[] data;
//			FileInputStream is=null;
//			try{
//				is = new FileInputStream(file);
//				data = new byte[is.available()];
//				is.read(data);
//				is.close();
//			} catch (Exception e){
//				e.printStackTrace();
//			} finally {
//				try {
//					is.close();
//				} catch (IOException e) {}
//			}
			
			memberVO.setAct_status(2); // status of 2 = awaiting email verification			
			java.sql.Date today = new java.sql.Date(Calendar.getInstance().getTime().getTime()); //get today's date in java.sql.Date format
			memberVO.setLast_visit(today); // initial values
			memberVO.setNum_trans(0);
			memberVO.setNum_treatment(0);
			memberVO.setNum_visits(0);
			memberVO.setTotal_spent(0);
			memberVO.setReward_pts(0);
			memberVO.setSpent_pts(0);
			memberVO.setMemo("");
			String token = gen.secureToken().toUpperCase(); // generates verification token
			memberVO.setVerify(token);		// stores token in current memberVO

			//sends verification email
			m.send(memberVO.getName(), memberVO.getEmail(), HEADER, compose(token, memberVO.getEmail()));
			
			register.addMember(memberVO); // inserts newly registered member
			
			return SUCCESS;	
		}
		
	}
	public void validate() { // validates if the uploaded file type is an image
		String fileType = fileUploadContentType;
		if (fileType != null){
			fileType = fileType.substring(0,5);
			System.out.println(fileType);
		    if (!fileType.equals("image") ){
		    	addFieldError("fileUpload","Invalid File Type; must upload an image!");
		    }
	    }	     
	}
}
