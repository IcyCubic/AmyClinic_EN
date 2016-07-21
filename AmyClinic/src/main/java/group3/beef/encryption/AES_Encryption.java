package group3.beef.encryption;
import sun.misc.*;

import javax.crypto.*;

import java.security.*;

import javax.crypto.spec.*;

public class AES_Encryption { 
	
	private static final String KEY = "beefgood";
	@SuppressWarnings("restriction")
	public   String getencrypt(String p) throws Exception
	  {
	    String encrypted="";
	    try{
	      KeyGenerator kgen = KeyGenerator.getInstance("AES");
	      kgen.init(128,new SecureRandom(KEY.getBytes() ) );
	      SecretKey skey = kgen.generateKey();
	      byte[] raw = skey.getEncoded();
	      SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
	      Cipher cipher = Cipher.getInstance("AES");
	      cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
	      byte[] encrypt =
	      cipher.doFinal( p.getBytes());
	      encrypted=new BASE64Encoder().encodeBuffer(encrypt).trim();
	      //System.out.println("encrypted="+encrypted);
	      }//try
	      catch(Exception e){System.out.println(e);
	      }
	      return encrypted;  //return 密文
	  }
	  public   String getdecrypt(String base64) throws Exception
	  {
	    String decrypted="";
	    try{
	    @SuppressWarnings("restriction")
		byte[] b = new BASE64Decoder().decodeBuffer( base64 );
	    KeyGenerator kgen2 = KeyGenerator.getInstance("AES");
	    kgen2.init(128,new SecureRandom(KEY.getBytes() ) );
	    SecretKey skey2 = kgen2.generateKey();
	    byte[] raw2 = skey2.getEncoded();
	    SecretKeySpec skeySpec2 = new SecretKeySpec(raw2, "AES");
	    Cipher cipher2 = Cipher.getInstance("AES");
	    cipher2.init(Cipher.DECRYPT_MODE, skeySpec2);
	    byte[] decrypt =
	    cipher2.doFinal( b);
	    decrypted=new String(decrypt);
	    //System.out.println("decrypted="+decrypted);
	 
	    }catch(Exception e)
	    {System.out.println(e);}
	      return decrypted;
	  }
	

//	 public static void main(String[] args) throws Exception { 
//		 	AES_Encryption cipher = new AES_Encryption();
//		    String plain="Aaaa";
//		    //加密
//		    String en=cipher.getencrypt(plain);
//		    String encryptd=new String (en);
//		 
//		    System.out.println("\nget密文:"+encryptd);
//		 
//		    //解密
//		    String de=cipher.getdecrypt(encryptd);
//		    String decryptd=new String (de);
//		    System.out.println("\nget明文:"+decryptd);
//}

}

