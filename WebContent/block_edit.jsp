<!DOCTYPE html>
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

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Edit Blocks</title>


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

	<%
		try {

			Connection con = DBConnection.getConnection();
			//System.out.println("Printing connection object " + con);

			Statement st = con.createStatement();

			rs = st.executeQuery("select * from branches ORDER BY B_display_name ASC;");

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

					<%
						String sid = request.getParameter("id");

						block e = blockDAO.getBlockById(sid);
					%>

					<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Edit Blocks</h4>
							</div>
							<div class="card-body" style="left: 30%">


								<form method="POST" class="forms" action="Block_editServlet"
									method="post">





									<div class="row mt-4 mb-4">

										<div class="col ml-5">
											<p style="text-align: left;">Branch</p>

										</div>

										<div class="col mr-2">
											<select name="block_l">

												<%
													Branch z = blockDAO.getBranchIdByName(e.getLocation());
												%>

												<option value="<%=z.getDisplayName()%>" selected><%=z.getDisplayName()%></option>

												<%
													while (rs.next()) {
												%>
												<option><%=rs.getString(3)%></option>

												<%
													}
												%>



											</select>
										</div>
									</div>


									<div class="row mt-4 mb-4">

										<div class="col ml-5">
											<p style="text-align: left;">Block Name</p>

										</div>

										<div class="col mr-2">
											<input type="text" name="block_n"
												value="<%=e.getBlock_name()%>" required>
										</div>
									</div>


									<div class="row mt-4 mb-4">

										<div class="col ml-5">
											<p style="text-align: left;">Block Status</p>

										</div>
										<div class="col mr-2">
											<select name="Block_s" required>
												<option value="<%=e.getBlock_status()%>" selected></option>

												<option value="Active" selected>Active</option>

												<option value="Deactive">Deactive</option>

											</select>
										</div>
									</div>
										
											<input type="hidden" name="blockID"
												value="<%=e.getId()%>" required>
									
									<div class="row center">

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
