package group3.henry.encryption.interceptor;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
//import java.util.HashMap;
//import java.util.Map;





import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;





//import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class MD5_EncryptionInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	
	//one-way-hash method
	private String encode(String message) {
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();
			
			for (int i = 0; i < digest.length; ++i) {
				final byte b = digest[i];
				final int value = (b & 0x7F) + (b < 0 ? 128 : 0);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	
	public String intercept(ActionInvocation invocation) throws Exception {
		
		System.out.println("MD5 Encryption interceptor!");
/*	Non-viable route; Result: ActionContext.PARAMETERS appears to be not changeable; reference data only(?)
 * 		
		ActionContext ctx = invocation.getInvocationContext();
	    Map<String,Object> parameters = (Map<String,Object>)ctx.get(ActionContext.PARAMETERS);
	    
	    String paramPW = ((Object[])(parameters.get("memberVO.pwd")))[0].toString();
	    System.out.println("paramPW: " + paramPW);
//	    System.out.println("Map<str,obj> param pwd = " + (parameters.get("memberVO.pwd"))); 
//	    System.out.println("Map<str,obj> param pwd = " + ((Object[])(parameters.get("memberVO.pwd")))[0]);
	    
	    Map<String, Object> paramCopy = new HashMap<String, Object>();
	    paramCopy.putAll(parameters);
	    
	    String encoded = encode(paramPW);
	    
	    System.out.println("encoded: " + encoded);
	    String[] insert = new String[1];
	    insert[0] = encoded;
	    System.out.println(insert);
	    paramCopy.put("memberVO.pwd", insert);
	    
//	    Map<String,Object> thing = new HashMap<String,Object>();
//	    thing.put("memberVO.pwd", new String[]{"xxxxyyyy"});
//		ctx.put(ActionContext.PARAMETERS, thing);

	    ctx.setParameters(paramCopy);
	    
	    parameters = (Map<String,Object>)ctx.get(ActionContext.PARAMETERS);
	   // System.out.println("Reset ActionContext Parameter = " + ((Object[])(parameters.get("memberVO.pwd")))[0]);
*/
// ---------------------------------------------------------	    
		HttpServletRequest request = ServletActionContext.getRequest();
		String pw = null; // container for password
		String pw2 = null; // container for repeat password field, if one exists

		if (request.getAttribute("encpw")!=null) // if a previous interceptor processed a pw, use encpw
			pw = (String)request.getAttribute("encpw");
		else if (request.getParameter("memberVO.pwd")!=null)
			pw = request.getParameter("memberVO.pwd"); // if not, use pw from request
		else
			return invocation.invoke(); // No raw or encrypted password(s) to process, moves to next interceptor
		
		if (request.getAttribute("encpw2")!=null) // if a prev interceptor processed the alt pw, use encpw2
			pw2 = (String)request.getAttribute("encpw2");
		else
			pw2 = request.getParameter("tempPW");	// if not, use tempPW from request
		
		request.setAttribute("encpw", encode(pw)); //stores encoded password in request attribute "encpw"
		System.out.println(encode(pw));
		if (null!=pw2){ //if alt pw exists, stores encoded alt password in request attribute "encpw2"
			request.setAttribute("encpw2", encode(pw2));
			System.out.println(encode(pw2));
		}
				
		return invocation.invoke(); // passes control to the next intercepter
	}
	
	
//	test method
	public static void main(String[] args){
		MD5_EncryptionInterceptor x = new MD5_EncryptionInterceptor();
		String testmsg = "Hello World";
		System.out.println(x.encode(testmsg)); //b10a8db164e0754105b7a99be72e3fe5
	}
}

	
