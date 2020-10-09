package Log;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Log.Log;
import connections.DBConnection;

public class LogDAO {
	
	public static int InsertLog(Log r) {
		int status = 0;

		try {

			Connection con = DBConnection.getConnection();
			//System.out.println("Printing connection object " + con);
			
			String query = "insert into Logs(Edited_unit,EditedBy,Edit_Status,PreviousData,EditedDate) values(?,?,?,?,CURRENT_TIMESTAMP)";  
					

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, r.getEdited_unit());
			ps.setString(2, r.getEdited_by());
			ps.setString(3, r.getEdit_status());
			ps.setString(4, r.getPrevious_data());
			
			status = ps.executeUpdate();

			con.close();
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

}
