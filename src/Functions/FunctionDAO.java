package Functions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;
import block_Register.block;
import connections.DBConnection;

public class FunctionDAO {
	
	 public static int save(Functions e){  
	        int status=0;  
	        try{  
	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps=con.prepareStatement(  
	                         "insert into functions(mainFunction,subFunction) values (?,?)");  
	            
	            ps.setString(1,e.getMainFunction()); 
	            ps.setString(2,e.getSubFunction()); 
	           
	            
	            status=ps.executeUpdate();  
	            
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    }   
	

	
public static List<Functions> getAllFunctions(){  
    	
    	
        List<Functions> list = new ArrayList<Functions>();  
          
        try{  
            Connection con = DBConnection.getConnection(); 
            PreparedStatement ps=con.prepareStatement("select * from functions ORDER BY id ASC;");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
            	
               Functions e = new Functions();  
                
                e.setId(rs.getInt(1));
				e.setMainFunction(rs.getString(2));
				e.setSubFunction(rs.getString(3));
				
				//System.out.println(e.getSubFunction());
				
                list.add(e);
            }  
            con.close();  
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }  
          
        
        return list;  
    }
	







public static Functions getFunctionsToRoles(String roleid)  {
	Functions e = new Functions();

	try {
		Connection con = DBConnection.getConnection();

		PreparedStatement ps = con.prepareStatement("select * from functions where id=? ORDER BY id ASC;");
		ps.setString(1, roleid);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {

			

		e.setId(rs.getInt(1));
	e.setMainFunction(rs.getString(2));
		e.setSubFunction(rs.getString(3));
	//	System.out.println("function name selected to be change : " + rs.getString(3));
		}
		con.close();
	} catch (Exception ex) {
		ex.printStackTrace();
	}

	return e;
}



public static int getAllFunctionIDs (Functions f) {
	int status = 0;

	try {
		Connection con = DBConnection.getConnection();
		//System.out.println("Printing connection object " + con);
		
		String query = "Select id from functions";  
				

		PreparedStatement ps = con.prepareStatement(query);

		ps.setInt(1, f.getId());
					
		status = ps.executeUpdate();
	//	System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
	//	System.out.println("Id : "+f.getId());

		con.close();
	
	} catch (Exception ex) {
		ex.printStackTrace();
	}

	return status;
}

}
