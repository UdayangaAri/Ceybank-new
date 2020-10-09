<!DOCTYPE html>
<%@page import="News_Updates.NewsDAO"%>
<%@page import="News_Updates.NewsBean"%>
<%@page import="RoomTypeMaster.roomTypeDAO"%>
<%@page import="RoomTypeMaster.Room_type"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="block_Register.block"%>
<%@page import="connections.DBConnection"%>
<%@page import="RoomManagement.RoomDao"%>
<%@page import="RoomReservation.RoomDAO"%>
<%@page import="RoomManagement.Room"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html lang="en">

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/sample.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript" src="js/clock.js"></script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>News View</title>

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

					<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Update news</h4>
							</div>
							<div class="card-body" style="left: 30%">


								<!-- /#Type Body Here -->

								<%
									if (null != request.getAttribute("News_E_succeed")) {
								%>

								<div class="alert alert-success" role="alert">Edited
									Successfully....</div>

								<%
									} else if (null != request.getAttribute("News_E_failed")) {
								%>

								<div class="alert alert-danger" role="alert">Edit
									Failed....</div>

								<%
									}
								%>



								<%
									List<NewsBean> list = NewsDAO.getAllNews();
								%>

								<br>
								<table class="table">
									<thead class="thead-dark">
										<tr>

											<th scope="col">News Title</th>
											<th scope="col">News Description</th>
											<th scope="col">Edit</th>


										</tr>
									</thead>
									<tbody>

										<%
											for (NewsBean e : list) {
										%>

										<tr>

											<td style="text-align: left;"><%=e.getTitle()%></td>
											<td style="text-align: left;"><%=e.getDescription()%></td>

											<td><a href='News_edit.jsp?id=<%=e.getId()%>'> edit
													<img src="images/editicon.png" alt="" border=3 height=15
													width=15 style="float: center; margin-right: 0.5em">
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