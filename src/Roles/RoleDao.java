package Roles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;


import connections.DBConnection;

public class RoleDao {
	
	public static int update(Role e) {
		int status = 0;

		try {
			//Connection con = (Connection) connections.Connection.getConnection();
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);
			
			String query = "update role set role=?,roleDesc=? where id=?";  
					

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, e.getRole());
			ps.setString(2, e.RoleDesc);
			ps.setInt(3, e.getId());

			
			status = ps.executeUpdate();

			System.out.println(status);

			con.close();
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	

	
	public static Role getRoleById(String sid) {
		Role e = new Role();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from role where id=? ORDER BY role ASC;");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				e.setRole(rs.getString(2));
				e.setRoleDesc(rs.getString(3));
				e.setId(rs.getInt(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	
	
    public static List<Role> getAllRoles(){  
        List<Role> list=new ArrayList<Role>();  
          
        try{  
            Connection con = DBConnection.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from role ORDER BY role ASC;");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Role e=new Role();  
                
                e.setRole(rs.getString(2));  
                e.setRoleDesc(rs.getString(3)); 
                e.setId(rs.getInt(1));
               
                
                
                list.add(e);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return list;  
    }

    public static int save(Role e){  
        int status=0;  
        try{  
            Connection con = DBConnection.getConnection(); 
            PreparedStatement ps=con.prepareStatement("insert into role(role,roleDesc) values (?,?)");  
            ps.setString(1,e.getRole());  
            ps.setString(2,e.getRoleDesc());  
           
            
            status=ps.executeUpdate();  
            
            
              
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }   
    
    public static int delete(int id){  
        int status=0;  
        try{  
            Connection con = DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement("delete from role where id=?");  
            ps.setInt(1,id);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    

	public static Role getRoleByRoleName(String rolename) {
		Role e = new Role();

		//System.out.println("role id from role name11111111111111 : "+rolename);
		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from role where role=?;");
			ps.setString(1, rolename);
			System.out.println("role id from role name : "+rolename);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				e.setRole(rs.getString(2));
				e.setId(rs.getInt(1));
				e.setRoleDesc(rs.getString(3));
				
				System.out.println("role id from role id: "+rs.getString(1));
				
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
    

}
