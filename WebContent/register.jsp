<!DOCTYPE html>
<%@page import="connections.DBConnection"%>
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
%>

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/sample.css">

<script type="text/javascript" src="js/clock.js"></script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Register Page</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<style>
div.c {
	text-align: right;
}

div.a {
	width: 80%;
}

.center {
	margin: auto;
	width: 30%;
	padding: 20px;
}
}
</style>


</head>

<body onload="startTime()">

	<%
		try {

			Connection con = DBConnection.getConnection();
			System.out.println("Printing connection object " + con);

			Statement statement = con.createStatement();
			Statement st = con.createStatement();

			resultset = statement.executeQuery("select * from role");
			rs = st.executeQuery("select * from branches");
		} catch (Exception e) {
			e.printStackTrace();
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

									<h4 class="m-0 font-weight-bold text-primary">User
										Registration Page</h4>
								</div>
								<div class="card-body" style="left: 30%">


									<!-- /#Type Body Here -->
									<form method="POST" class="forms" action="RegisterServlet"
										method="post">

										<%
											if (null != request.getAttribute("RSuccessed")) {
										%>

										<div class="alert alert-success" role="alert">User
											Registered Successfully..</div>

										<%
											} else if (null != request.getAttribute("RFailed")) {
										%>

										<div class="alert alert-danger" role="alert">Cannot
											Register the user..</div>

										<%
											}
										%>

										<div class="row mt-1 mb-1">

											<div class="col-65">
												<input type="text" name="eno"
													placeholder="Enter Employee Number.." required>
											</div>
											
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-65">
												<input type="text" name="fname"
													placeholder="Enter First Name.." required>
											</div>
											
										</div>
										
										<div class="row mt-1 mb-1">

											<div class="col-65">
												<input type="text" name="lname"
													placeholder="Enter Last Name.." required>
													
											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="col-65">

												<label> <input type="radio" name="Gender"
													value="Male" id="Gender">Male
												</label> <label> <input type="radio" name="Gender"
													value="Female" id="Gender">Female
												</label> <br>
												
											</div>

										</div>

										<div class="row mt-1 mb-1">


											<div class="col-65">
												<input type="text" name="nic" maxlength="12"
													placeholder="Enter NIC Number..">
											</div>
											
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-65">
											
												<input type="text" 
													style='width: 49%' name="phoneno"
													placeholder="Enter Phone Number.." maxlength="10"
													required>
													 <input type="text" 
													style='width: 49%' name="mobile"
													placeholder="Enter Mobile Number.." maxlength="10"
													required>
											</div>
											
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-65">
												<input type="email" name="email"
													placeholder="Enter Email Address..">
													
											</div>
											
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-65">
												<input type="text" name="address"
													placeholder="Enter Address..">
													
											</div>
											
										</div>

										<br>

										<div class="row mt-1 mb-1">

											<div class="col-65">
												<input type="text" name="defpwd"
													placeholder="Enter Default Password.." required>
											</div>
											
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-65">
												<select name="role" required>

													<option value="" disabled selected>Select Role</option>
													<%
														while (resultset.next()) {
													%>
													<option><%=resultset.getString(2)%></option>
													<%
														}
													%>

												</select>
												
											</div>
											
										</div>

										<div class="row mt-1 mb-1">

											<div class="col-65">
												<select name="Branch" required>
													<option value="" disabled selected>Select Branch</option>
													<%
														while (rs.next()) {

															if (rs.getString(9).equals("Active")) {
													%>
													<option><%=rs.getString(3)%></option>
													<%
														}
														}
													%>

												</select>
												
											</div>
											
										</div>
										
										<div class="row mt-1 mb-1">

											<div class="col-65">
												<input type="text" readonly name="Status" value="Active"
													placeholder="Active" required>

											</div>
											
										</div>

										<br> <br>
										
										<div class="row" style="float: right">

											<input type="reset" value="Clear" style="margin-right: 16px;">
											<input type="submit"
												style="float: left; margin-right: 250px;" value="Register">
										</div>
										
									</form>
									
								</div>
								
							</div>

						</div>
						<!-- Content Row -->

						<div class="row">

							<!-- cards starts -->

							<!-- cards end -->
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
