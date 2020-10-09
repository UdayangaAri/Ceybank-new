<%@page import="login.LoginDao"%>
<%@page import="login.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<!-- #9999ff -->

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Update Role</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/register.css">
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css" href="css/sample.css">

<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/All.css">

<script type="text/javascript" src="js/clock.js"></script>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body onload="startTime()">

	<div class="d-flex" id="wrapper">

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

								<h4 class="m-0 font-weight-bold text-primary">Add New Role</h4>
							</div>
							<div class="card-body" style="left: 30%">

								<div class="container">

									<form action="SaveServlet" method="post">

										<div class="row">

											<div class="col-75">
												<input type="text" name="name" placeholder="Enter Role.."
													required>
											</div>
										</div>

										<div class="row">

											<div class="col-75">
												<input type="text" name="desc"
													placeholder="Enter Role Description..">
											</div>
										</div>

										<br>

										<div class="row">

											<input type="submit" align="center" value="Save Role">
										</div>

									</form>
								</div>
								<br /> <a href='R_View.jsp' style="color: blue;">View All
									Roles</a>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

		<!-- /#page-content-wrapper -->

	</div>

	<jsp:include page="Footer.jsp"></jsp:include>
	<!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
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
