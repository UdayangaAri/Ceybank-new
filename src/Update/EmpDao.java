package Update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Branches.Branch;
import Roles.Role;
import connections.DBConnection;

public class EmpDao {


	public static int update(Emp e) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);
			
			String query = "update employee set employeeNo=?,firstName=?,lastName=?,Gender=?, NIC=?,phoneNo=?,mobileNo=?,email=?,address=?,role=?,Branch=?,Status=? where employeeNo=?";  
				
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(2, e.getFirstName());
			ps.setString(3, e.getLastName());
			ps.setString(5, e.getNIC());
			
			ps.setString(4,e.getGender());

			ps.setString(6, e.getPhoneNo());
			ps.setString(7, e.getMobileNo());
			ps.setString(8, e.getEmail());
			ps.setString(9, e.getAddress());

			ps.setInt(10, e.getRole());
			ps.setInt(11, e.getBranch());
			
			ps.setString(1, e.getEmployeeNo());
			ps.setString(13, e.getEmployeeNo());
			ps.setString(12, e.getStatus());
			
			status = ps.executeUpdate();

			System.out.println(status);

			con.close();
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	
	public static int deactivate(Emp e) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);
			
			String query = "update employee set Status=? where employeeNo=?";  
					
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(2, e.getEmployeeNo());
			ps.setString(1, e.getStatus());
			
			status = ps.executeUpdate();

			con.close();
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static Emp getEmployeeById(String sid) {
		Emp e = new Emp();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from employee where employeeNo=? ORDER BY employeeNo ASC;");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				e.setEmployeeNo(rs.getString(1));
				e.setFirstName(rs.getString(2));
				e.setLastName(rs.getString(3));
				e.setUsername(rs.getString(4));
				
				e.setGender(rs.getString(5));
				e.setRole(rs.getInt(6));
				
				e.setPhoneNo(rs.getString(8));
				e.setMobileNo(rs.getString(9));
				e.setEmail(rs.getString(10));
				e.setAddress(rs.getString(11));

				e.setNIC(rs.getString(12));
				e.setBranch(rs.getInt(13));
				e.setStatus(rs.getString(14));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
//    public static List<Emp> getAllEmployees(){  
//        List<Emp> list=new ArrayList<Emp>();  
//          
//        try{  
//            Connection con = DBConnection.getConnection(); 
//            PreparedStatement ps=con.prepareStatement("select * from employee");  
//            ResultSet rs=ps.executeQuery();  
//            while(rs.next()){  
//                Emp e=new Emp();  
//                
//                e.setEmployeeNo(rs.getString(1));  
//                e.setFirstName(rs.getString(2));  
//                e.setLastName(rs.getString(3));
//                e.setUsername(rs.getString(4));
//                e.setRole(rs.getString(5));
//                e.setDefaultPWD(rs.getString(6));
//                e.setPhoneNo(rs.getString(7));
//                e.setMobileNo(rs.getString(8));
//                e.setEmail(rs.getString(9));
//                e.setAddress(rs.getString(10));
//                e.setNIC(rs.getString(11));
//                
//                
//                list.add(e);  
//            }  
//            con.close();  
//        }catch(Exception e){e.printStackTrace();}  
//          
//        return list;  
//    }  
	
	public static Role getRIdByName(int sid) {
		Role e = new Role();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select role,id from role where id=?");
			ps.setInt(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setRole(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	
	public static Role getRoleById(String sid) {
		Role e = new Role();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select role,id from role where role=?");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setRole(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	public static Branch getBranchById(String sid) {
		Branch e = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select B_display_name,id from branches where B_display_name=?");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setDisplayName(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	
	public static Branch getBIdByName(int sid) {
		Branch e = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select B_display_name,id from branches where id=?");
			ps.setInt(1, sid);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setDisplayName(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}
	
}
