package RoomTypeMaster;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import block_Register.block;
import connections.DBConnection;

public class roomTypeDAO {

	public static List<Room_type> getAllRoomType() {
		List<Room_type> list = new ArrayList<Room_type>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from roomtypes ORDER BY roomTypeId ASC;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Room_type e = new Room_type();

				e.setRoom_Type(rs.getString(2));
				e.setId(rs.getInt(1));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		
	}
	
	public static Room_type getRoomTypeById(int sid) {
		Room_type b = new Room_type();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from roomtypes where roomTypeId=? ORDER BY roomTypeId ASC;");
			ps.setInt(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setRoom_Type(rs.getString(2));

				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}
	
	public static int update(Room_type r) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			String query = "update roomtypes set RoomTypeName=? where roomTypeId=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, r.getRoom_Type());
			ps.setInt(2, r.getId());

			status = ps.executeUpdate();

			System.out.println(status);

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static int save(Room_type b) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into roomtypes(RoomTypeName) values (?)");

			
			ps.setString(1, b.getRoom_Type());
			
			status = ps.executeUpdate();

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
			PreparedStatement ps = con.prepareStatement("delete from roomtypes where roomTypeId=?");
			System.out.println("Printing connection object " + con);
			ps.setInt(1, id);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
	
	public static Room_type getRoomTypeIDByName(String sid) {
		Room_type b = new Room_type();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from roomtypes where RoomTypeName=? ORDER BY roomTypeId ASC;");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setRoom_Type(rs.getString(2));

				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

}

