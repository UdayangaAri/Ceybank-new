<%@page import="RoomManagement.RoomDao"%>
<%@page import="RoomManagement.Room"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="Roles.RoleDao"%>
<%@page import="Roles.Role"%>
<%@page import="RoomManagement.Room"%>
<%@page import="RoomManagement.RoomDao"%>
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

<title>Room Management</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">



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

					<!-- /#Type Body Here -->

					<h3>View Rooms</h3>

					<a href='RoomNew.jsp'>Add New Room</a> <br>

					<%
						List<Room> list = RoomDao.getAllRooms();
					%>

					<br>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Room No</th>
								<th scope="col">Room name</th>
								<th scope="col">Room type</th>
								<th scope="col">Room Description</th>
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>

							</tr>
						</thead>
						<tbody>

							<%
								for (Room e : list) {
							%>
							<tr>



								<td><%=e.getId()%></td>
								<td><%=e.getRoomNo()%></td>
								<td><%=e.getRoomName()%>></td>
								<td><%=e.getRoomType()%></td>
								<td><%=e.getBlockID()%></td>

								<td><a href='RoomEdit.jsp?id=<%=e.getId()%>'> edit <img
										src="images/edit.png" alt="" border=3 height=23 width=23
										style="float: center; margin-right: 0.5em"></a></td>

								<td><a href="DeleteServlet?id=<%=e.getId()%>"> delete <img
										src="images/delete.png" alt="" border=3 height=23 width=23
										style="float: center; margin-right: 0.5em"></a>
								<td>
							</tr>
							<tr>

								<%
									}
								%>
							
						</tbody>
					</table>

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
