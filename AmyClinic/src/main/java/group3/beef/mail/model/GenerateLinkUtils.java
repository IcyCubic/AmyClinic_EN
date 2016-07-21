package group3.beef.mail.model;


import java.util.Base64;

import com.sun.mail.util.BASE64EncoderStream;

import group3.beef.employee.model.EmployeeVO;
import group3.beef.encryption.AES_Encryption;
import group3.henry.encryption.interceptor.MD5_EncryptionInterceptor;

public class GenerateLinkUtils {
	 private static final String CHECK_CODE = "checkCode";  
	 
	 public static String generateResetPwdLink(EmployeeVO empVO ,String ctx) {  
	        return "http://"+ctx+"/empLogin/EmpLoginServlet.do?action=reset&mail="
	        		+empVO.getEmail()+"&"+ CHECK_CODE + "=" + generateCheckcode(empVO);  

}
	 
	 public static String generateCheckcode(EmployeeVO empVO){
		 String randomCode = null;
		 String mail = empVO.getEmail();
		 String pwd = empVO.getPwd();
		 String code =mail+pwd;
		 Base64.Encoder encoder =Base64.getEncoder();
		 try {
			 byte[] textByte = code.getBytes("UTF-8");
			 randomCode = encoder.encodeToString(textByte);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return randomCode;
	 	}
	 public static boolean verifyCheckcode(EmployeeVO empVO,String checkCode){
		 System.out.println("checkCode:"+checkCode);
		 System.out.println("gencode:"+generateCheckcode(empVO).trim());
		 System.out.println("checkCode:"+checkCode.length());
		 System.out.println("gencode:"+generateCheckcode(empVO).length());
		 
		 return generateCheckcode(empVO).trim().equals(checkCode.trim());
			 }
	 }
	 



