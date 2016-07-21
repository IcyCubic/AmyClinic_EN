package group3.henry.global.utility;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

// Used to retrieve user profile photos from Google / FB login

public class GetResource {
    File saveFolder;
    String urlStr;
    
	public GetResource(File saveFolder, String url) {
		super();
		this.saveFolder = saveFolder;
		if (!saveFolder.exists()){
			saveFolder.mkdirs();
		}
		this.urlStr = url;
	}
	
	public GetResource(String dir, String url) {
		this(new File(dir), url);
	}
	
    public String download() throws MalformedURLException{
    	System.out.println(urlStr.length());
    	System.out.println(urlStr.lastIndexOf("/")+1);
    	System.out.println(urlStr.indexOf('?'));
    	
    	String filename = urlStr.substring(urlStr.lastIndexOf("/")+1, (urlStr.indexOf('?')<0?urlStr.length():urlStr.indexOf('?')));
    	System.out.println("GetResource download() filename = "+filename);
    	URL url = new URL(urlStr);
    	try (    			
    	InputStream is = url.openStream();
    	OutputStream os = new FileOutputStream(new File(saveFolder, filename));
    	){
    		int len = 0;
    		byte[] b = new byte[8192];
    		while ((len=is.read(b))!= -1){
    			os.write(b, 0, len);
    		}
    		System.out.println(filename + " 讀取完畢");
    	} catch(Exception ex){
    		ex.printStackTrace();
    	}
    	return filename;
    }
    
}
