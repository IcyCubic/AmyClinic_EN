package group3.henry.global.utility;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowPicture
 */
@WebServlet("/kitty/showPictureServletTest")
public class ShowPictureServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String[] sa = {"autumn_fs.jpg","fs.jpg","m001.jpg","m12.jpg","m46.jpg","m536.jpg","Monterey_Butterflies.jpg"
			  ,"mountain40.jpg","Omoe_Island_Denmark.jpg","snoopy.jpg","v06.jpg","wall166.jpg","winter008.jpg"}; //file name list
	private static Set<String> imgSet = new HashSet<String>(Arrays.asList(sa));
//	private static Set<String> displayed = new HashSet<String>();
//	private static int count = 0;
    public ShowPictureServletTest() {
        super();
    }
            
	synchronized protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		 
		
		//int num = (int)(Math.random()*imgSet.size()); // random # between 0 and list size -1		
		
//		Iterator<String> iterator = imgSet.iterator();
//		String filename = null;
//		do {							
//		filename = iterator.next();					
//		} while (displayed.contains(filename));
//		displayed.add(filename);		
//		count++;
//		if (count >= imgSet.size()){
//			displayed = new HashSet<String>();
//			count = 0;
//		}
		Iterator<String> iterator = imgSet.iterator();
		String filename = null;						
		filename = iterator.next();							
		iterator.remove();		
		if (imgSet.size() <= 0){
			imgSet = new HashSet<String>(Arrays.asList(sa));
		}
		ServletContext context = getServletContext();
		String mimeType = context.getMimeType(filename); //get file type
		response.setContentType(mimeType); // set response type to file type
		String realPath = context.getRealPath("/images/" + filename); // Actual server path of the resource	       
		
		try ( //Try-with-resource // auto-closes, good shit
			InputStream is = new FileInputStream(realPath); //auto close
			OutputStream os = response.getOutputStream();
		){
			int len = 0;
			byte[] b = new byte[1024*8]; //chunk size read
			while ((len=is.read(b))!=-1){
				os.write(b,0,len); // A.O.L.  Array, Offset, Length
			}								
		} catch (IOException e){
			e.printStackTrace();
		}
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}

}
