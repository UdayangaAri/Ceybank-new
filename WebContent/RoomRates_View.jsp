<!DOCTYPE html>
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

<title>View Room Rates</title>

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

						<div class="container mt-3 a"
							style="width: 110%; margin-left: -50px;">

							<div class="card shadow mb-4">

								<div class="card-header py-3">

									<h4 class="m-0 font-weight-bold text-primary">
										Room Rates Management<br>
									</h4>

								</div>
								<div class="card-body" style="left: 30%">

									<!-- /#Type Body Here -->
									<%
										if (null != request.getAttribute("RRASucceed")) {
									%>

									<div class="alert alert-success" role="alert">Added
										Successfully..</div>

									<%
										} else if (null != request.getAttribute("RRAEmpty")) {
									%>

									<div class="alert alert-danger" role="alert">Sorry! There
										are such records. Please check again...</div>

									<%
										} else if (null != request.getAttribute("RRAFailed")) {
									%>

									<div class="alert alert-danger" role="alert">Save Failed
										..</div>

									<%
										} else if (null != request.getAttribute("RREEmpty")) {
									%>

									<div class="alert alert-danger" role="alert">Sorry! There
										are such records. Please check again...</div>

									<%
										} else if (null != request.getAttribute("RREFailed")) {
									%>

									<div class="alert alert-danger" role="alert">Edit
										Failed..</div>

									<%
										} else if (null != request.getAttribute("RRESucceed")) {
									%>

									<div class="alert alert-success" role="alert">Saved
										Successfully..</div>

									<%
										} else if (null != request.getAttribute("RRDSucceed")) {
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

									<a href='RoomRatesManagement.jsp'>Add New Room Rate</a> <br>

									<%
										String branch = (String) session.getAttribute("branch");
										String branchstatus = RoomStatusDAO.getBranchIDbyLoging(branch);

										if (branchstatus.equalsIgnoreCase("Head Office")) {
									%>

									<br>
									<form>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p style="text-align: left;">
													<b><b></b></b>
												</p>

											</div>

											<div class="col-65">
												<select name="BranchforRR" id="BranchforRR"
													onchange="this.form.submit();" required>



													<%
														String x = request.getParameter("BranchforRR");
															session.setAttribute("BranchforRR_Session", x);

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

										<table class="table" style="width: 110%; margin-left: -5%;">

											<thead class="thead-dark">

												<tr>
													<th scope="col">Status</th>
													<th scope="col">Block</th>
													<th scope="col">Room Type</th>
													<th scope="col">Meal Plan</th>
													<th scope="col">Normal Rate</th>
													<th scope="col">BOC Holiday Rate</th>
													<th scope="col">Discount</th>
													<th scope="col">Discount Type</th>

													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>

											</thead>

											<tbody>

												<%
													String RecieveBr1 = (String) session.getAttribute("BranchforRR_Session");

														List<RoomRates> list = RoomRatesDAO.getAllRoomRates(RecieveBr1);

														for (RoomRates e : list) {

															String st = e.getStatus();
												%>
												<tr>

													<%
														if (st.equals("Active")) {
													%>


													<td align='center'><img src="images/active.png" alt=""
														border=3 height=15 width=15></td>

													<%
														String a = e.getBranch();
																	String takenameofbranchname = RoomRatesDAO.getBranchName(a);

																	String b = e.getBlock();
																	String takenameofblockName = RoomRatesDAO.getBlockName(b);

																	String c = e.getRoomtype();
																	String takenameofRoomType = RoomRatesDAO.getRoomTypeName(c);
													%>
													<td style="text-align: left;"><%=takenameofblockName%></td>
													<td style="text-align: left;"><%=takenameofRoomType%></td>
													<td style="text-align: left;"><%=e.getMealplan()%></td>
													<td style="text-align: left;">Rs.<%=e.getBrate()%>.00
													</td>
													<td style="text-align: left;">Rs.<%=e.getHrate()%>.00
													</td>

													<%
														if (e.getDicount_type().equalsIgnoreCase("Amount")) {
													%>

													<td style="text-align: left;">Rs.<%=e.getDiscout()%>.00
													</td>

													<%
														} else if (e.getDicount_type().equalsIgnoreCase("Percentage")) {
													%>

													<td style="text-align: left;"><%=e.getDiscout()%>%</td>

													<%
														}
													%>

													<td style="text-align: left;"><%=e.getDicount_type()%></td>

													<td><a href='RoomRates_Edit.jsp?id=<%=e.getId()%>'>edit
															<img src="images/editicon.png" alt="" border=3 height=20
															width=20 style="float: center; margin-right: 0.5em">
													</a></td>

													<td><a
														href='RoomRates_Delete_Servlet?id=<%=e.getId()%>'>delete
															<img src="images/dlt.png" alt="" border=3 height=20
															width=20 style="float: center; margin-right: 0.5em">
													</a></td>

												</tr>


												<%
													}
												%>

												<%
													}
												%>

											</tbody>

										</table>

									</form>





									<!-- ---------------------------------------------- -->
									<!-- ---------------------------------------------- -->
									<!-- ---------------------------------------------- -->
									<!-- ---------------------------------------------- -->
									<!-- ---------------------------------------------- -->
									<!-- ---------------------------------------------- -->





									<%
										} else {
									%>

									<br>
									<form>

										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p style="text-align: left;">
													<b><b>Your Branch </b></b>
												</p>

											</div>

											<div class="col-65">
												<select name="mealtypeforRates" id="mealtypeforRates">

													<option value="" disabled selected><%=branchstatus%></option>

												</select>

											</div>

										</div>

										<table class="table" style="width: 110%; margin-left: -5%;">

											<thead class="thead-dark">

												<tr>
													<th scope="col">Status</th>

													<th scope="col">Block</th>
													<th scope="col">Room Type</th>
													<th scope="col">Meal Plan</th>
													<th scope="col">Normal Rate</th>
													<th scope="col">BOC Holiday Rate</th>
													<th scope="col">Discount</th>
													<th scope="col">Discount Type</th>

													<th scope="col">Edit</th>
													<th scope="col">Delete</th>
												</tr>

											</thead>

											<%
												Connection con = DBConnection.getConnection();
													PreparedStatement ps = con
															.prepareStatement("select * from room_rates where branch_id=? ORDER BY id ASC;");

													ps.setString(1, branch);
													rs1 = ps.executeQuery();

													while (rs1.next()) {

														if (rs1.getString(9).equalsIgnoreCase("Active")) {
											%>

											<tbody>

												<tr>

													<td align='center'><img src="images/active.png" alt=""
														border=3 height=15 width=15></td>

													<%
														String a = rs1.getString(2);
																	String takenameofbranchname = RoomRatesDAO.getBranchName(a);

																	String b = rs1.getString(3);
																	String takenameofblockName = RoomRatesDAO.getBlockName(b);

																	String c = rs1.getString(4);
																	String takenameofRoomType = RoomRatesDAO.getRoomTypeName(c);
													%>

													<td style="text-align: left;"><%=takenameofblockName%></td>
													<td style="text-align: left;"><%=takenameofRoomType%></td>
													<td style="text-align: left;"><%=rs1.getString(5)%></td>
													<td style="text-align: left;">Rs.<%=rs1.getString(6)%>.00
													</td>
													<td style="text-align: left;">Rs.<%=rs1.getString(10)%>.00
													</td>

													<%
														if (rs1.getString(8).equalsIgnoreCase("Amount")) {
													%>

													<td style="text-align: left;">Rs.<%=rs1.getString(7)%>.00
													</td>

													<%
														} else if (rs1.getString(8).equalsIgnoreCase("Percentage")) {
													%>

													<td style="text-align: left;"><%=rs1.getString(7)%>%</td>

													<%
														}
													%>

													<td style="text-align: left;"><%=rs1.getString(8)%></td>

													<td><a
														href='RoomRates_Edit.jsp?id=<%=rs1.getString(1)%>'>edit
															<img src="images/editicon.png" alt="" border=3 height=20
															width=20 style="float: center; margin-right: 0.5em">
													</a></td>

													<td><a
														href='RoomRates_Delete_Servlet?id=<%=rs1.getString(1)%>'>delete
															<img src="images/dlt.png" alt="" border=3 height=20
															width=20 style="float: center; margin-right: 0.5em">
													</a></td>

												</tr>
											</tbody>
											<%
												}

													}
											%>


										</table>

									</form>
									<%
										}
									%>

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
