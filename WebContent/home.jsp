<!DOCTYPE html>
<%@page import="News_Updates.NewsDAO"%>
<%@page import="News_Updates.NewsBean"%>
<%@page import="connections.DBConnection"%>
<%@page import="RoomRates.RoomRatesDAO"%>
<%@page import="register.RegisterBean"%>
<%@page import="dashboard.dashboardDAO"%>
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
	ResultSet rs = null;
	ResultSet r1 = null;
%>

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/sample.css">
<link rel="stylesheet" type="text/css" href="css/simple-sidebar.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="js/clock.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Home</title>

<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body onload="startTime()">

	<%
		try {

			Connection con = DBConnection.getConnection();

			Statement st = con.createStatement();
			Statement st1 = con.createStatement();

			r1 = st1.executeQuery("SELECT Description,Date,Title FROM newsupdates ORDER BY NewsID DESC LIMIT 5;");

			rs = st.executeQuery("select * from news_images");

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		//NewsBean ew = NewsDAO.getNewsById();

		String countEmpOnBranch = (String) session.getAttribute("countEmpOnBranch");
		//System.out.println("countEmpOnBranch  :" +countEmpOnBranch);
	%>
	<!-- java methods end -->

	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class="container-fluid">
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container mt-5 mb-5"
					style="height: 80vh; overflow-y: scroll;">

					<!-- body start -->

					<div class="container-fluid">
						<%
							String name = (String) session.getAttribute("Username");
							//System.out.println("name : "+name);

							String empno = (String) session.getAttribute("empno");
							//System.out.println("empno: "+empno);
							String branch = (String) session.getAttribute("branch");
							String takenameofbranchname = RoomRatesDAO.getBranchName(branch);
							//System.out.println("takenameofbranchname : "+takenameofbranchname);
						%>

						<br>

						<div class="card shadow mb-4">

							<div class="card-body">

								<!--  <a href='NewFile.jsp'>Add New Room Rate</a> <br>	-->
								
						
								<div id="carouselExampleIndicators" class="carousel slide"
									data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0"
											class="active"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>

									</ol>
									<div class="carousel-inner">

										<div class="carousel-item active">
											<img src="images/Dickoya.JPG" width="auto" height="383"
												class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item ">
											<img src="images/222.jpg" class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="images/444.jpg" class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="images/777.jpg" class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="images/888.jpg" class="d-block w-100" alt="...">
										</div>

									</div>
									<a class="carousel-control-prev"
										href="#carouselExampleIndicators" role="button"
										data-slide="prev"> <span
										class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next"
										href="#carouselExampleIndicators" role="button"
										data-slide="next"> <span
										class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="sr-only">Next</span>
									</a>
								</div>

							</div>
						</div>

						<!-- ----------------- IMAGE LOADER ----------------- -->
						<div class="card shadow mb-4 ">

							<div class="card-body mb-3">

								<h4 class="">CeyBank Offers</h4>
								<img src="ImageLoader.jsp" width="auto" height="383">
								<hr class="my-4">

								<p class="lead">
									<a class="btn btn-primary btn-lg" href="All_offers_View.jsp"
										role="button">View more offers </a>
								</p>

							</div>

						</div>

						<!-- --------------- IMAGE LOADER END --------------- -->

						<div class="card-body mb-3 ">

							<%
								while (r1.next()) {
							%>
							<div class="card " style="height: auto;">

								<div class="card-body">
									<p style="font-weight: bold; color: black; text-align: left;"><%=r1.getString(3)%></p>

									<p style="color: black; text-align: left; font-size: 12px;"><%=r1.getString(1)%></p>
									<p
										style="font-style: italic; text-align: right; font-size: 10px;">
										Updated on -
										<%=r1.getDate(2)%></p>

								</div>

							</div>

							<%
								}
							%>

						</div>

					</div>

					<br>

				</div>
				<!-- /.container-fluid -->

				<!-- body end -->
			</div>

		</div>

	</div>

	<!-- /#page-content-wrapper -->

	<jsp:include page="Footer.jsp"></jsp:include>

	<!-- Scroll to Top Button-->

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

