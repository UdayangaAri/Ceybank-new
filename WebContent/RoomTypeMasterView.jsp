<!DOCTYPE html>
<%@page import="RoomTypeMaster.roomTypeDAO"%>
<%@page import="RoomTypeMaster.Room_type"%>
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
	ResultSet resultset = null;
	ResultSet rs = null;
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

<title>Room Type Master View</title>

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

					<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Room Type
									Management</h4>
							</div>
							<div class="card-body" style="left: 30%">

								<%
									if (null != request.getAttribute("RTSFailed")) {
								%>
								<div class="alert alert-danger" role="alert">Save Failed</div>
								<%
									} else if (null != request.getAttribute("RTSSucceed")) {
								%>
								<div class="alert alert-success" role="alert">Saved
									Successfully..</div>
								<%
									} else if (null != request.getAttribute("RTEFailed")) {
								%>
								<div class="alert alert-danger" role="alert">Edit Failed</div>
								<%
									} else if (null != request.getAttribute("RTESucceed")) {
								%>
								<div class="alert alert-success" role="alert">Edited
									Successfully..</div>
								<%
									} else if (null != request.getAttribute("RTDSucceed")) {
								%>
								<div class="alert alert-success" role="alert">Deleted
									Successfully..</div>
								<%
									} else if (null != request.getAttribute("RTDFailed")) {
								%>
								<div class="alert alert-danger" role="alert">Delete Failed</div>
								<%
									}
								%>

								<!-- /#Type Body Here -->

								<a href='RoomType_Save.jsp'>Add New Room Type</a> <br>

								<%
									List<Room_type> list = roomTypeDAO.getAllRoomType();
								%>

								<br>
								<table class="table">
									<thead class="thead-dark">
										<tr>

											<th scope="col">Room Type</th>

											<th scope="col">Edit</th>
											<th scope="col">Delete</th>

										</tr>
									</thead>
									<tbody>

										<%
											for (Room_type e : list) {
										%>
										<tr>

											<td style="text-align: left;"><%=e.getRoom_Type()%></td>


											<td><a href='RoomTypeMasterEdit.jsp?id=<%=e.getId()%>'>
													edit <img src="images/editicon.png" alt="" border=3
													height=23 width=23
													style="float: center; margin-right: 0.5em">
											</a></td>


											<td><a href="RoomType_deleteServlet?id=<%=e.getId()%>">
													delete <img src="images/dlt.png" alt="" border=3 height=23
													width=23 style="float: center; margin-right: 0.5em">
											</a></td>

										</tr>

										<%
											}
										%>

									</tbody>

								</table>

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