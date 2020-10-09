<!DOCTYPE html>
<%@page import="RoomTypeMaster.roomTypeDAO"%>
<%@page import="RoomTypeMaster.Room_type"%>
<%@page import="connections.DBConnection"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="block_Register.block"%>
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

<title>Edit Room Types</title>

</head>

<body onload="startTime()">




	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<div class=container-fluid>

			<div id="content">

				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container">

					<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Edit Room
									Types</h4>
							</div>
							<div class="card-body" style="left: 30%">


								<%
									String sid = request.getParameter("id");

									int o = Integer.parseInt(sid);

									Room_type e = roomTypeDAO.getRoomTypeById(o);
								%>


								<form method="POST" class="forms" action="RoomType_editServlet"
									method="post">

									<div class="row">

										<div class="col-25">
											<p>Room Type Id</p>

										</div>

										<div class="col-75">
											<input type="text" readonly name="room_type_id"
												value="<%=e.getId()%>" required>
										</div>
									</div>


									<div class="row">

										<div class="col-25">
											<p>Room Type</p>

										</div>

										<div class="col-75">
											<input type="text" name="room_type_n"
												value="<%=e.getRoom_Type()%>" required>
										</div>
									</div>





									<div class="row">
										<input type="submit" value="Edit & Save" />
									</div>
								</form>

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
