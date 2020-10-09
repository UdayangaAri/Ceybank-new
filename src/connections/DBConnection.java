package connections;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() {
		Connection con = null;
		String url = "jdbc:mysql://172.20.106.166:3306/ceybank_rest?autoReconnect=true&useSSL=false";
		String email = "ceybank_db";
		String password = "Ceybank@db123";

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, email, password);
				
				if (con != null){
					
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
