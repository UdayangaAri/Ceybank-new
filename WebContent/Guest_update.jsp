<!DOCTYPE html>
<%@page import="Guest_details.GuestDAO"%>
<%@page import="Guest_details.Guest"%>
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
	ResultSet resultset = null;
	ResultSet rs = null;
%>

<%
	String sid_guest = (String) request.getAttribute("sid_guest");

	String err = (String) request.getAttribute("wrongs");

	String succ = (String) request.getAttribute("successfuled");

	String thesid = (String) request.getAttribute("thesid");

	Guest g = GuestDAO.getGuestById(sid_guest);

	String s = g.getSt_nonst();

	String st_nonst = (String) request.getAttribute("st_nonst");

	String bee = (String) request.getAttribute("bee");

	System.out.println("bee :" + bee);

	session.setAttribute("thesid", thesid);
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

<title>Guest_update</title>

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


				<div class="container">

					<!-- /#Type Body Here -->

					<br>
					<%
						if (err != null) {
					%>
					<br>
					<div class='alert alert-danger' role='alert'>Guest is not on
						the list..</div>

					<%
						} else if (bee != null) {
					%>

					<div class='alert alert-success' role='alert'>Guest Updated
						successfully..</div>

					<%
						}
					%>

<div class="container mt-3 a" >

					<div class="card shadow mb-4">
					
						<div class="card-header py-3">

							<h4 class="m-0 font-weight-bold text-primary">Update Guest</h4>
							<form action="Guest_ViewServlet" method="post">



						<h3></h3>



							<div class="row mt-4 mb-4">

							

							<div class="col-50">
								<%
									if (g.getCnumber() == null) {
								%>

								<input type="search" name="search" required class="search"
									value="" placeholder="Search NIC/BOC PF Number/ Mobile Number"
									style="margin-right: 16px;">

								<%
									} else {
								%>
								<input type="search" name="search" required class="search"
									value="<%=sid_guest%>"
									placeholder="Search NIC/BOC PF Number/ Mobile No"
									style="margin-right: 16px;">

								<%
									}
								%>

							</div>
	
							<div class="col-25">

								<button type="submit" name="search"
									style="float: left; margin-left: 16px; text-align: center;"
									class="btn btn-primary">Search</button>

							
