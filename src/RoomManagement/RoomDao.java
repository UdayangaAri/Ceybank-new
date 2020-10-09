package RoomManagement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;
import connections.DBConnection;

public class RoomDao {

	public static int update(Room e) {
		int status = 0;

		try {

			Connection con = DBConnection.getConnection();
			//System.out.println("Printing connection object " + con);

			String query = "update rooms set blockID=?, roomNo=?, roomName=?, roomType=?, Status=? where id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, e.getBlockID());
			ps.setString(2, e.getRoomNo());
			ps.setString(3, e.getRoomName());
			ps.setInt(4, e.getRoomType());
			ps.setString(5, e.getRoomStatus());
			
			ps.setInt(6, e.getId());

			status = ps.executeUpdate();

			//System.out.println(status);

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static Room getRoomById(String sid) {
		Room e = new Room();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from rooms where id=? ORDER BY roomNo ASC;");
			ps.setString(1, sid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setBranchID(rs.getInt(2));
				e.setBlockID(rs.getInt(3));
				
				e.setRoomNo(rs.getString(4));
				e.setRoomName(rs.getString(5));
				e.setRoomType(rs.getInt(6));
				e.setRoomStatus(rs.getString(7));
				
				e.setId(rs.getInt(1));

				
				con.close();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static List<Room> getAllRooms() {
		List<Room> list = new ArrayList<Room>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from rooms ORDER BY roomNo ASC;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Room e = new Room();

				e.setBranchID(rs.getInt(2));
				e.setRoomNo(rs.getString(4));
				e.setRoomName(rs.getString(5));
				e.setRoomType(rs.getInt(6));
				e.setBlockID(rs.getInt(3));
				e.setId(rs.getInt(1));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public static List<Room> getAllRooms01(String brchID) {

		List<Room> list = new ArrayList<Room>();

			try {
				Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("select * from rooms where roomBranch=? ORDER BY id ASC;");
				ps.setString(1, brchID);
				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {

					Room e = new Room();

					e.setBranchID(rs.getInt(2));
					e.setRoomNo(rs.getString(4));
					e.setRoomName(rs.getString(5));
					e.setRoomType(rs.getInt(6));
					e.setBlockID(rs.getInt(3));
					e.setId(rs.getInt(1));

					// System.out.println(e.getBranch());

					list.add(e);
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return list;
		}

	

	public static int save(Room e) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into rooms(roomBranch, blockID, roomNo, roomName, roomType, Status) values (?,?,?,?,?,?)");
			
			ps.setInt(1, e.getBranchID());
			ps.setInt(2, e.getBlockID());
			
			ps.setString(3, e.getRoomNo());
			ps.setString(4, e.getRoomName());
			ps.setInt(5, e.getRoomType());
			
			ps.setString(6, e.getRoomStatus());

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
			PreparedStatement ps = con.prepareStatement("delete from rooms where id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public static Room getRoomByBlock(String sid) {
		Room e = new Room();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from rooms where blockID=? ORDER BY roomNo ASC;");
			ps.setString(1, sid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setRoomNo(rs.getString(2));
				e.setRoomName(rs.getString(3));
				e.setRoomType(rs.getInt(4));
				e.setBlockID(rs.getInt(5));
				e.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static int updateStatus(Room e) {
		int status = 0;


		try {

			Connection con = DBConnection.getConnection();
			
			String query = "update rooms set Status=? where id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, e.getRoomStatus());
			ps.setInt(2, e.getId());

			status = ps.executeUpdate();
			
			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static Branch getBranchByBranchId(String sid) {
		Branch b = new Branch();
		
		try {
			
			
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from branches where id=? ORDER BY id ASC;");
			ps.setString(1, sid);


			ResultSet rs = ps.executeQuery();


			if (rs.next()) {


				b.setId(rs.getInt(1));
				b.setDisplayName(rs.getString(3));
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	
}
