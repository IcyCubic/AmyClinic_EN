package group3.henry.login.google;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

public class GoogleIdVerify {
	  /** Global instance of the JSON factory. */
	  private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	  
	  /** Global instance of the HTTP transport. */
	  private static HttpTransport httpTransport;
	  public static final String CLIENT_ID = "187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com";
	  
	public GoogleBean verify(String idTokenString){
		GoogleIdTokenVerifier verifier;
		GoogleIdToken idToken = null;

	    // If you retrieved the token on Android using the Play Services 8.3 API or newer, set
	    // the issuer to "https://accounts.google.com". Otherwise, set the issuer to
	    // "accounts.google.com". If you need to verify tokens from multiple sources, build
	    // a GoogleIdTokenVerifier for each issuer and try them both.
		
		try {
			httpTransport = GoogleNetHttpTransport.newTrustedTransport();
			
			verifier = new GoogleIdTokenVerifier.Builder(httpTransport, JSON_FACTORY)
				.setAudience(Arrays.asList(CLIENT_ID)).setIssuer("accounts.google.com").build();
			
			idToken = verifier.verify(idTokenString);
		} catch (GeneralSecurityException | IOException e1) {
			e1.printStackTrace();
		}

		// (Receive idTokenString by HTTPS POST)			
		if (idToken != null) {
		  Payload payload = idToken.getPayload();
	
		  // Print user identifier
		  String userId = payload.getSubject();
		  System.out.println("User ID: " + userId);
	
		  // Get profile information from payload
		  String email = payload.getEmail();
		  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
		  String name = (String) payload.get("name");
		  String pictureUrl = (String) payload.get("picture");
		  String locale = (String) payload.get("locale");
		  String familyName = (String) payload.get("family_name");
		  String givenName = (String) payload.get("given_name");
	
		  GoogleBean gbean = new GoogleBean();
		  gbean.setUserId(userId);
		  gbean.setEmail(email);
		  gbean.setEmailVerified(emailVerified);
		  gbean.setName(name);
		  gbean.setPictureUrl(pictureUrl);
		  gbean.setLocale(locale);
		  gbean.setFamilyName(familyName);
		  gbean.setGivenName(givenName);
		  
		  return gbean;
	
		} else {
		  System.out.println("Invalid ID token.");
		  return null;
		}
	}
	
	public static void main(String[] args){
		GoogleIdVerify verify = new GoogleIdVerify();
		//Tokens are good only for about an hour, would need to generate new token to test
		String token = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjMxNWM0YzY3MjI5ODZhODk4ZDZkZDE1ZjQ4OTRiMmQwMGVmZTcyZTkifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXRfaGFzaCI6IlQ1NjBIVFdPV2dIdFZmX0NUeEpHSnciLCJhdWQiOiIxODczODg2OTk0NjYtcHFmNm9mNDRvbjhmbDRmdmZkaGU1cnF1OG9yNHIzYmEuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTYwMTAxNDU3OTU2NzIyMzA3MjIiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXpwIjoiMTg3Mzg4Njk5NDY2LXBxZjZvZjQ0b244Zmw0ZnZmZGhlNXJxdThvcjRyM2JhLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiZW1haWwiOiJlZWl0ODVncm91cDNAZ21haWwuY29tIiwiaWF0IjoxNDY0Njc4Nzc0LCJleHAiOjE0NjQ2ODIzNzQsIm5hbWUiOiJHcm91cCAzIEVFSVQiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1nc1R6NGY3SzZQWS9BQUFBQUFBQUFBSS9BQUFBQUFBQUFBcy9HZy12R3h3UWt4NC9zOTYtYy9waG90by5qcGciLCJnaXZlbl9uYW1lIjoiR3JvdXAgMyIsImZhbWlseV9uYW1lIjoiRUVJVCIsImxvY2FsZSI6ImVuIn0.Jnm9giy4iY2AI7n4VVS2Y-pf7OLn5O6J1FqB5Feifeht5utmsI1uUBJ_ZSSEL5nOoJigSK5mnKRI-Rq7pFq0zStkpWxAmJ535KFH0MKiSt7iZcgsTbr6YZDtyjrBYrA9e9tg-d2Ic-3suZhBHKLHce8ZmNREZCwcMYlroxjIXpEUtOKHiMYZG7FC7vzADnlsfSrLKLusvx5UJcYTGmqw5fbw7D02ZDdAInXbiFuCBOVYhskngsxL_YGNJTHPDRVYmGuCtNX7GhTSMv72Gv7u-BFBenSYW9TmNU5pK7l1dY-6RqpHISOZqRMp6fcyIohoQKeUAAbhaX5D-TWSUvGprw";
		
		GoogleBean bean = verify.verify(token);			
	
	}
	// write Action for Google Login
	//	-user clicks login
	//	-trigger Action through
	// Change SQL to only require name, email
	// Change user photo
	// Create logout function
}
