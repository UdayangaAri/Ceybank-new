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

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>View Branches</title>

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

					<div class="container mt-3 a">

						<div class="card shadow mb-4">

							<div class="card-header py-3">

								<%
									if (null != request.getAttribute("Bsucceed")) {
								%>
								<div class="alert alert-success" role="alert">Saved
									Successfully..</div>

								<%
									} else if (null != request.getAttribute("Bfailed")) {
								%>

								<div class="alert alert-danger" role="alert">Save
									Failed....</div>

								<%
									} else if (null != request.getAttribute("BDfailed")) {
								%>

								<div class="alert alert-danger" role="alert">Delete
									Failed, please check is there any blocks, rooms or employees
									assigned to the branch</div>

								<%
									} else if (null != request.getAttribute("BDsucceed")) {
								%>

								<div class="alert alert-success" role="alert">Deleted
									Successfully....</div>

								<%
									} else if (null != request.getAttribute("BEsucceed")) {
								%>

								<div class="alert alert-success" role="alert">Edited
									Successfully....</div>

								<%
									} else if (null != request.getAttribute("BEfailed")) {
								%>

								<div class="alert alert-danger" role="alert">Edit
									Failed....</div>

								<%
									} else if (null != request.getAttribute("BACsucceed")) {
								%>

								<div class="alert alert-success" role="alert">Activated
									Successfully....</div>

								<%
									} else if (null != request.getAttribute("BACfailed")) {
								%>

								<div class="alert alert-danger" role="alert">Activation
									Failed....</div>

								<%
									} else if (null != request.getAttribute("BDCSucceed")) {
								%>

								<div class="alert alert-success" role="alert">Deactivated
									Successfully....</div>

								<%
									} else if (null != request.getAttribute("BDCfailed")) {
								%>

								<div class="alert alert-danger" role="alert">Deactivation
									Failed....</div>

								<%
									}
								%>


								<h4 class="m-0 font-weight-bold text-primary">Branch
									Management</h4>
							</div>
							<div class="card-body" style="left: 30%">

								<!-- /#Type Body Here -->

								<a href='B_management.jsp'>Add New Branch</a> <br>

								<%
									List<Branch> list = BranchDao.getAllBranches();
								%>

								<br>

								<form>

									<table class="table">

										<thead class="thead-dark">
											<tr>

												<th scope="col">Display Name</th>

												<th scope="col">Status</th>

												<th scope="col">Name</th>

												<th scope="col">Phone 1</th>

												<th scope="col">Fax</th>
												<th scope="col">Email</th>

												<th scope="col">Edit</th>
												<th scope="col">Delete</th>
											</tr>

										</thead>

										<tbody>

											<%
												for (Branch e : list) {

													String st = e.getStatus();
											%>
											<tr>

												<%
													if (st.equals("Active")) {
												%>

												<td style="text-align: left;"><%=e.getDisplayName()%></td>

												<td align='center'><img src="images/active.png" alt=""
													border=3 height=15 width=15></td>

												<td style="text-align: left;"><%=e.getName()%></td>
												<td style="text-align: left;"><%=e.getPhone1()%></td>

												<td style="text-align: left;"><%=e.getFax()%></td>
												<td style="text-align: left;"><%=e.getEmail()%></td>

												<td><a href='B_Edit.jsp?id=<%=e.getId()%>'>edit <img
														src="images/editicon.png" alt="" border=3 height=20
														width=20 style="float: center; margin-right: 0.5em"></a></td>

												<td><a href='B_DeleteServlet?id=<%=e.getId()%>'>delete
														<img src="images/delete.png" alt="" border=3 height=20
														width=20 style="float: center; margin-right: 0.5em">
												</a></td>

											</tr>
											<tr>
												<%
													} else if (st.equals("Deactive")) {
												%>

												<td style="text-align: left;"><%=e.getDisplayName()%></td>

												<td align='center'><img src="images/inactive.png"
													alt="" border=3 height=15 width=15></td>

												<td style="text-align: left;"><%=e.getName()%></td>
												<td style="text-align: left;"><%=e.getPhone1()%></td>

												<td style="text-align: left;"><%=e.getFax()%></td>
												<td style="text-align: left;"><%=e.getEmail()%></td>

												<td><a href='B_Edit.jsp?id=<%=e.getId()%>'>edit <img
														src="images/editicon.png" alt="" border=3 height=20
														width=20 style="float: center; margin-right: 0.5em"></a></td>

												<td><a href='B_DeleteServlet?id=<%=e.getId()%>'>delete
														<img src="images/dlt.png" alt="" border=3 height=20
														width=20 style="float: center; margin-right: 0.5em">
												</a></td>

											</tr>

											<%
												}
											%>

											<%
												}
											%>

										</tbody>

									</table>

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
