<!DOCTYPE html>
<%@page import="Roles.RoleDao"%>
<%@page import="Roles.Role"%>
<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@page import="Update.EmpDao"%>
<%@page import="Update.Emp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>
<html lang="en">

<%
	String eno = (String) session.getAttribute("eno");
	ResultSet resultset = null;
	ResultSet rs = null;
%>
<%
	String sid = (String) session.getAttribute("Username");

	LoginBean e = LoginDao.getEmployeeById(sid);

	Role j = RoleDao.getRoleById(e.getRole());

	Branch b = BranchDao.getBranchById(e.getBranch());
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

<title>User Profile</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

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

									<h4 class="m-0 font-weight-bold text-primary">User Profile</h4>
								</div>
								<div class="card-body" style="left: 30%">

									<form method="POST" action="EditServlet2" method="post">

										<%
											if (null != request.getAttribute("errorMessage")) {
												out.println(request.getAttribute("errorMessage"));
											}
										%>

										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p>Employee Number</p>

											</div>

											<div class="col-65">
												<input type="text" name="empno" readonly
													value="<%=e.getEmpno()%>" required>
											</div>
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p>First Name</p>

											</div>

											<div class="col-65">
												<input type="text" name="fname" readonly
													value="<%=e.getFname()%>" required>
											</div>
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p>Last name</p>

											</div>

											<div class="col-65">
												<input type="text" name="uname" readonly
													value="<%=e.getLname()%>" required>
											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p>NIC</p>

											</div>

											<div class="col-65">
												<input type="text" name="nic" readonly
													value="<%=e.getNic()%> " maxlength="12">
											</div>

										</div>

										<br>
										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p>Role</p>

											</div>

											<div class="col-65">
												<input type="text" name="role" readonly
													value="<%=j.getRole()%>">
											</div>
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p>Branch</p>

											</div>

											<div class="col-65">
												<input type="text" name="branch" readonly
													value="<%=b.getDisplayName()%>">
											</div>

										</div>

										<br>

										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p>Mobile</p>

											</div>

											<div class="col-65">
												<input type="text" name="mobile" readonly maxlength="10"
													value="<%=e.getMobile()%>">
											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p>Status</p>

											</div>

											<div class="col-65">
												<input type="text" name="status" readonly value="Active">
											</div>

										</div>

										<br>

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
	</script>

</body>

</html>
