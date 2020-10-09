package RoomRates;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;
import Functions.Functions;
import Roles.Role;
import RoomTypeMaster.Room_type;
import block_Register.block;
import connections.DBConnection;

public class RoomRatesDAO {

	public static int getRoomTypeID(String roomTypeID) {

		int status = 0;

		Room_type r = new Room_type();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT roomTypeId FROM roomtypes where RoomTypeName=?;");

			ps.setString(1, roomTypeID);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setId(rs.getInt(1));
				status = rs.getInt(1);

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static String getRoomTypeName(String RoomName) {

		String status = "";

		Room_type r = new Room_type();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT RoomTypeName FROM roomtypes where roomTypeId=?;");

			ps.setString(1, RoomName);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setRoom_Type(rs.getString(1));
				status = rs.getString(1);

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static String getBlockName(String blockID) {

		String status = "";

		block r = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT block_name FROM block where blockID=?;");

			ps.setString(1, blockID);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setBlock_name(rs.getString(1));
				status = rs.getString(1);
				// System.out.println("22222222222222222222222222222222");
				// System.out.println("****************************** branchname : " +
				// rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static String getBranchName(String branchID) {

		String status = "";

		Branch r = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT B_display_name FROM branches where id=?;");

			ps.setString(1, branchID);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// System.out.println("11111111111111111111111111111111111 : ");
				r.setDisplayName(rs.getString(1));

				status = rs.getString(1);
				// System.out.println("******************************branch name : " +
				// rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int getBranchID(String branchName) {
		int status = 0;
		Branch r = new Branch();
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT id FROM branches where B_display_name=?;");
			ps.setString(1, branchName);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setId(rs.getInt(1));
				status = rs.getInt(1);
				// System.out.println("branch id : "+status);
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public static int saveRatesMnagement(RoomRates rr) {
		// System.out.println("+++++++++++++++++++++++++++++++++++++++++++");
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into room_rates(branch_id,block_id,room_type,meal_plan,normal_rate,discount,dicount_type,status,holiday_rate) values (?,?,?,?,?,?,?,?,?)");

			ps.setString(1, rr.getBranch());
			
			ps.setString(2, rr.getBlock());
			
			ps.setString(3, rr.getRoomtype());
			
			ps.setString(4, rr.getMealplan());
			
			ps.setString(5, rr.getBrate());
			
			ps.setString(6, rr.getDiscout());
			
			ps.setString(7, rr.getDicount_type());
			
			ps.setString(8, rr.getStatus());
			
			ps.setString(9, rr.getHrate());
			

			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int getBlockID(String blockName) {

		int status = 0;

		block r = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT blockID FROM block where block_name=?;");

			ps.setString(1, blockName);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setId(rs.getInt(1));
				status = rs.getInt(1);
				// System.out.println("branch id : "+status);
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static List<RoomRates> getAllRoomRates(String brchID) {

	//	System.out.println("******%%%%%%%%%%%%%%%%%%%%%%%%%%% ********");
		List<RoomRates> list = new ArrayList<RoomRates>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from room_rates where branch_id=? ORDER BY id ASC;");
			ps.setString(1, brchID);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				RoomRates e = new RoomRates();

				e.setId(rs.getString(1));
				e.setBranch(rs.getString(2));
				e.setBlock(rs.getString(3));
				e.setRoomtype(rs.getString(4));
				e.setMealplan(rs.getString(5));
				e.setBrate(rs.getString(6));
				e.setDiscout(rs.getString(7));
				e.setDicount_type(rs.getString(8));
				e.setStatus(rs.getString(9));
				e.setHrate(rs.getString(10));

				// System.out.println(e.getBranch());

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static int deleteRoomRAtes(int id) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from room_rates where id=?");
			// System.out.println("Printing connection object " + con);
			ps.setInt(1, id);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public static int updateRoomRates(String id) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			// System.out.println("Printing connection object " + con);

			// System.out.println("id of the room rates in update dao "+ id);

			// UPDATE `ceybank_rest`.`room_rates` SET `status` = 'Deactivated' WHERE (`id` =
			// '62');

			PreparedStatement ps = con
					.prepareStatement("UPDATE room_rates SET status = 'Deactive' WHERE id = " + id + ";");

			status = ps.executeUpdate();


			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static RoomRates getRoomRates(String sid) {
		RoomRates b = new RoomRates();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from room_rates where id=?;");

			ps.setString(1, sid);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setId(rs.getString(1));
				
				b.setBranch(rs.getString(2));
				
				b.setBlock(rs.getString(3));
				
				b.setRoomtype(rs.getString(4));
				
				b.setMealplan(rs.getString(5));
				b.setBrate(rs.getString(6));
				b.setDiscout(rs.getString(7));

				b.setDicount_type(rs.getString(8));
				b.setStatus(rs.getString(9));
				b.setHrate(rs.getString(10));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}
	public static int checkValues(String branchID,String blockID,String room,String meal,String active_status) {

		int status = 0;

		RoomRates b = new RoomRates();
 
		try {
			Connection con = DBConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("\n" + 
					"SELECT * FROM room_rates where branch_id=? AND block_id=? AND room_type=? AND meal_plan=? AND status=?;");
			
			ps.setString(1, branchID);
		
			ps.setString(2, blockID);
			
			ps.setString(3, room);
			
			ps.setString(4, meal);
		
			ps.setString(5, active_status);
			

			ResultSet rs = ps.executeQuery();
		
			while (rs.next()) {
				
				b.setId(rs.getString(1));
			
				b.setBranch(rs.getString(2));
			
				b.setBlock(rs.getString(3));
		
				b.setRoomtype(rs.getString(4));
			
				b.setMealplan(rs.getString(5));
			
				b.setBrate(rs.getString(6));
				
				b.setDiscout(rs.getString(7));

				b.setDicount_type(rs.getString(8));
				
				b.setStatus(rs.getString(9));
				
				b.setHrate(rs.getString(10));
			
				status++;
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static RoomRates getAllRoomRates1(String BranchID) {

		RoomRates rates = new RoomRates();

			try {
				Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("select * from room_rates where branch_id=? ORDER BY id ASC;");
				
				ps.setString(1, BranchID);
				
				ResultSet rs = ps.executeQuery();
				
				while (rs.next()) {

					RoomRates e = new RoomRates();

					e.setId(rs.getString(1));
					e.setBranch(rs.getString(2));
					e.setBlock(rs.getString(3));
					e.setRoomtype(rs.getString(4));
					e.setMealplan(rs.getString(5));
					e.setBrate(rs.getString(6));
					e.setDiscout(rs.getString(7));
					e.setDicount_type(rs.getString(8));
					e.setStatus(rs.getString(9));
					e.setHrate(rs.getString(10));

					
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return rates;
		}
	
}