package block_Register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;
import block_Register.blockBean;
import connections.DBConnection;

public class blockDAO {

	public static int update(block r) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			// System.out.println("Printing connection object " + con);

			String query = "update block set block_location=?,block_name=?,block_status=? where blockID=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, r.getLocation());
			ps.setString(2, r.getBlock_name());
			ps.setString(3, r.getBlock_status());
			ps.setInt(4, r.getId());

			status = ps.executeUpdate();

			// System.out.println(status);

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static block getBlockById(String sid) {
		block b = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from block where blockID=? ORDER BY blockID ASC;");

			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setBlock_name(rs.getString(3));
				b.setLocation(rs.getInt(2));
				b.setBlock_status(rs.getString(4));

				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	public static block getBlocksById(String sid) {
		block b = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from block where block_name=? ORDER BY blockID ASC;");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setBlock_name(rs.getString(3));
				b.setLocation(rs.getInt(2));
				b.setBlock_status(rs.getString(4));
				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	public static List<block> getAllBranches() {

		List<block> list = new ArrayList<block>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from block ORDER BY blockID ASC;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				block e = new block();

				e.setLocation(rs.getInt(2));
				e.setBlock_name(rs.getString(3));
				e.setBlock_status(rs.getString(4));

				e.setId(rs.getInt(1));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static int save(block b) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into block(block_location,block_name,block_status) values (?,?,?)");

			ps.setInt(1, b.getLocation());
			ps.setString(2, b.getBlock_name());
			ps.setString(3, b.getBlock_status());

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
			PreparedStatement ps = con.prepareStatement("delete from block where blockID=?");
			// System.out.println("Printing connection object " + con);
			ps.setInt(1, id);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public static int deactivate(block b) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			// System.out.println("Printing connection object " + con);

			String query = "update block set block_status=? where blockID=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(2, b.getId());
			ps.setString(1, b.getBlock_status());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static blockBean getBlockByUser(String sid) {
		blockBean b = new blockBean();

		// System.out.println("SID : " + sid);

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con
					.prepareStatement("select * from block where block_location=? ORDER BY blockID ASC;");
			ps.setString(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setBlk_name(rs.getString(3));
				b.setB_Location(rs.getInt(2));
				b.setBlk_status(rs.getString(4));

				b.setB_id(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	public static Branch getBranchesById(String id) {
		Branch e = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con
					.prepareStatement("select B_display_name,id from branches where B_display_name=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setDisplayName(rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static Branch getBranchIdByName(int sid) {
		Branch e = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con
					.prepareStatement("select B_display_name,id from branches where id=? ORDER BY B_display_name ASC ");
			ps.setInt(1, sid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				e.setId(rs.getInt(2));
				e.setDisplayName(rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static List<block> getAllBlocks() {
		List<block> list = new ArrayList<block>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from block ORDER BY block_location ASC;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				block e = new block();

				e.setLocation(rs.getInt(2));
				e.setBlock_name(rs.getString(3));
				e.setBlock_status(rs.getString(4));
				e.setId(rs.getInt(1));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static block getBlocksByUserID(int sid) {
		block b = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from block where blockID=? ORDER BY block_location ASC;");
			ps.setInt(1, sid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				b.setBlock_name(rs.getString(3));
				b.setLocation(rs.getInt(2));
				b.setBlock_status(rs.getString(4));

				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	public static block getBlocksByUserIdForRSM(String sid) {
		block b = new block();

		try {

			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from block where blockID=? ORDER BY blockID ASC;");
			ps.setString(1, sid);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				b.setBlock_name(rs.getString(3));
				b.setLocation(rs.getInt(2));
				b.setBlock_status(rs.getString(4));

				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

	public static block getBlockByIdForRooms(int sid) {
		block b = new block();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from block where blockID=? ORDER BY block_location ASC;");

			ps.setInt(1, sid);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setBlock_name(rs.getString(3));
				b.setLocation(rs.getInt(2));
				b.setBlock_status(rs.getString(4));

				b.setId(rs.getInt(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}

}
