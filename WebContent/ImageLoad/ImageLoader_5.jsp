<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connections.DBConnection"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Connection con = DBConnection.getConnection();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	OutputStream oImage = null;

	try {
		pstmt = con.prepareStatement("SELECT * FROM offers ORDER BY imageID DESC LIMIT 4,1;");
		rs = pstmt.executeQuery();

		while (rs.next()) {

			/////////////////////////////////////////////////////////////////////////////////////////////////////////

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();

			String CDate = dtf.format(now);
			String ExDate = rs.getString(4);

			SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
			if (CDate != null && ExDate != null) {
				try {
					Date date1 = myFormat.parse(CDate);
					Date date2 = myFormat.parse(ExDate);
					long diff = date2.getTime() - date1.getTime();

					long dur = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
					int durInt = (int) dur;

					if (durInt >= 0) {

						byte barray[] = rs.getBytes(2);
						response.setContentType("image/gif");
						oImage = response.getOutputStream();

						oImage.write(barray);
						oImage.flush();
						oImage.close();
						
					}

				} catch (java.text.ParseException e) {
					e.printStackTrace();
				}
			}

		}
	} catch (Exception ex) {

	} finally {

		try {

			if (con != null)
				con.close();
		} catch (Exception ex) {
			// ex.printStackTrace();
		}
	}
%>

