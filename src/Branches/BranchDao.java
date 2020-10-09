package Branches;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import block_Register.block;
import connections.DBConnection;



public class BranchDao {

	

	
	public static int update(Branch e) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);
			
			String query = "update branches set B_name=?,B_display_name=?,B_address=?,B_Phone_1=?,B_Phone_2=?,B_Fax=?,B_Email=?,Status=? where id=?";  
				
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, e.getName());
			ps.setString(2, e.getDisplayName());
			ps.setString(3, e.getAddress());
			ps.setString(4, e.getPhone1());
			ps.setString(5, e.getPhone2());
			ps.setString(6, e.getFax());
			ps.setString(7, e.getEmail());
			ps.setString(8, e.getStatus());
			
			ps.setInt(9, e.getId());
			
			status = ps.executeUpdate();

			System.out.println(status);

			con.close();
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static Branch getBranchById(String sid) {
		Branch e = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from branches where id=? ORDER BY B_display_name ASC;");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				e.setName(rs.getString(2));
				e.setDisplayName(rs.getString(3));
				e.setAddress(rs.getString(4));
				e.setPhone1(rs.getString(5));
				e.setPhone2(rs.getString(6));
				e.setFax(rs.getString(7));
				e.setEmail(rs.getString(8));
				e.setStatus(rs.getString(9));
				
				e.setId(rs.getInt(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
    public static List<Branch> getAllBranches(){  
    	
    	
        List<Branch> list=new ArrayList<Branch>();  
          
        try{  
            Connection con = DBConnection.getConnection();  
            PreparedStatement ps=con.prepareStatement("select * from branches ORDER BY B_display_name ASC;");  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Branch e=new Branch();  
                
                e.setName(rs.getString(2));
				e.setDisplayName(rs.getString(3));
				e.setAddress(rs.getString(4));
				e.setPhone1(rs.getString(5));
				e.setPhone2(rs.getString(6));
				e.setFax(rs.getString(7));
				e.setEmail(rs.getString(8));
				e.setStatus(rs.getString(9));
				
                e.setId(rs.getInt(1));
                
                list.add(e);  
            }  
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        
        return list;  
    }

    public static int save(Branch e){  
        int status=0;  
        try{  
            Connection con = DBConnection.getConnection();
            PreparedStatement ps=con.prepareStatement(  
                         "insert into branches(B_name,B_display_name,B_address,B_Phone_1,B_Phone_2,B_Fax,B_Email,Status) values (?,?,?,?,?,?,?,?)");  
            
            ps.setString(1,e.getName());  
            ps.setString(2,e.getDisplayName()); 
            ps.setString(3,e.getAddress());  
            ps.setString(4,e.getPhone1()); 
            ps.setString(5,e.getPhone2());  
            ps.setString(6,e.getFax()); 
            ps.setString(7,e.getEmail());  
            ps.setString(8,e.getStatus());  
            
            status=ps.executeUpdate();  
            
            con.close();  
        }catch(Exception ex){ex.printStackTrace();}  
          
        return status;  
    }   
    
    public static int delete(int id){  
        int status=0;  
        
        try{  
            Connection con = DBConnection.getConnection(); 
            PreparedStatement ps=con.prepareStatement("delete from branches where id=?");  
            System.out.println("Printing connection object " + con);
            ps.setInt(1,id);  
            status=ps.executeUpdate();  
              
            con.close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  
    
	public static int deactivate(Branch e) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);
			
			String query = "update branches set Status=? where id=?";  
				
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(2, e.getId());
			ps.setString(1, e.getStatus());
			
			status = ps.executeUpdate();

			con.close();
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static Branches.Branch getBranchByIdForRooms(int sid) {
		Branch b = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from branches where id=? ORDER BY id ASC;");

			ps.setInt(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setDisplayName(rs.getString(3));

				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}
	
}
