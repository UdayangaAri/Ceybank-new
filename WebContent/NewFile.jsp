<!DOCTYPE html>
<%@page import="RoomStatus.RoomStatusDAO"%>
<%@page import="RoomManagement.RoomDao"%>
<%@page import="RoomManagement.Room"%>
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
<%@page import="java.sql.PreparedStatement"%>

<html lang="en">

<%
	ResultSet rSet = null;
	ResultSet r = null;
	ResultSet rs = null;
%>

<%
	//Class.forName("com.mysql.jdbc.Driver").newInstance();

	try {

		Connection con = DBConnection.getConnection();
		//System.out.println("Printing connection object " + con);

		Statement statement = con.createStatement();
		Statement st01 = con.createStatement();

		r = statement.executeQuery("select * from roomtypes");

		rSet = st01.executeQuery("select * from branches");

	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/sample.css">
<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add new room</title>

<style>
div.c {
	text-align: right;
}

div.a {
	width: 60%;
}

.center {
	margin: auto;
	width: 30%;
	padding: 20px;
}
</style>

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

					<div class="container mt-5 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Add New Room</h4>

							</div>

							<div class="card-body" style="left: 30%">

								<!-- /#Type Body Here -->

								<%
									String branch = (String) session.getAttribute("branch");
									String branchstatus = RoomStatusDAO.getBranchIDbyLoging(branch);

									String t = (String) session.getAttribute("TranslateBranch");

									if (branchstatus.equalsIgnoreCase("Head Office")) {
								%>

								<form action="" method="post">

									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<select name="branchName" onchange="this.form.submit();"
												required>

												<%
													String x = request.getParameter("branchName");
														session.setAttribute("branch_in_roomMM", x);

														String RecieveBranch = (String) session.getAttribute("branch_in_roomMM");

														//System.out.println("x ::: " + x);

														Branch z = RoomDao.getBranchByBranchId(x);

														if (x != null) {
												%>

												<option value="" disabled selected><%=z.getDisplayName()%></option>

												<%
													} else {
												%>
												<option value="" disabled selected>Select Branch</option>
												<%
													}
														while (rSet.next()) {
												%>
												<option value="<%=rSet.getInt(1)%>"><%=rSet.getString(3)%></option>
												<%
													}
												%>

											</select>

										</div>

									</div>

								</form>



								<form action="RoomSaveServlet" method="POST">

									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<select name="blockName" required>

												<option value="" disabled selected>Select Block</option>
												<%
													String status = "Active";
														try {
															String Query = "select * from block where block_location=? AND block_status=?";
															Connection con = DBConnection.getConnection();

															PreparedStatement psmtX = con.prepareStatement(Query);
															psmtX.setString(1, RecieveBranch);
															psmtX.setString(2, status);

															System.out.println("psmtX::: " + psmtX);

															rs = psmtX.executeQuery();

															while (rs.next()) {
												%>

												<option value="<%=rs.getInt(1)%>"><%=rs.getString(3)%></option>
												<%
													}
														} catch (Exception e) {
															e.printStackTrace();
														}
												%>

											</select>

										</div>

									</div>


									<input type="hidden" value="<%=RecieveBranch%>" id="BranchNo"
										name="BranchNo">


									<div class="row mt-4 mb-4">

										<div class="col mr-2">
											<input type="text" name="RoomNo" id="RoomNo"
												placeholder="Enter Room Number.." required>
										</div>

									</div>

									<div class="row mt-4 mb-4">

										<div class="col mr-2">
											<input type="text" name="Roomname" id="Roomname"
												placeholder="Enter Room Name.." required>
										</div>

									</div>

									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<select name="RoomType" required>
												<option value="" disabled selected>Select Room type</option>
												<%
													while (r.next()) {
												%>
												<option value="<%=r.getInt(1)%>"><%=r.getString(2)%></option>
												<%
													}
												%>

											</select>

										</div>

									</div>


									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<input type="text" name="roomStatus" id="roomStatus"
												value="Available" placeholder="Available.." readonly
												required>
										</div>

									</div>

									<br>

									<div class="row center">

										<input type="submit" value="Save block"
											style='margin-right: 16px'>
									</div>

								</form>

								<%
									} else {
								%>

								<form action="" method="post">

									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<select name="branchName">

												<option value="<%=branch%>" disabled selected><%=branchstatus%></option>

											</select>

										</div>

									</div>

								</form>

								<form action="RoomSaveServlet" method="POST">

									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<select name="blockName" required>

												<option value="" disabled selected>Select Block</option>
												<%
													String status = "Active";
														try {
															String Query = "select * from block where block_location=? AND block_status=?";
															Connection con = DBConnection.getConnection();

															PreparedStatement psmtX = con.prepareStatement(Query);
															psmtX.setString(1, branch);
															psmtX.setString(2, status);

															System.out.println("psmtX::: " + psmtX);

															rs = psmtX.executeQuery();

															while (rs.next()) {
												%>

												<option value="<%=rs.getInt(1)%>"><%=rs.getString(3)%></option>
												<%
													}
														} catch (Exception e) {
															e.printStackTrace();
														}
												%>

											</select>

										</div>

									</div>

									<input type="hidden" value="<%=branch%>" id="BranchNo"
										name="BranchNo">

									<div class="row mt-4 mb-4">

										<div class="col mr-2">
											<input type="text" name="RoomNo" id="RoomNo"
												placeholder="Enter Room Number.." required>
										</div>

									</div>

									<div class="row mt-4 mb-4">

										<div class="col mr-2">
											<input type="text" name="Roomname" id="Roomname"
												placeholder="Enter Room Name.." required>
										</div>

									</div>

									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<select name="RoomType" required>
												<option value="" disabled selected>Select Room type</option>
												<%
													while (r.next()) {
												%>
												<option value="<%=r.getInt(1)%>"><%=r.getString(2)%></option>
												<%
													}
												%>

											</select>

										</div>

									</div>


									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<input type="text" name="roomStatus" id="roomStatus"
												value="Available" placeholder="Available.." readonly
												required>
										</div>

									</div>

									<br>

									<div class="row center">

										<input type="submit" value="Save block"
											style='margin-right: 16px'>
									</div>

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
	</script>

</body>

</html>
