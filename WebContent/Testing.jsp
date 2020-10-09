<!DOCTYPE html>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="RoomManagement.RoomDao"%>
<%@page import="RoomManagement.Room"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="block_Register.block"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connections.DBConnection"%>
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

<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<%
	ResultSet rs1 = null;
	ResultSet rx = null;
%>


<%
	String Employees_Branch = (String) session.getAttribute("branch");

	String Guest_Branch = (String) session.getAttribute("branch");

	String Username = (String) session.getAttribute("Username");

	String Staff = "Staff";
	String Guest = "Public";

	//System.out.println("Guest_Branch" + (String) session.getAttribute("branch"));
%>


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

					<div>

						<br> <br>

						<div class="card border-dark text-center">

							<div class="card-body">

								<form class="forms" action="" method="post"
									style="align: center">

									<br>

									<%
										try {

											Connection con = DBConnection.getConnection();
											System.out.println("Printing connection object " + con);

											Statement statement = con.createStatement();
											Statement st = con.createStatement();

											rx = statement.executeQuery("select * from block");

										} catch (Exception e) {
											e.printStackTrace();
										}
									%>

									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Select Block</b></b>
											</p>

										</div>

										<div class="col-75">
											<select name="block_in_r" id="block_in_r"
												onchange="getBlockValue()">

												<option value="" disabled selected>Select a Block</option>

												<%
													try {
														String Query = "select * from block";
														Connection con = DBConnection.getConnection();
														//System.out.println("Printing connection object " + con);

														PreparedStatement psmtX = con.prepareStatement(Query);

														rs1 = psmtX.executeQuery();
														while (rs1.next()) {
												%>
												<option value=<%=rs1.getInt("blockID")%>><%=rs1.getString("block_name")%></option>
												<%
													}

													} catch (Exception e) {
														e.printStackTrace();
													}
												%>

											</select>
										</div>
									</div>

									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Select Room No</b></b>
											</p>

										</div>

										<div class="col-75">
											<select name="room_in_r" id="room_in_r">

												<option value="" disabled selected>Select a Room</option>

												<%
													try {
														String Query = "select * from rooms";
														Connection con = DBConnection.getConnection();
														//System.out.println("Printing connection object " + con);

														PreparedStatement psmt = con.prepareStatement(Query);
														rs = psmt.executeQuery();
														while (rs.next()) {
												%>
												<option value=<%=rs.getInt("id")%>><%=rs.getString("roomName")%></option>
												<%
													}

													} catch (Exception e) {
														e.printStackTrace();
													}
												%>
											</select>
										</div>
									</div>

									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>

												<b><b>Meal Plan</b></b>
											</p>

										</div>

										<div class="col-75" style="text-align: left">

											<label class="radio-inline"> <input type="radio"
												name="rtype" value="bb">B/B
											</label> <label class="radio-inline"> <input type="radio"
												name="rtype" value="hb">H/B
											</label> <label class="radio-inline"> <input type="radio"
												name="rtype" value="fb">F/B
											</label> <label class="radio-inline"> <input type="radio"
												name="rtype" value="ronly">Room Only
											</label>


										</div>
									</div>

									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Check in Date :</b></b>
											</p>

										</div>

										<div class="col-25">


											<input type='date' value="" name="checkin"
												class="form-control" /> <span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>

										</div>

										<div class="col-25" style="text-align: center">
											<p>
												<b><b>Checkout Date :</b></b>
											</p>

										</div>

										<div class="col-25">


											<input type='date' value="" name="checkout"
												class="form-control" /> <span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>

										</div>

									</div>

									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Price :</b></b>
											</p>

										</div>

										<div class="col-25">
											<input type="text" name="Room_Price_tot" readonly
												style="float: right;" id="Room_Price_tot" value="Rs."
												placeholder="Price">
										</div>

									</div>
								</form>

							</div>
							<div class="card-footer text-muted">

								<form class="forms" action="ReservationSaveServlet"
									method="post" style="align: center">

									<div class="col-75"></div>

									<button type="submit" name="Submit_res"
										style="float: right; text-align: center;"
										class="btn btn-primary">Submit</button>
								</form>

							</div>

						</div>

					</div>

				</div>

			</div>

		</div>

	</div>


	<!-- /#page-content-wrapper -->

	<footer class="footer"
		style="background-color: #464646; z-index: 150; position: relative; margin-left: -15px; height: 40px; width: 103%;">
		<div class="container-fluid">

			<ul class="navbar-nav ml-auto mt-2 mt-lg-0">

				<li class="nav-link" style="text-color: #fff; text-align: center"><font
					color="#fffff">Developed By BOC IT Unit</font></li>
			</ul>

		</div>
	</footer>




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

		var today = new Date().toISOString().split('T')[0];

		document.getElementsByName("checkin")[0].setAttribute('min', today);
		document.getElementsByName("checkout")[0].setAttribute('min', today);
		document.getElementsByName("dob")[0].setAttribute('max', today);

		function yesnoCheck() {

			if (document.getElementById('yesCheck').checked) {

				document.getElementById('ifYes').style.visibility = 'visible';

			} else

				document.getElementById('ifYes').style.visibility = 'hidden';
		}

		function my1() {

			$(document).ready(function() {

				$("#update").modal('show');
				$tr = $this.closest('tr');
				tr = $(this).closet('tr');
			});
		}

		window.setTimeout(function() {

			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});

		}, 2000);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////

		function getBlockValue(n) {

			var x = document.getElementById("block_in_r");

			var strUser = x.options[x.selectedIndex].value;

			window.alert(strUser);
			
				<%try {
						String Query = "select * from rooms";
						Connection con = DBConnection.getConnection();
						
						// System.out.println("Printing connection object " + con);
		
						PreparedStatement psmt = con.prepareStatement(Query);
		
						rs = psmt.executeQuery();
						
						while (rs.next()) {
		
							int j = rs.getInt("blockID");
							String s = Integer.toString(j);
							%>
							
				if ( <%=s%> == strUser) {
					
			<% 
			System.out.println("id ::: " + rs.getString("roomName"));%>
				}
			<%
			}
		
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
		}
	</script>



</body>

</html>
