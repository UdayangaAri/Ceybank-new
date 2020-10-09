
<!DOCTYPE html>
<%@page import="sidebar.sideBarBeanClass"%>
<%@page import="Functions.FunctionDAO"%>
<%@page import="access.RoleFunctionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sidebar.sidebarDAO"%>
<%@page import="access.RoleFunction"%>
<%@page import="Update.Emp"%>
<%@page import="Functions.FunctionDAO"%>
<%@page import="Functions.Functions"%>
<%@page import="connections.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Roles.RoleDao"%>
<%@page import="Roles.Role"%>

<html lang="en">

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/sample.css">
<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">



<script type="text/javascript" src="js/clock.js"></script>

<script type="text/javascript" src="dist/js/bootstrap.min.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">





<title>Page Access</title>

<style>
.my-custom-scrollbar {
	position: relative;
	height: 500px;
	overflow: auto;
}

.table-wrapper-scroll-y {
	display: bloack;
}
</style>




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


				<%
					Integer roleIDByName = (Integer) session.getAttribute("roleIDByName");
				%>
				<%
					String message = (String) request.getAttribute("alertMsg");
				%>


				<%
					if (null != request.getAttribute("AFFailed")) {
				%>

				<div class="alert alert-danger" role="alert">Sorry! You can't
					add this access. Please check again...</div>

				<%
					} else if (null != request.getAttribute("AFSucceed")) {
				%>

				<div class="alert alert-success" role="alert">Added
					Successfully..</div>

				<%
					} else if (null != request.getAttribute("EFFailed")) {
				%>

				<div class="alert alert-success" role="alert">Sorry! You can't
					change this access. Please check again...</div>

				<%
					} else if (null != request.getAttribute("EFSucceed")) {
				%>

				<div class="alert alert-success" role="alert">Changed
					Successfully..</div>

				<%
					}
				%>


				<div class="row mt-3 mb-3"></div>

				<div class="container mt-5 mb-5">

					<!-- body start -->

					<div class="container mt-3 a">


						<div class="card shadow mb-4">

							<div class="card-header py-3">


								<a href='Role.jsp'>Back to Select Roles</a> <br>
							</div>
							<div class="card-body" style="left: 30%">



								<div class="row">
									<div class="col-sm-6">
										<div class="card">
											<div class="card-body">


												<h4 class="m-0 font-weight-bold text-primary">Edit the
													assigned pages</h4>
												<form method="POST" class="forms"
													action="editFunctionServlet">


													<br>

													<table class="table" style="width: 90%; margin-left: 10%">
														<thead class="thead-dark">
															<tr>
																<th hidden>Function ID</th>
																<th scope="col">Main Functions</th>
																<th scope="col">Sub Functions</th>
																<th scope="col"></th>

															</tr>
														</thead>
														<tbody>

															<%
																
																String s = String.valueOf(roleIDByName);
																List<RoleFunction> list = sidebarDAO.getFunctionsByRoleID(s);

																for (RoleFunction e : list) {
																
																	Functions f = FunctionDAO.getFunctionsToRoles(e.getFunctionID());
																	
															%>
															<tr>
																<td hidden><%=f.getId()%></td>
																<td><%=f.getMainFunction()%></td>
																<td><%=f.getSubFunction()%></td>
																<td class="pl-5"><input type="checkbox"
																	id="functionID" name="functionID" value=<%=f.getId()%>>
																</td>
															<tr>

																<%
																	}
																%>
															
														</tbody>
													</table>

													<div class="row" style="float: right">

														<input type="reset" value="Clear"
															> <input
															class="btn btn-primary" type="submit"
															style=" margin-left: 10px;" value="Delete">


													</div>


												</form>

											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="card">
											<div class="card-body">

												<h4 class="m-0 font-weight-bold text-primary">Assigning
													new page Access</h4>
												<form method="POST" class="forms"
													action="AddFunctionServlet">


													<%
														List<Functions> list2 = FunctionDAO.getAllFunctions();
													%>


													<br>
													<!--  -->
													<div class="table-wrapper-scroll-y my-custom-scrollbar">
														<table class="table" style="width: 90%; margin-left: 5%">
															<thead class="thead-dark">
																<tr>
																	<th hidden scope="col">Function ID</th>
																	<th hidden scope="col">Main Functions</th>
																	<th scope="col">Sub Functions</th>
																	<th scope="col"></th>



																</tr>
															</thead>

															<tbody>

																<%
																	for (Functions e : list2) {
																%>
																<tr>
																	<td hidden><%=e.getId()%></td>
																	<td hidden><%=e.getMainFunction()%></td>
																	<td><%=e.getSubFunction()%></td>
																	<td class="pl-5"><input type="checkbox"
																		id="selected" name="selected" value=<%=e.getId()%>></td>




																</tr>

																<tr>

																	<%
																		}
																	%>
																
															</tbody>
														</table>
													</div>
													<br> <br> <br>
													<div class="row" style="float: right">

														<input type="reset" value="Clear"
															> <input
															class="btn btn-primary" type="submit"
															style=" margin-left: 10px;" value="Insert">


													</div>
													<br> <br> <br>
												</form>


											</div>
										</div>

									</div>
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

		window.history.forward();
		function noBack() {
			window.history.forward();
		}

		$(document).ready(
				function() {
					$('.btn-checkbox').change(
							function() {
								$.get('dataservlet', function(responseJson) {
									var $input = $('#id1');
									var $type = 'checkbox';
									$.each(responseJson, function(key, value) {
										var append = $(
												'<input type="'+$type+'">'
														+ value + '</input>')
												.attr('id', key).val(value);
										$($input).append('<br/>')
												.append(append);
									});
								});
							});
				});

		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>





</body>

</html>
