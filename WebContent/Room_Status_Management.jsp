<!DOCTYPE html>
<%@page import="RoomManagement.Room"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="block_Register.block"%>
<%@page import="javax.management.Query"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="RoomManagement.RoomDao"%>
<%@page import="connections.DBConnection"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="Roles.RoleDao"%>
<%@page import="Roles.Role"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>

<html lang="en">

<%
	ResultSet ret = null;
	ResultSet resultset = null;
	ResultSet rs = null;
	ResultSet rs1 = null;

	String Employee_Branch = (String) session.getAttribute("branch");
%>

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/sample.css">
<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="js/clock.js"></script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Room Status Management</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

</head>

<body onload="startTime()">

	<%
		try {

			Connection con = DBConnection.getConnection();
			//System.out.println("Printing connection object " + con);

			Statement st = con.createStatement();

			rs = st.executeQuery("select * from block ORDER BY block_name ASC;");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	%>

	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container">

					<div class="container mt-5 mb-5">

						<!-- body start -->

						<div class="container mt-3 a">

							<div class="card shadow mb-4">

								<div class="card-header py-3">

									<h4 class="m-0 font-weight-bold text-primary">Room Status
										Management</h4>
								</div>

								<div class="card-body" style="left: 30%">

									<%
										String Status_Succeed = (String) session.getAttribute("StatusSucceedMessage");

										String Status_Failed = (String) session.getAttribute("StatusFailedMessage");

										if (null != request.getAttribute("StatusSucceedMessage")) {
									%>
									<div class="alert alert-success" role="alert">Status
										Updated Successfully..</div>
									<%
										} else if (null != request.getAttribute("StatusFailedMessage")) {
									%>
									<div class="alert alert-danger" role="alert">Status
										Update Failed..</div>

									<%
										}
									%>
									<!-- Room_Status_Management -->

									<form action="" method="post">

										<div class="row">

											<div class="col-25">
												<p style="text-align: left;">Block</p>

											</div>

											<div class="col-35">

												<select name="block_names" id="block_names"
													onchange="this.form.submit();">

													<%
														String x = request.getParameter("block_names");
														String RecieveBlock = (String) session.getAttribute("Block_Name_Value");

														block z = blockDAO.getBlocksByUserIdForRSM(x);

														block r = blockDAO.getBlocksByUserIdForRSM(RecieveBlock);

														session.setAttribute("Block_Name_Value", x);

														if (x != null) {
													%>
													<option value="" disabled selected><%=z.getBlock_name()%></option>

													<%
														} else if (RecieveBlock != null) {
													%>
													<option value="" disabled selected><%=r.getBlock_name()%></option>
													<%
														} else {
													%>
													<option value="" disabled selected>Select a Block</option>

													<%
														}
													%>

													<%
														try {
															String Query = "select * from block where block_location=?";
															Connection con = DBConnection.getConnection();

															PreparedStatement psmtX = con.prepareStatement(Query);
															psmtX.setString(1, Employee_Branch);

															rs1 = psmtX.executeQuery();
															while (rs1.next()) {
													%>
													<option value=<%=rs1.getInt("blockID")%>><%=rs1.getString("block_name")%></option>
													<%
														}

														} catch (Exception e) {
															e.printStackTrace();
														}
													%>

												</select>

											</div>

										</div>

										<div class="row">

											<div class="col-25">
												<p style="text-align: left;">Room Name</p>

											</div>

											<div class="col-35">

												<select name="room_names" id="room_names"
													onchange="this.form.submit();">

													<%
														String rname = request.getParameter("room_names");
														session.setAttribute("Room_Name_Value", rname);

														Room rm = RoomDao.getRoomById(rname);

														if (rname != null) {
													%>
													<option value="" disabled selected><%=rm.getRoomName()%></option>
													<%
														} else {
													%>
													<option value="" disabled selected>Select a Room</option>

													<%
														}
													%>

													<%
														try {
															String Query = "select * from rooms where blockID=?";
															Connection con = DBConnection.getConnection();
															//System.out.println("Printing connection object " + con);

															PreparedStatement psmt = con.prepareStatement(Query);
															psmt.setString(1, request.getParameter("block_names"));

															rs = psmt.executeQuery();
															while (rs.next()) {
													%>
													<option value=<%=rs.getInt("id")%>><%=rs.getString("roomName")%></option>
													<%
														}

														} catch (Exception e) {
															e.printStackTrace();
														}
													%>

												</select>

											</div>

										</div>

									</form>

									<form action="Room_Status_Management" method="post">

										<div class="row">

											<div class="col-25">
												<p style="text-align: left;">Status</p>

												<%
													String RoomStatusid = request.getParameter("room_names");
												%>

											</div>

											<div>
												<input type="hidden" name="id" id="id"
													value="<%=RoomStatusid%>" onchange="myFunction()">
												<input type="hidden" name="passingValue" id="passingValue">

											</div>

											<div class="col-35">

												<%
													String RecieveBlock2 = (String) session.getAttribute("Block_Name_Value");

													try {
														Room rms = RoomDao.getRoomById(request.getParameter("room_names"));

														session.setAttribute("Room_Status_Value", rms.getRoomStatus());
														session.setAttribute("Room_Status_id", request.getParameter("room_names"));

													} catch (Exception e) {
														e.printStackTrace();
													}
												%>

												<%
													String RoomStatusValue = (String) session.getAttribute("Room_Status_Value");

													if (RoomStatusValue == "Available") {
												%>

												<label class="radio-inline"> <input type="radio"
													name="rtype" value="Available" checked> Available
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Cleaning"> Cleaning
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Reserved"> Reserved
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Occupied"> Occupied
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Maintenance"> Under maintenance
												</label>

												<%
													} else if (RoomStatusValue == "Cleaning") {
												%>

												<label class="radio-inline"> <input type="radio"
													name="rtype" value="Available"> Available
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Cleaning" checked> Cleaning
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Reserved"> Reserved
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Occupied"> Occupied
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Maintenance"> Under maintenance
												</label>

												<%
													} else if (RoomStatusValue == "Reserved") {
												%>

												<label class="radio-inline"> <input type="radio"
													name="rtype" value="Available"> Available
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Cleaning"> Cleaning
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Reserved" checked> Reserved
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Occupied"> Occupied
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Maintenance"> Under maintenance
												</label>

												<%
													} else if (RoomStatusValue == "Occupied") {
												%>

												<label class="radio-inline"> <input type="radio"
													name="rtype" value="Available"> Available
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Cleaning"> Cleaning
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Reserved"> Reserved
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Occupied" checked> Occupied
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Maintenance"> Under maintenance
												</label>

												<%
													} else if (RoomStatusValue == "Maintenance") {
												%>

												<label class="radio-inline"> <input type="radio"
													name="rtype" value="Available"> Available
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Cleaning"> Cleaning
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Reserved"> Reserved
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Occupied"> Occupied
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Maintenance" checked> Under
													maintenance
												</label>

												<%
													} else {
												%>

												<label class="radio-inline"> <input type="radio"
													name="rtype" value="Available"> Available
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Cleaning"> Cleaning
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="fb"> Reserved
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="ronly"> Occupied
												</label> <label class="radio-inline"> <input type="radio"
													name="rtype" value="Maintenance"> Under maintenance
												</label>

												<%
													}
												%>

											</div>

										</div>

										<div class="row" style="align: center">

											<div class="col-25"></div>

											<div class="col-25">

												<input type="submit" value="Save Details"
													style="align: center">

											</div>

										</div>

									</form>

								</div>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>

	<!-- /#page-content-wrapper -->

	<jsp:include page="Footer.jsp"></jsp:include>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("active");
		});

		$(document).ready(function() {

			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});

		});

		var dropdown = document.getElementsByClassName("dropdown-btn");
		var i;

		for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var dropdownContent = this.nextElementSibling;
				if (dropdownContent.style.display === "block") {
					dropdownContent.style.display = "none";
				} else {
					dropdownContent.style.display = "block";
				}
			});
		}

		window.history.forward();
		function noBack() {
			window.history.forward();
		}
		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>

</body>

</html>
