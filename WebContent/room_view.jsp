<!DOCTYPE html>
<%@page import="RoomTypeMaster.roomTypeDAO"%>
<%@page import="RoomTypeMaster.Room_type"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="RoomManagement.RoomDao"%>
<%@page import="RoomManagement.Room"%>
<%@page import="block_Register.block"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connections.DBConnection"%>
<%@page import="RoomStatus.RoomStatusDAO"%>
<%@page import="RoomRates.RoomRatesDAO"%>
<%@page import="RoomRates.RoomRates"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>
<html lang="en">

<%
	ResultSet resultset = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
%>

<head>

<link rel="stylesheet" type="text/css" href="css/sample.css">
<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="js/clock.js"></script>

<link href="css/sb-admin-2.min.css" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>View Rooms</title>

</head>

<body onload="startTime()">

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

<%
										if (null != request.getAttribute("editedMessageRMF")) {
									%>

									<div class="alert alert-danger" role="alert">Edit
										Failed..</div>

									<%
										} else if (null != request.getAttribute("RRDSucceed")) {
											System.out.println("01 ::: Edit message recieverd");
									%>

									<div class="alert alert-success" role="alert">Deleted
										Successfully..</div>

									<%
										} else if (null != request.getAttribute("RRDFailed")) {
									%>

									<div class="alert alert-danger" role="alert">Delete
										Failed..</div>

									<%
										}
									%>
									
									<h4 class="m-0 font-weight-bold text-primary">
										Room Management<br>
									</h4>

								</div>

								<div class="card-body" style="left: 30%">

									<!-- /#Type Body Here -->
									
									<a href='room_save.jsp'>Add New Room</a> <br>

									<%
										String branch = (String) session.getAttribute("branch");
										String branchstatus = RoomStatusDAO.getBranchIDbyLoging(branch);

										if (branchstatus.equalsIgnoreCase("Head Office")) {

											//System.out.println("branch ::: " + branchstatus);
									%>

									<br>

									<form method="post" action="">

										<div class="row mt-1 mb-1">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Select branch</b></b>
												</p>

											</div>

											<div class="col-65">

												<select name="BranchforR" id="BranchforR"
													onchange="this.form.submit();" required>

													<%
														String x = request.getParameter("BranchforR");
															session.setAttribute("BranchforR_Session", x);

															//System.out.println("x ::: " + x);

															block b1 = RoomStatusDAO.getBranchNameByID(x);

															if (x != null) {
													%>
													<option value="" disabled selected><%=b1.getBlock_name()%></option>

													<%
														} else {
													%>
													<option value="" disabled selected>Select branch</option>

													<%
														}

															try {
																String Query = "select * from branches";
																Connection con = DBConnection.getConnection();

																PreparedStatement psmtX = con.prepareStatement(Query);

																rs1 = psmtX.executeQuery();
																while (rs1.next()) {
													%>

													<option value=<%=rs1.getInt("id")%>><%=rs1.getString("B_display_name")%></option>
													<%
														}
															} catch (Exception e) {
																e.printStackTrace();
															}
													%>
												</select>

											</div>

										</div>

										<br>

										<table class="table">

											<thead class="thead-dark">

												<tr>

													<th scope="col">Block Name</th>
													<th scope="col">Room Name</th>
													<th scope="col">Room Type</th>

													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>

											</thead>

											<tbody>

												<%
													String RecieveBr1 = (String) session.getAttribute("BranchforR_Session");

														//System.out.println("RecieveBr1 ::: " + RecieveBr1);

														List<Room> list = RoomDao.getAllRooms01(RecieveBr1);

														for (Room e : list) {
															block bb = blockDAO.getBlockByIdForRooms(e.getBlockID());

															if (bb.getBlock_status().equals("Active")) {

																//System.out.println("01 e.getRoomName() ::: " + e.getRoomName());
												%>
												<tr>

													<%
														int a = e.getBranchID();
																	String str1 = Integer.toString(a);

																	String takenameofbranchname = RoomRatesDAO.getBranchName(str1);

																	int b = e.getBlockID();
																	String str2 = Integer.toString(b);

																	String takenameofblockName = RoomRatesDAO.getBlockName(str2);

																	int c = e.getRoomType();
																	String str3 = Integer.toString(c);
																	String takenameofRoomType = RoomRatesDAO.getRoomTypeName(str3);
													%>
													
													<td><%=takenameofblockName%><img
														src="images/active.png" alt="" border=3 height=13 width=13
														style="float: center; margin-right: 0.5em"></td>
														
													<td style="text-align: left;"><%=e.getRoomName()%></td>

													<td style="text-align: left;"><%=takenameofRoomType%></td>

													<td><a href='room_edit.jsp?id=<%=e.getId()%>'>
															edit <img src="images/editicon.png" alt="" border=3
															height=15 width=15
															style="float: center; margin-right: 0.5em">
													</a></td>

													<td><a href="RoomDelete?id=<%=e.getId()%>"> delete
															<img src="images/dlt.png" alt="" border=3 height=17
															width=17 style="float: center; margin-right: 0.5em">
													</a>
													<td>
												</tr>

												<%
													//System.out.println("02 e.getId() ::: " + e.getId());

															} else if (bb.getBlock_status().equals("Deactive")) {

																//System.out.println("02 e.getRoomName() ::: " + e.getRoomName());
												%>

												<tr>

													<%
														int a = e.getBranchID();
																	String str1 = Integer.toString(a);

																	String takenameofbranchname = RoomRatesDAO.getBranchName(str1);

																	int b = e.getBlockID();
																	String str2 = Integer.toString(b);

																	String takenameofblockName = RoomRatesDAO.getBlockName(str2);

																	int c = e.getRoomType();
																	String str3 = Integer.toString(c);
																	String takenameofRoomType = RoomRatesDAO.getRoomTypeName(str3);
													%>
													<td><%=takenameofblockName%><img
														src="images/inactive.png" alt="" border=3 height=13
														width=13 style="float: center; margin-right: 0.5em"></td>
													<td><%=e.getRoomName()%></td>

													<td><%=takenameofRoomType%></td>

													<td><a href='room_edit.jsp?id=<%=e.getId()%>'>
															edit <img src="images/editicon.png" alt="" border=3
															height=15 width=15
															style="float: center; margin-right: 0.5em">
													</a></td>

													<td><a href="RoomDelete?id=<%=e.getId()%>"> delete
															<img src="images/dlt.png" alt="" border=3 height=17
															width=17 style="float: center; margin-right: 0.5em">
													</a>
													<td>
												</tr>

												<%
													//System.out.println("02 e.getId() ::: " + e.getId());

															}
														}
												%>

											</tbody>

										</table>

										<!-- ---------------------------------------------- -->
										<!-- ---------------------------------------------- -->
										<!-- ---------------------------------------------- -->
										<!-- ---------------------------------------------- -->
										<!-- ---------------------------------------------- -->
										<!-- ---------------------------------------------- -->

										<%
											} else {

												//System.out.println("02 ::: other branch ::: " + branchstatus);
										%>

										<br>
										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p >
													<b><b>Your Branch </b></b>
												</p>

											</div>

											<div class="col-65">
												<select name="mealtypeforRates" id="mealtypeforRates">

													<option value="" disabled selected><%=branchstatus%></option>

												</select>

											</div>

										</div>

										<table class="table">

											<thead class="thead-dark">

												<tr>
													<th scope="col">Block Name</th>
													<th scope="col">Room Name</th>
													<th scope="col">Room Type</th>

													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>

											</thead>

											<%
												List<Room> list1 = RoomDao.getAllRooms01(branch);
											%>

											<tbody>

												<%
													for (Room e1 : list1) {

															block b = blockDAO.getBlockByIdForRooms(e1.getBlockID());

															Room_type r = roomTypeDAO.getRoomTypeById(e1.getRoomType());

															if (b.getBlock_status().equals("Active")) {

																//System.out.println("Active ::: " + e1.getRoomNo());
												%>

												<tr>

													<td><%=b.getBlock_name()%> <img
														src="images/active.png" alt="" border=3 height=13 width=13
														style="float: center; margin-right: 0.5em"></td>

													<td style="text-align: left;"><%=e1.getRoomNo()%></td>
													<td style="text-align: left;"><%=r.getRoom_Type()%></td>

													<td><a href='room_edit.jsp?id=<%=e1.getId()%>'>
															edit <img src="images/editicon.png" alt="" border=3
															height=15 width=15
															style="float: center; margin-right: 0.5em">
													</a></td>

													<td><a href="RoomDelete?id=<%=e1.getId()%>">
															delete <img src="images/dlt.png" alt="" border=3
															height=17 width=17
															style="float: center; margin-right: 0.5em">
													</a>
													<td>
												</tr>

												<%
													} else if (b.getBlock_status().equals("Deactive")) {

																//System.out.println("Deactive ::: " + e1.getRoomNo());
												%>
												<tr>

													<td><%=b.getBlock_name()%> <img
														src="images/inactive.png" alt="" border=3 height=13
														width=13 style="float: center; margin-right: 0.5em"></td>
													<td style="text-align: left;"><%=e1.getRoomNo()%></td>
													<td style="text-align: left;"><%=r.getRoom_Type()%></td>


													<td><a href='room_edit.jsp?id=<%=e1.getId()%>'>
															edit <img src="images/editicon.png" alt="" border=3
															height=15 width=15
															style="float: center; margin-right: 0.5em">
													</a></td>

													<td><a href="RoomDelete?id=<%=e1.getId()%>">
															delete <img src="images/dlt.png" alt="" border=3
															height=17 width=17
															style="float: center; margin-right: 0.5em">
													</a>
													<td>
												</tr>
												<%
													}
														}
												%>
											</tbody>

											<%
												}
											%>


										</table>

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
