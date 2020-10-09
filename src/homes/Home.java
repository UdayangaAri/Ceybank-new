package homes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connections.DBConnection;

public class Home {
	
	public static HomeBean getCount(String sid) {
		HomeBean e = new HomeBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT COUNT(employeeNo) FROM employee;");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				e.setCount(rs.getInt(1));
				System.out.println("count : "+ rs.getInt(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

}