</div>

						</div>
					</form>
						</div>
						<div class="card-body" style="left: 30%">

					

					<form action="Update_Guest" method="post">

						<div class="row mt-1 mb-1">

							<input type="text" style="visibility: hidden"
								value="<%=g.getCnumber()%>" name="cnumb" placeholder="">

						</div>


						<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Name</b></b>
								</p>

							</div>

							<div class="col-65">

								<div class="input-group mb-3">
									<%
										if (sid_guest == null) {
									%>

									<div class="input-group-prepend">
										<select class="custom-select" id="posi" name="posi">

											<option value="Mr">Mr</option>
											<option value="Mrs">Mrs</option>
											<option value="Ms">Ms</option>
											<option value="Dr">Dr</option>
										</select>
									</div>
									<%
										} else {
									%>

									<div class="input-group-prepend">
										<select class="custom-select" id="posi" name="posi">

											<option value="<%=g.getPosition()%>" selected><%=g.getPosition()%></option>
											<option value="Mr">Mr</option>
											<option value="Mrs">Mrs</option>
											<option value="Ms">Ms</option>
											<option value="Dr">Dr</option>
										</select>
									</div>

									<%
										}
									%>

									<input type="text" name="name" required class="form-control"
										aria-label="Text input with dropdown button"
										value="<%=g.getName()%>">
								</div>


							</div>
						</div>


						<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Address</b></b>
								</p>

							</div>


							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="text" name="address" value="" required
									placeholder="Address">
								<%
									} else {
								%>

								<input type="text" name="address" value="<%=g.getAddress()%>"
									required placeholder="Address">
								<%
									}
								%>


							</div>
						</div>


						<div class="row mt-1 mb-1">


							<div class="col-25">
								<p>
									<b><b>City</b></b>
								</p>

							</div>
							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="text" name="city" value="" required
									placeholder="City">
								<%
									} else {
								%>

								<input type="text" name="city" value="<%=g.getCity()%>" required
									placeholder="City">
								<%
									}
								%>

							</div>

						</div>

							<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Residence Country</b></b>
								</p>

							</div>


							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="text" name="r_country" required value=""
									placeholder="Residence Country">
								<%
									} else {
								%>

								<input type="text" name="r_country" required
									value="<%=g.getCountry()%>" placeholder="Residence Country">
								<%
									}
								%>

							</div>

						</div>

							<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Citizenship</b></b>
								</p>

							</div>


							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="text" name="citizenship" required value=""
									placeholder="Citizenship">
								<%
									} else {
								%>

								<input type="text" name="citizenship" required
									value="<%=g.getCitizenship()%>" placeholder="Citizenship">
								<%
									}
								%>


							</div>

						</div>

						<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>NIC Number</b></b>
								</p>

							</div>


							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="text" name="nic" value="" required
									placeholder="NIC Number">
								<%
									} else {
								%>

								<input type="text" name="nic" value="<%=g.getNic()%>" required
									placeholder="NIC Number" pattern=".{10,12}">
								<%
									}
								%>


							</div>

						</div>

					<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Mobile</b></b>
								</p>

							</div>


							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="text" name="mobile" value="" required
									placeholder="Mobile">
								<%
									} else {
								%>

								<input type="text" name="mobile" pattern=".{8,10}" value="<%=g.getMobile()%>"
									required placeholder="Mobile">
								<%
									}
								%>


							</div>

						</div>

						<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Date of Birth</b></b>
								</p>

							</div>

							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="date" name="dobirth" required
									placeholder="Date of Birth">
								<%
									} else {
								%>

								<input type="date" name="dobirth" value="<%=g.getDob()%>"
									required placeholder="Date of Birth">
								<%
									}
								%>


							</div>

						</div>

						<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Email</b></b>
								</p>

							</div>


							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="email" name="email" value="" required
									placeholder="Email">
								<%
									} else {
								%>

								<input type="email" name="email" value="<%=g.getEmail()%>"
									required placeholder="Email">
								<%
									}
								%>


							</div>
						</div>

						<div class="row mt-1 mb-1">

							<div class="col-25">
								<p>
									<b><b>Profession</b></b>
								</p>

							</div>

							<div class="col-65">

								<%
									if (g.getPfno() == null) {
								%>

								<input type="text" name="profession" required value=""
									placeholder="Profession">
								<%
									} else {
								%>

								<input type="text" name="profession" required
									value="<%=g.getProf()%>" placeholder="Profession">
								<%
									}
								%>

							</div>

						</div>



						<%
							if (st_nonst == null) {
						%>


							<div class="row mt-1 mb-1">


							
							<div class="col-25">
								<p>
									<b><b>Guest Type</b></b>
								</p>

							</div>

							<div class="col-65">
								<div style="float: left;">

									<label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="noChecks" value="Public">Public
									</label> <label onclick="javascript:yesnoCheck();"> <input
										type="radio" name="options" id="yesChecks" checked
										value="BOC Staff">BOC Staff
									</label> <br>
								</div>

								<div class="col-40" style="float: right;" id="ifYess"
									style="visibility: hidden">
									<input type="text" id="yes" name="pfnovalue" value="" placeholder="PF Number" 
									data-toggle="popover" data-trigger="hover" data-placement="top"
										data-content="If You Select GUEST as type, PF Number you enter will not be saved..">
								</div>
							</div>
						</div>


						<%
							} else {
						%>

						<div class="row mt-1 mb-1">

							
							<div class="col-25">
								<p>
									<b><b>Guest Type</b></b>
								</p>

							</div>


							<div class="col-65">

								<%
									if (st_nonst.equalsIgnoreCase("Public")) {
								%>

								<div style="float: left;">

									<label onclick="yesnoCheck();">
									
								 <input type="radio"
										name="options" value="Public" checked id="">Public
									</label> 
									
									<label onclick="yesnoCheck();">
									 <input type="radio"
										name="options" value="BOC Staff" id="">BOC Staff
									</label> <br>
								</div>

								<div class="col-40" style="float: right;" id=""
									style="visibility: hidden">
									<input type="text" id="yess" name="pfnovalue" value="" data-toggle="popover" data-trigger="hover"
										placeholder="No PF Number" data-placement="top" 
										data-content="If You Select GUEST as type, PF Number you enter will not be saved..">
								</div>

								<%
									} else if (st_nonst.equalsIgnoreCase("BOC Staff")) {
								%>

								<div style="float: left;">

									<label onclick="yesnoCheck();"> <input type="radio"
										name="options" value="Public" id="">Public
									</label> <label onclick="yesnoCheck();"> <input type="radio"
										name="options" checked value="BOC Staff" id="">BOC
										Staff
									</label> <br>
								</div>

								<div class="col-40" style="float: right;" id=""
									style="visibility: hidden">
									<input type="text" id="yess" name="pfnovalue" data-toggle="popover" data-trigger="hover"
										value="<%=g.getPfno()%>" data-placement="top"
										data-content="If You Select GUEST as type, PF Number you enter will not be saved..">
								</div>

								<%
									}
								%>



							</div>
						</div>

						<%
							}
						%>

						<div class="row mt-1 mb-1">

								
	

						</div>

							<div class="row mt-4 mb-4">

							<div class="col-25"></div>

										<div class="row center">

								<input type="submit" class="btn btn-secondary"
									value="Update Guest" style="margin-left:-90px">
							</div>
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
	
	$(function () {
		  $('[data-toggle="popover"]').popover()
		});
	
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
	<script>
		var today = new Date().toISOString().split('T')[0];

		document.getElementsByName("dobirth")[0].setAttribute('max', today);

		function yesnoCheck() {
			if (document.getElementById('yesChecks').checked) {
				document.getElementById('ifYess').style.visibility = 'visible';
			} else
				document.getElementById('ifYess').style.visibility = 'hidden';

		}
	</script>



</body>

</html>
