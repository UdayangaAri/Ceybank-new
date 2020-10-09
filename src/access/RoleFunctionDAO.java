package access;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import Branches.Branch;
import Roles.Role;
import block_Register.block;
import connections.DBConnection;

public class RoleFunctionDAO {

	 public static int save(RoleFunction b){  
		 
	        int status=0;  
	        try{  
	            Connection con = DBConnection.getConnection(); 
	            PreparedStatement ps=con.prepareStatement(  
	               "INSERT INTO `functions_has_role` (`functions_id`, `role_id`, `userID`, `modifyDate`) VALUES (?,?,?,CURRENT_TIMESTAMP)");

	            ps.setString(1,b.getFunctionID());  
	            ps.setString(2,b.getRoleID());  
	            ps.setString(3,b.getCraetedBy()); 
	                
	            status=ps.executeUpdate();  
	            
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    }   
	 
	 
	  public static int deleteRoleFunction(int functionid,int roleid){  
	        int status=0;  
	        try{  
	            Connection con = DBConnection.getConnection(); 
	            PreparedStatement ps = con.prepareStatement("delete from functions_has_role where functions_id=? AND role_id=?;");  
	           // System.out.println("Printing connection object " + con);
	            ps.setInt(1,functionid);  
	            ps.setInt(2,roleid);
	            status=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }  
	    
	 
	  
	  



	  public static boolean getAllPagesByID(String roleid) {

		  boolean status=false;
		  try {
		  	
		  			Connection con = DBConnection.getConnection();
		  			PreparedStatement ps = con.prepareStatement("SELECT * FROM functions_has_role where role_id=? ORDER BY role_id ASC;");
		  			ps.setString(1, roleid);
		  			ResultSet rs = ps.executeQuery();
		  		
		  			while (rs.next()) {
		  			
		  		RoleFunction b = new RoleFunction();
		  				b.setFunctionID(rs.getString(1));
		  				b.setRoleID(rs.getString(2));
		  				
		  					if(rs.getString(1)!=null) {
		 // System.out.println("true");

		  						status=true;
		  					}			
		  					else {
		  						status=false;
		  					}
		
		  			}
		  			}
		  			catch (SQLException e) {
		  				return false;
		  			}
		  			return status;
		  }
	  
	  
	  
	  
	  
	  
	  

		public static RoleFunction getFunction(String roleid) {
			//  System.out.println("roleid^^^^^^^^^^^^^^^^^^^^^^^^^: "+roleid);
			RoleFunction e = new RoleFunction();

			try {
				Connection con = DBConnection.getConnection();

				PreparedStatement ps = con.prepareStatement("SELECT * FROM functions_has_role where role_id=?");
				ps.setString(1, roleid);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {

								
					e.setFunctionID(rs.getString(1));
					e.setRoleID(rs.getString(2));
					e.setCraetedBy(rs.getString(3));
					// System.out.println("rs.getString(1)^^^^^^^^^^^^^^^^^^^^^^^^^: "+rs.getString(1));
					// System.out.println("rs.getString(2)^^^^^^^^^^^^^^^^^^^^^^^^^: "+rs.getString(2));
					// System.out.println("rs.getString(3)^^^^^^^^^^^^^^^^^^^^^^^^^: "+rs.getString(3));
				}
				con.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			return e;
		}
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
		  	}

