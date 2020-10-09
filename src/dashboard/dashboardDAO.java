package dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import Roles.Role;
import connections.DBConnection;
import register.RegisterBean;
import register.RegisterDao;

public class dashboardDAO {


	
	public static String getEmpCount(String branchID) {
	//	System.out.println("");
	String status="";
	
		RegisterBean r = new RegisterBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(employeeNo) FROM employee where Branch=?;");
			
			ps.setString(1, branchID);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
r.setEmployeeNo(rs.getString(1));
				
				
						status = rs.getString(1);
						//System.out.println("emp count  :"+status);
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
}
