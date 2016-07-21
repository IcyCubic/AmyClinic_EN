package group3.henry.login.controller;

import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class EditProfileAction extends ActionSupport {
	private MemberVO memberVO;
	private String message;
	private File   fileUpload;            //Struts 2 將上傳的原始檔案，封裝到此(xxx)暫時File物件變數，暫時保存到伺服器的臨時目錄區，所以上傳後 Struts 2 會將之刪除
	private String fileUploadContentType; //Struts 2 將上傳的檔案類型，設定到此(xxxContentType)String 變數
	private String fileUploadFileName;    //Struts 2 將上傳的原始檔名，設定到此(xxxFileName)   String 變數
	private String saveDirectory;         //自訂上傳的目地目錄 (可同步定義於struts.xml內)

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
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

	// Enables login check
	public String execute() {		
		System.out.println("EditProfileAction execute()");		
		return SUCCESS;
	}

	public String update() {
		System.out.println("EditProfileAction update()");
//		System.out.println(memberVO.getMid());
//		System.out.println(memberVO.getName());
//		System.out.println(memberVO.getPwd());
//		System.out.println(memberVO.getAddr());

		HttpServletRequest request = ServletActionContext.getRequest();
		MemberServices service = new MemberServices();
//		memberVO.setPwd((String)request.getAttribute("encpw")); // sets the encrypted version of the updated password
		service.update(memberVO);
		HttpSession session = request.getSession();
		session.setAttribute("memberVO", memberVO);
		this.setMessage(memberVO.getName() + "您好，您的個人資料已更新，三秒後跳轉回首頁");
		return "updated";
	}
	
	public String updatePhoto() {
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(saveDirectory);
		File fsaveDirectory = new File(request.getServletContext().getRealPath("/")+saveDirectory);
		if (!fsaveDirectory.exists()) fsaveDirectory.mkdirs(); // Create save directory if it does not exist	
		System.out.println("Photo save directory: "+fsaveDirectory);
		System.out.println("fileUploadFileName=" + fileUploadFileName);
		MemberServices service = new MemberServices();
		MemberVO mb = (MemberVO)ServletActionContext.getRequest().getSession().getAttribute("memberVO");
		
		if (fileUploadFileName!=null && !fileUploadFileName.isEmpty()){
			String ext = fileUploadFileName.substring(fileUploadFileName.indexOf('.'));				
			fileUploadFileName = "img_"+mb.getEmail()+ext;
			File file2 = new File(fsaveDirectory,fileUploadFileName);
			if (file2.exists()){ //deletes existing profile photo to update
				file2.delete();
			}
			fileUpload.renameTo(file2); // relocate temp file to saveDirectory
			mb.setPhoto(fileUploadFileName);
			service.update(mb);
			return SUCCESS;
		} else {
			System.out.println("我在跑");
			return INPUT;
		}
	}

}
