package group3.henry.global.utility;

import java.util.*;
import com.sendgrid.SendGrid;
import com.sendgrid.SendGrid.Email;
import com.sendgrid.SendGridException;

// Test class for SendGrid's library. It's really not any faster, stupid pos.

public class SendGridMailer {
	private static final String KEY = "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";
	
	public void send(){
		SendGrid sendgrid = new SendGrid(KEY);
		
		Email email = new Email();
		email.addTo("eeit85group3@gmail.com");
		email.addToName("SendGridz");
		email.setFrom("HLAware@gmail.com");
		email.setSubject("SendGrid Test");
		email.setText("Well whadda ya know, it works!");		

		try {
			sendgrid.send(email);
			Date today = new Date();
			System.out.println(today); 
		} catch (SendGridException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		SendGridMailer m = new SendGridMailer();
		m.send();
	}
}
