package RoomStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;

import RoomTypeMaster.Room_type;
import block_Register.block;
import connections.DBConnection;

public class RoomStatusDAO {

	public static String getBranchIDbyLoging(String branchID) {

		String status = "";

		Branch r = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT B_display_name FROM branches where id=?;");

			ps.setString(1, branchID);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setDisplayName(rs.getString(1));

				status = rs.getString(1);

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static List<StatusRooms> getRoomDetails(String blockID) {

		List<StatusRooms> list = new ArrayList<StatusRooms>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM rooms where blockID=?;");
			ps.setString(1, blockID);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				StatusRooms e = new StatusRooms();

				e.setId(rs.getString(1));
				e.setRoomBranch(rs.getString(2));
				e.setBlockID(rs.getString(3));
				e.setRoomNo(rs.getString(4));
				e.setRoomName(rs.getString(5));
				e.setRoomType(rs.getString(6));
				e.setStatus(rs.getString(7));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static block getBlockNAmeByID(String blockID) {

		block r = new block();

		try {
			
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT block_name FROM block where blockID=?;");
			ps.setString(1, blockID);

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				r.setBlock_name(rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return r;
	}

	public static Room_type getRoomNAmeByID(String roomTypeID) {

		Room_type r = new Room_type();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT RoomTypeName FROM roomtypes where roomTypeId=?;");

			ps.setString(1, roomTypeID);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setRoom_Type(rs.getString(1));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return r;
	}
	
	public static block getBranchNameByID(String branchID) {

		block r = new block();

		try {
			
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT B_display_name FROM branches where id=?;");
			ps.setString(1, branchID);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			
				r.setBlock_name(rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return r;
	}

}