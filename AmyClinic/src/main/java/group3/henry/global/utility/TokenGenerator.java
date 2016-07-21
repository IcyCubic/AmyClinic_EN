package group3.henry.global.utility;

import java.math.BigInteger;
import java.security.SecureRandom;

public class TokenGenerator {

	// Generates a 50 character secure token string, 250 bit
	public String secureToken(){
		SecureRandom random = new SecureRandom();
		return new BigInteger(250, random).toString(32);
	}
	
	// Generates a secure token string, user specified bit
	public String secureToken(Integer bits){
		SecureRandom random = new SecureRandom();
		if (bits > 0 && bits % 5 == 0) // if entered value is non-negative and a multiple of 5
			return new BigInteger(bits, random).toString(32);
		return null;
	}
	
//	private String secureToken(){		
//	SecureRandom random = new SecureRandom();
//	byte bytes[] = new byte[60];		
//	random.nextBytes(bytes);
//	for (int i = 0, max = bytes.length; i < max; i++){
//		while (bytes[i] < 48 || bytes[i] > 122 ){				
//			byte[] temp = new byte[1];
//			random.nextBytes(temp);
//			bytes[i] = temp[0];
//		}
//	}
//	try {
//		return new String(bytes, "UTF8");
//	} catch (UnsupportedEncodingException e) {
//		return null;
//	}		
//}

}
