package LogsTextFile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import connections.DBConnection;

public class LogFileDAO {

	
	 public static List<LogData> getAllLogs(){  
	    	
	    	
	        List<LogData> list=new ArrayList<LogData>();  
	          
	        try{  
	            Connection con = DBConnection.getConnection();  
	            PreparedStatement ps=con.prepareStatement("SELECT * FROM logs ORDER BY LogID DESC;");  
	            ResultSet rs=ps.executeQuery();  
	            while(rs.next()){  
	            	
	            	LogData e=new LogData();  
	                
	                
					e.setId(rs.getString(1));
					e.setEdited_unit(rs.getString(2));
					e.setEdited_by(rs.getString(3));
					e.setEdit_status(rs.getString(4));
					e.setEdited_time(rs.getString(5));
					e.setPrevious_data(rs.getString(6));
					
					//System.out.println("id DAO : "+e.getId());
	   
	            	//System.out.println("Unit DAO : "+e.getEdited_unit());
					
	                list.add(e);  
	            }  
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        
	        return list;  
	    }

	
	
}
