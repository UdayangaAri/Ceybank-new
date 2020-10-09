<!DOCTYPE html>
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

<%
	ResultSet resultset = null;
	ResultSet rs = null;
%>

<%
	Connection con = DBConnection.getConnection();

	Statement ps = con.createStatement();
	rs = ps.executeQuery("select subFunction from functions");
	
	
	String empno = request.getParameter("empno");
		 
	Statement ps2 = con.createStatement();
	resultset = ps2.executeQuery("SELECT * FROM ceybank_rest.functions_has_role where role_id="+ empno+";");
	
	
	
	Integer roleIDByName = (Integer) session.getAttribute("roleIDByName");
	//System.out.println("roleIDByName : "+roleIDByName);
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




<title>Page Access</title>


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


<body onload="startTime()">


	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>
			<div id="content">
			<jsp:include page="_navbar.jsp"></jsp:include>

				


	<div class="c mt-3">
					<h4>

						<a href="PageAccessEdit.jsp" class="badge badge-light">Page Access Edit</a>
					</h4>
				</div>


				<div class="container">

					<!-- /#Type Body Here -->



				<div class="container mt-3 a" >

					<div class="card shadow mb-4">
					
						<div class="card-header py-3">

							<h4 class="m-0 font-weight-bold text-primary">
						
					<%
						String rolename = request.getParameter("rolename");
						out.print("Role : " + rolename);
						session.setAttribute("sessname", rolename);
				
					
						out.print("\n");
						out.print(", Change the pages to be access by " + rolename + " .");
					%>
			
			</h4>
						</div>
						<div class="card-body" style="left: 30%">








					<form method="POST" class="forms" action="selectFunctionServlet">


						<%
							List<Functions> list = FunctionDAO.getAllFunctions();
						%>


						<br>

						<table class="table" style="width: 90%; margin-left: 10%">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Function ID</th>
									<th scope="col">Main Functions</th>
									<th scope="col">Sub Functions</th>
									<th scope="col"></th>



								</tr>
							</thead>
							<tbody>

	<%
									for (Functions e : list) {
								%>
								<tr>
									<td><%=e.getId()%></td>
									<td><%=e.getMainFunction()%></td>
									<td><%=e.getSubFunction()%></td>
									<td class="pl-5"><input type="checkbox" id="selected" name="selected" value=<%=e.getId() %>></td>
										
										


								</tr>
								
								<tr>

									<%
										}
									%>
								


								
							</tbody>
						</table>
<br>
<br>
<br>
						<div class="row" style="float: right">

							<input type="reset" value="Clear" style="margin-right: 16px;">
							
							<input type="submit" style="float: left; margin-right: 250px;"
								value="Next">
								

						</div>
<br>
<br>
<br>
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
		    $(".alert").fadeTo(500, 0).slideUp(500, function(){
		        $(this).remove(); 
		    });
		}, 2000);
		
	</script>



</body>

</html>
