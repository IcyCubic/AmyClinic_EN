/*
SendGrid documentation / sample URL
https://azure.microsoft.com/en-us/documentation/articles/store-sendgrid-java-how-to-send-email/ 
*/

package group3.henry.global.utility;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer implements GlobalConstants {	
	private final String SIGNATURE = "由AmyClinic寄出" + NL + "歡迎參觀我們的網站！";
	private final String SIGNATURE1 = "由AmyClinic寄出<br>歡迎參觀我們的網站！";
/*
 create account
 set status to 2 (awaiting verification)
 Generate message + token
 store token in memberVO.verify 
 Send to Email addy, with verification link
 Create email verification reminder page
 user clicks on link
 
 servlet receives token
 compare token to DB token
 if accurate, set account status to 1 (active)
 set memberVO.verify to null
 
 
 */	
	
	// 
	public void send(String name, String destination, String subject, String text) {
		this.send(name, destination, subject, text, "text");
	}		  
		
	//					Person			Email		  Email Subject   Email Text   text or html
	public void send(String name, String destination, String subject, String text, String format) {		  
		format = format.toUpperCase();
		if (!format.equals("TEXT") && !format.equals("HTML")){
			System.out.println("Mailer.java - Invalid email format specified");
			return;
		}

	    Properties props = new Properties();
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");	    
	    props.put("mail.smtp.host", EMAIL_HOST);
	    props.put("mail.smtp.port", EMAIL_PORT);
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.ssl.trust", EMAIL_HOST);

	    // Get the Session 
	    Session session = Session.getInstance(props, 
	    		new javax.mail.Authenticator() {
			        protected PasswordAuthentication getPasswordAuthentication() {
			        	return new PasswordAuthentication(EMAIL_USER, EMAIL_PASSWORD);
			        }
	      		});
	    try {         
	    	MimeMessage message = new  MimeMessage(session); // Create a default MimeMessage object.
	        try {
				message.setFrom(new InternetAddress(EMAIL_FROM,"AmyClinic"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} // Set From: header field of the header.         
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destination)); // Set To: header field of the header.         
	        message.setSubject(subject,"utf-8"); // Set Subject: header field

	        String outbound = "哈囉， "+ name + "！" + NL + NL + text + NL + NL + SIGNATURE;
	        String outbound1 = "哈囉， "+ name + "！" + NL + NL + text + NL + NL + SIGNATURE1;
	        if (format.equals("TEXT"))
	        	message.setText(outbound,"utf-8"); // Set the actual message
	        else if (format.equals("HTML"))
	        	//為了測試用先把編碼寫死成utf-8
	        	message.setContent(outbound1, "text/html;charset=UTF-8");
	        else{
	        	System.out.println("Invalid format");
	        	return;
	        	}	        
	        Transport.send(message); // Send message
	        
	        System.out.println("Sent message successfully....");

	    } catch (Exception e) {
	    	throw new RuntimeException(e);
	    }
	}
	
//	public static void main(String[] args){
//		String nl = System.getProperty("line.separator");
//		Mailer m = new Mailer();
//		String token = m.secureToken().toUpperCase();
//		String to = "eeit85group3@gmail.com";
//		m.send("Group3", to, "AmyClinic Registration Confirmation", 
//				"Thank you for registering on our site! Please click the link below to validate your email!" 
//				+ nl + nl + "http://www.AmyClinic.com?RegistrationAuth=" + token+"&email=" + to);
//	}
}
