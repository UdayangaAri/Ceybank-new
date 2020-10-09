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


<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Edit Branches</title>
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body onload="startTime()">

	<%
		String sid = request.getParameter("id");

		Branch e = BranchDao.getBranchById(sid);
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

					<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<h4 class="m-0 font-weight-bold text-primary">Edit Branch</h4>
							</div>
							<div class="card-body" style="left: 30%">

								<form method="POST" class="forms" action="B_EditServlet2"
									method="post">

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Branch Id</p>

										</div>

										<div class="col-75">
											<input type="text" name="id" readonly value="<%=e.getId()%>"
												required>
										</div>
									</div>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Branch Name</p>

										</div>

										<div class="col-75">
											<input type="text" name="name" value="<%=e.getName()%>"
												required>
										</div>
									</div>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Display Name</p>

										</div>

										<div class="col-75">
											<input type="text" name="dname"
												value="<%=e.getDisplayName()%>">
										</div>
									</div>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Address</p>

										</div>

										<div class="col-75">
											<input type="text" name="address" value="<%=e.getAddress()%>">
										</div>
									</div>

									<br> <br>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Phone Number 1</p>

										</div>

										<div class="col-75">
											<input type="text" name="phone1" value="<%=e.getPhone1()%>"
												maxlength="10">
										</div>
									</div>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Phone Number 2</p>

										</div>

										<div class="col-75">
											<input type="text" name="phone2" value="<%=e.getPhone2()%>"
												maxlength="10">
										</div>
									</div>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Fax Number</p>

										</div>

										<div class="col-75">
											<input type="text" name="fax" value="<%=e.getFax()%>"
												maxlength="15">
										</div>
									</div>

									<br> <br>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Email Address</p>

										</div>

										<div class="col-75">
											<input type="email" name="email" value="<%=e.getEmail()%>">
										</div>
									</div>

									<div class="row">

										<div class="col-25">
											<p style="text-align: left;">Status</p>

										</div>

										<div class="col-75">
											<%
												if (e.getStatus().equals("Deactive")) {
											%>

											<input type="text" name="current_status" readonly
												value="Deactive">

											<%
												} else if (e.getStatus().equals("Active")) {
											%>

											<input type="text" name="current_status" readonly
												value="Active">
											<%
												}
											%>

										</div>
									</div>

									<br> <br>

									<div class="row">
										<input type="submit" style='margin-right: 16px' name="edit"
											value="Edit & Save">

										<%
											if (e.getStatus().equals("Deactive")) {
										%>

										<button type="button" name="Activate" value="Activate"
											style='margin-right: 16px' class="btn btn-primary"
											data-toggle="modal" data-target="#exampleModal">
											Activate</button>

										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">

												<div class="modal-content">

													<div class="modal-header">

														<h5 class="modal-title" id="exampleModalLabel">
															Are you sure want to Activate Location
															<%=e.getDisplayName()%>
															?
														</h5>

														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>

													</div>

													<div class="modal-body">
														If you activate
														<%=e.getDisplayName()%>, it will visible to all users.
													</div>

													<div class="modal-footer">

														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<input type="submit" name="Activate" value="Activate"
															style='margin-right: 16px'>

													</div>

												</div>

											</div>

										</div>
										<%
											} else if (e.getStatus().equals("Active")) {
										%>

										<button type="button" name="Deactivate" value="Deactivate"
											style='margin-right: 16px' class="btn btn-primary"
											data-toggle="modal" data-target="#exampleModal">
											Deactivate</button>

										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">

											<div class="modal-dialog" role="document">

												<div class="modal-content">

													<div class="modal-header">

														<h5 class="modal-title" id="exampleModalLabel">
															Are you sure want to Deactivate Location
															<%=e.getDisplayName()%>
															?
														</h5>

														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>

													</div>

													<div class="modal-body">
														If you deactivate
														<%=e.getDisplayName()%>, it will not be visible to users.
													</div>

													<div class="modal-footer">

														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>

														<input type="submit" name="Deactivate" value="Deactivate"
															style='margin-right: 16px'>

													</div>

												</div>

											</div>

										</div>

										<%
											}
										%>

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
