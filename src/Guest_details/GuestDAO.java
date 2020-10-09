package Guest_details;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connections.DBConnection;

public class GuestDAO {

	public static int update(Guest e) {
		
		int status = 0;

		try { 
			
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			String query = "update guest_details set position=?,Name=?,Address=?,City=?,R_Country=?,Citizenship=?,NIC=?,Moblie=?,DOB=?,Email=?,Profession=?,St_nonSt=?,pf_no=? where Customer_Number=?";  
			
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, e.getPosition());
			ps.setString(2, e.getName());
			ps.setString(3, e.getAddress());

			ps.setString(4, e.getCity());
			ps.setString(5, e.getCountry());
			ps.setString(6, e.getCitizenship());
			ps.setString(7, e.getNic());
			
			ps.setString(8, e.getMobile());
			ps.setString(9, e.getDob());
			
			ps.setString(10, e.getEmail());
			ps.setString(11, e.getProf());
			ps.setString(12, e.getSt_nonst());
			ps.setString(13, e.getPfno());

			ps.setString(14, e.getCnumber());
		
			status = ps.executeUpdate();

			System.out.println(status);

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static Guest getGuestById(String sid) {
		Guest e = new Guest();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement(
					"select * from guest_details where NIC=? OR Moblie=? OR pf_no=? ORDER BY Customer_Number ASC;");
			ps.setString(1, sid);
			ps.setString(2, sid);
			ps.setString(3, sid);
			
			ResultSet rs = ps.executeQuery();
	
			if (rs.next()) {

				e.setSID(sid);
				
				e.setPosition(rs.getString(2));
				e.setName(rs.getString(3));
				e.setAddress(rs.getString(4));
				e.setCity(rs.getString(5));
				e.setCountry(rs.getString(6));
				e.setCitizenship(rs.getString(7));
				e.setNic(rs.getString(8));
				e.setMobile(rs.getString(9));
				e.setDob(rs.getString(10));
				e.setEmail(rs.getString(11));
				e.setProf(rs.getString(12));
				e.setSt_nonst(rs.getString(13));
				e.setPfno(rs.getString(14));

				e.setCnumber(rs.getString(1));
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static List<Guest> getAllGuests() {
		List<Guest> list = new ArrayList<Guest>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from guest_details ORDER BY Customer_Number ASC;");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Guest e = new Guest();

				e.setAddress(rs.getString(3));
				e.setCity(rs.getString(3));
				e.setCountry(rs.getString(4));
				e.setCitizenship(rs.getString(5));
				e.setNic(rs.getString(6));
				e.setMobile(rs.getString(7));
				e.setDob(rs.getString(8));
				e.setEmail(rs.getString(9));
				e.setProf(rs.getString(10));
				e.setSt_nonst(rs.getString(11));
				e.setPfno(rs.getString(12));

				e.setName(rs.getString(1));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static int save(Guest e) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into guest_details(position,Name,Address,City,R_Country,Citizenship,NIC,Moblie,DOB,Email,Profession,St_nonSt,pf_no) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");

			ps.setString(2, e.getName());
			ps.setString(3, e.getAddress());
			ps.setString(4, e.getCity());
			ps.setString(5, e.getCountry());
			ps.setString(6, e.getCitizenship());
			ps.setString(7, e.getNic());
			ps.setString(8, e.getMobile());
			ps.setString(9, e.getDob());
			ps.setString(10, e.getEmail());
			ps.setString(11, e.getProf());
			ps.setString(12, e.getSt_nonst());
			ps.setString(13, e.getPfno());

			ps.setString(1, e.getPosition());

			status = ps.executeUpdate();
			
			System.out.println("cmobile get = "+e.getMobile());

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int delete(int id) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from guest_details where id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

}
