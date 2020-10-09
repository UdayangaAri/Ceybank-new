package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Update.EmpDao;
import connections.DBConnection;

public class LoginDao {
	public String authenticateUser(LoginBean loginBean) {

		String empNo = loginBean.getEmpno();
		String password = loginBean.getPassword();
		
		

		try {

			System.out.println("Decrypting password");
			
			LoginBean n = LoginDao.getEmployeeById(empNo);
			
			String empNoDB = n.getEmpno();
			
			//String usernameDB = e.getusername();
			String passwordDB = n.getDefpwd();
			String statusDB = n.getStatus();

			
			if (empNo.equals(empNoDB) && password.equals(passwordDB)
					&& statusDB.equals("Active")) {

				System.out.println("Password decrypted");
				return "Access_Granted";

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("failed");
		return "Invalid user credentials";
	}

	public static LoginBean getEmployeeById(String empid) {
		LoginBean e = new LoginBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from employee where employeeNo=?");
			ps.setString(1, empid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setUsername(rs.getString("username"));
				e.setDefpwd(rs.getString("defaultPWD"));
				e.setRole(rs.getString("role"));
				e.setStatus(rs.getString("Status"));
				e.setMobile(rs.getString("mobileNo"));
				e.setGender(rs.getString("Gender"));
				e.setNic(rs.getString("NIC"));
				e.setLname(rs.getString("lastName"));
				e.setEmpno(rs.getString("employeeNo"));
				e.setFname(rs.getString("firstName"));
				e.setBranch(rs.getString("Branch"));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

}
