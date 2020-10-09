<!DOCTYPE html>
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

<title>Add new Branch</title>

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
</style>
</head>

<body>
<body onload="startTime()">



	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="c">
					<h4>

						<a href="B_View.jsp" class="badge badge-light">View All
							Branches</a>
					</h4>
				</div>

				<div class="container mt-3 a">

					<div class="card shadow mb-4">

						<div class="card-header py-3">

							<h4 class="m-0 font-weight-bold text-primary">Add New Branch</h4>

						</div>

						<div class="card-body" style="left: 30%">

							<!-- /#Type Body Here -->
							<form action="B_SaveServlet" method="post">

								<div class="row mt-4 mb-4">

									<div class="col mr-2">
										<input style="padding: 5px" type="text" name="name"
											placeholder="Enter Branch Name.." required>
									</div>

									<div class="col mr-2">

										<input type="text" name="dname"
											placeholder="Enter Display Name..">
									</div>

								</div>

								<div class="row mt-4 mb-4">

									<div class="col mr-2">
										<input type="text" name="address"
											placeholder="Enter Address.." maxlength="100" required>
									</div>

								</div>
								<div class="row mt-4 mb-4">
									<div class="col mr-2">
										<input type="text" name="phone1"
											placeholder="Enter Phone Number 1.." maxlength="10" required>
									</div>


									<div class="col mr-2">
										<input type="text" name="phone2"
											placeholder="Enter Phone Number 2.." maxlength="10">
									</div>

									<div class="col mr-2">
										<input type="text" name="fax" placeholder="Enter Fax Number.."
											maxlength="15">
									</div>

								</div>

								<div class="row mt-4 mb-4">

									<div class="col mr-2">
										<input type="email" name="email"
											placeholder="Enter Email Address..">
									</div>

								</div>

								<br>

								<div class="row center">

									<input type="submit" value="Save Branch">
								</div>

							</form>

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
