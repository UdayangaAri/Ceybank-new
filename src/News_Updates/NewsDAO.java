package News_Updates;

import java.sql.Connection;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import RoomManagement.Room;
import connections.DBConnection;

public class NewsDAO {

	public static int save(NewsBean n) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into newsupdates (Description,Date,Title) values (?,CURRENT_TIMESTAMP,?)");

			ps.setString(1, n.getDescription());
			ps.setString(2, n.getTitle());

			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int update(NewsBean r) {
		int status = 0;

		try {
			Connection con = DBConnection.getConnection();
			//System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

			String query = "update newsupdates set Description=?, Date=CURRENT_TIMESTAMP, Title=? where NewsID=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, r.getDescription());
			ps.setString(2, r.getTitle());
			
			ps.setInt(3, r.getId());

			status = ps.executeUpdate();

			con.close();

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static NewsBean getNewsById(String sid) {
		NewsBean b = new NewsBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from newsupdates where NewsID=? ORDER BY NewsID ASC;");
			//PreparedStatement ps = con.prepareStatement("select * from newsupdates where id=? ORDER BY NewsID ASC;");
			ps.setString(1, sid);
			//System.out.println("///////////////////////////////////");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setId(rs.getInt(1));
				
				b.setDescription(rs.getString(3));
				b.setTitle(rs.getString(2));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}
	
	public static List<NewsBean> getAllNews() {
		List<NewsBean> list = new ArrayList<NewsBean>();

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM newsupdates ORDER BY NewsID DESC LIMIT 5;");
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				NewsBean e = new NewsBean();

				e.setTitle(rs.getString(2));
				e.setDescription(rs.getString(3));
				e.setId(rs.getInt(1));

				list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


}
