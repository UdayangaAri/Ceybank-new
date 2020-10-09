<!DOCTYPE html>
<%@page import="News_Updates.NewsBean"%>
<%@page import="News_Updates.NewsDAO"%>
<%@page import="RoomTypeMaster.Room_type"%>
<%@page import="RoomTypeMaster.roomTypeDAO"%>
<%@page import="block_Register.block"%>
<%@page import="block_Register.blockDAO"%>
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

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/sample.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>News Edit</title>

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

		<!-- Side-bar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#side-bar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container">

					<%
						String sid = request.getParameter("id");
						session.setAttribute("newsID", sid);
						//System.out.println("sid x ::: " + sid);

						NewsBean n = NewsDAO.getNewsById(sid);
					%>


					<div class="container mt-5 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Edit News</h4>
							</div>
							<div class="card-body" style="left: 30%">

								<!-- /#Type Body Here -->
								
								



								<form class="forms" action="NewsEditServlet" method="post">


									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<input type="text" value="<%=n.getTitle()%>"
												name="NewsTitleEdit" placeholder="Enter News Title.."
												required>

										</div>

									</div>

									<div class="row mt-4 mb-4">

										<div class="col mr-2">

											<input type="text" value="<%=n.getDescription()%>"
												name="NewsDescriptionEdit"
												placeholder="Enter News Description.." required>
										</div>

									</div>


									<input type="text" style="visibility: hidden" name="newsID"
										value="<%=n.getId()%>" required> <br>

									<div class="row center">

										<input type="submit" value="Save Edit"
											style='margin-right: 16px'>

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

		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>

</body>

</html>
