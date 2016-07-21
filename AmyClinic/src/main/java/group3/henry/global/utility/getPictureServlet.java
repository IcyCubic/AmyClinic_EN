package group3.henry.global.utility;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/getPictureServlet")
public class getPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	            				 			
		request.setCharacterEncoding("UTF-8");
		int bookNumber = Integer.parseInt(request.getParameter("num"));
		System.out.println("Hello");
		
		try {  				
			InitialContext dbContext = new InitialContext();
			DataSource ds = (DataSource)dbContext.lookup("java:comp/env/jdbc/BookDataSQLver");
			Connection conn = ds.getConnection();
		
			String query = "SELECT fileName, CoverImage FROM ebook WHERE bookID = ?"; //gets PK from Unique name
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bookNumber);			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
	
			ServletContext context = getServletContext();
			String mimeType = context.getMimeType(rs.getString(1)); //get file type				
			response.setContentType(mimeType); // set response type to file type
			System.out.println(mimeType);
			
			int len = 0;
			byte[] b = new byte[1024*8]; //chunk size read
			InputStream is = rs.getBinaryStream(2);
			OutputStream os = response.getOutputStream();        				
			while ((len=is.read(b))!=-1){
				os.write(b,0,len); // A.O.L.  Array, Offset, Length
			is.close();
			os.close();
			conn.close();
			}								
		} catch (IOException e){
			e.printStackTrace();
		} catch (SQLException e1){
			e1.printStackTrace();
		} catch (NamingException e) {			
			e.printStackTrace();
		}
	}
}


