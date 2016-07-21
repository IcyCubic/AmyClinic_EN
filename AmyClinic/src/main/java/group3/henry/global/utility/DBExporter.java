package group3.henry.global.utility;

import java.sql.*;

/*
-Get connection
-Get table data from DB
-Get rsmetadata from rs
-loopy loop, splice information into appropriate format
return result
*/

public class DBExporter {
 
	
	public String dbConnect(String target, String format) {		
		String connectionUrl = "jdbc:jtds:sqlserver://localhost:1433;DatabaseName=AmyDB;user=sa;password=01292013@Taichung";
	    Connection conn = null;
	    String tableName = "";
        String nl = System.getProperty("line.separator");
        format = format.toUpperCase();
        target = target.replaceAll("[^a-zA-Z0-9_]",""); // table name input filter
        boolean json = format.equals("JSON");

        if (!format.equals("JSON") && !format.equals("XML")){
        	System.out.println("Invalid format!");
        	return null;
        }
        
	    try {
	    	Class.forName("net.sourceforge.jtds.jdbc.Driver");
	        conn = DriverManager.getConnection(connectionUrl);
	        DatabaseMetaData dbmd = conn.getMetaData();
	        
	        ResultSet tables = dbmd.getTables(null, null, "%", null);
	        while (tables.next()) {
	        	if (tables.getString(3).equals(target)){
	        		tableName = tables.getString(3);
	        		break;
	        	}
	        }	        
	        if (tableName.equals("")){
	        	System.out.println("Table \"" + target + "\" was not found!");
	        	return null;
	        }	         
	         
	        Statement statement = conn.createStatement();
	        String queryString = "select * from " + target;
	        ResultSet rs = statement.executeQuery(queryString);	         
	        ResultSetMetaData rsmd = rs.getMetaData();         	         
	        
	        StringBuffer result = new StringBuffer();
	        if (json){
		        result.append("{\""+ tableName + "\":["+nl);
	        } else {
	        	result.append("<"+tableName+">"+nl); //start tags	         
	        }
	         
	        int colmax = rsmd.getColumnCount();
	        String label = "";
	        String value = "";
	        while (rs.next()) {
	        	result.append(json?"{":("    <"+tableName.substring(0, tableName.length()-1)+">"+nl));
	        	for (int i = 1; i <= colmax; i++){
	        		label = rsmd.getColumnLabel(i);
	        		value = rs.getString(i);
	        		if (i==1 && !json)
	        			result.append("        ");
	        		if(i==colmax){
	        			result.append(json?("\""+label+"\":\""+value+"\""):("<"+label+">"+value+"</"+label+">"+nl));
	        		}
	        		else{
	        			result.append(json?("\""+label+"\":\""+value+"\","):("<"+label+">"+value+"</"+label+"> "));
	        		}
	        	}
	        	result.append(json?(rs.isLast()?"}"+nl:"},"+nl):("    </"+tableName.substring(0, tableName.length()-1)+">"+nl));
	        }
	        result.append(json?"]}":"</"+tableName+">");
	         
	        conn.close();
	        return(result.toString());
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
	    }
	    return null;
	}

	public static void main(String[] args) {
		DBExporter connServer = new DBExporter();
		String results = connServer.dbConnect("Employees", "json");
        System.out.println(results);
	}
}
