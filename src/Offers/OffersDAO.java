package Offers;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.Part;

import connections.DBConnection;

public class OffersDAO {

	public static int saveImage(OffersBean n) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into offers(image,Expire_Date,Date) values (?,?,CURRENT_TIMESTAMP)");

			InputStream inputStream = null;

			Part filePart = n.getImage();

			inputStream = filePart.getInputStream();

			ps.setBlob(1, inputStream);
			ps.setString(2, n.getExdate());

			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}
	
	public static OffersBean getNewsImage() {
		OffersBean b = new OffersBean();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("select * from offers");

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				b.setImageID(rs.getInt(1));
				b.setImages(rs.getBlob(2));
				b.setImageDate(rs.getString(3));
				b.setExdate(rs.getString(4));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;
	}
	
	
}
