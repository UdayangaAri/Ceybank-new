package sidebar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import access.RoleFunction;
import connections.DBConnection;

public class sidebarDAO {

	public static List<RoleFunction> getFunctionsByRoleID(String roleIDByName) {

		List<RoleFunction> list = new ArrayList<RoleFunction>();
	

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"select functions_id from functions_has_role where role_id=? ORDER BY functions_id ASC;");
			ps.setString(1, roleIDByName);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				RoleFunction b = new RoleFunction();

				b.setFunctionID(rs.getString(1));
				//System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^ FunctionID : "+rs.getString(1));
				list.add(b);

			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
//	
//	public static RoleFunction getFId(String sid) {
//		RoleFunction b = new RoleFunction();
//
//		try {
//			Connection con = DBConnection.getConnection();
//
//			PreparedStatement ps = con.prepareStatement("select functions_id from functions_has_role where role_id=?;");
//			ps.setString(1, sid);
//			
//			ResultSet rs = ps.executeQuery();
//			
//			while (rs.next()) {
//
//				b.setFunctionID(rs.getString(1));
//				
//				System.out.println("check function id :: " + rs.getString(1));
//			}
//			con.close();
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//
//		return b;
//	}

}
