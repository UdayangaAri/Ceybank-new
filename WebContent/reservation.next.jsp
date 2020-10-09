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

<title>Reservation Room Details</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<%
	ResultSet rs1 = null;
	ResultSet rx = null;

	/////////////////////////////////////////////////////////////////

	/////////////////////////////////////////////////////////////////

	String Employees_Branch = (String) session.getAttribute("branch");

	String Guest_Branch = (String) session.getAttribute("branch");

	String Username = (String) session.getAttribute("Username");

	String Pos = (String) request.getAttribute("Pos");
	String cname = (String) request.getAttribute("name");
	String cnic = (String) request.getAttribute("nic");
	String cmobile = (String) request.getAttribute("mobile");
	String cemail = (String) request.getAttribute("email");
	String cst_nonst = (String) request.getAttribute("st_nonst");
	String cpfno = (String) request.getAttribute("pfno");
	String err = (String) request.getAttribute("wrong");
	String cno = (String) request.getAttribute("cno");
	String xString = (String) request.getAttribute("xString");

	String Staff = "Staff";
	String Guest = "Public";
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

								<br>

								<form>
								
									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Check in Date :</b></b>
											</p>

										</div>

										<div class="col-25">

											<%
												String checkin_d = request.getParameter("checkin");
												session.setAttribute("checkin", checkin_d);

												String checkin = (String) session.getAttribute("checkin");

												//System.out.println("checkin ::: " + checkin);
											%>
											<input type='date' value="<%=checkin%>" name="checkin"
												class="form-control" onchange="this.form.submit();" /> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>

										</div>

										<div class="col-25" style="text-align: center">
											<p>
												<b><b>Checkout Date :</b></b>
											</p>

										</div>

										<div class="col-25">

											<%
												String checkout_d = request.getParameter("checkout");
												session.setAttribute("checkout", checkout_d);

												String checkout = (String) session.getAttribute("checkout");

												//System.out.println("checkout ::: " + checkout);
											%>

											<input type='date' value="<%=checkout%>" name="checkout"
												class="form-control" onchange="this.form.submit();" /> <span
												class="input-group-addon"> <span
												class="glyphicon glyphicon-calendar"></span>
											</span>

										</div>

									</div>




									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Select Block</b></b>
											</p>

										</div>

										<div class="col-75">
											<select name="block_in_r" id="block_in_r"
												onchange="this.form.submit();">
												<%
													String x = request.getParameter("block_in_r");
													session.setAttribute("Block_Name_Value", x);

													String RecieveBlock = (String) session.getAttribute("Block_Name_Value");

													block z = blockDAO.getBlocksByUserIdForRSM(x);

													block r = blockDAO.getBlocksByUserIdForRSM(RecieveBlock);

													if (x != null) {

														System.out.println("RecieveBlock ::: " + RecieveBlock);
												%>

												<option value="" disabled selected><%=z.getBlock_name()%></option>

												<%
													} else if (RecieveBlock != null) {
												%>

												<option value="" disabled selected><%=r.getBlock_name()%></option>

												<%
													} else {
												%>
												<option value="" disabled selected>Select a Block</option>

												<%
													}
												%>

												<%
													try {
														String Query = "select * from block where block_location=?";
														Connection con = DBConnection.getConnection();

														PreparedStatement psmtX = con.prepareStatement(Query);
														psmtX.setString(1, Employees_Branch);

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

								</form>

								<form action="" class="forms"
									method="post">


									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Select Room No</b></b>
											</p>

										</div>

										<div class="col-75">
											<select name="room_in_r" id="room_in_r">

												<%
													String roomGuest = (String) session.getAttribute("roomGuest");

													String Block_Name_Value = (String) session.getAttribute("Block_Name_Value");
												%>

												<option value="" disabled selected>Select a Room</option>

												<%
													try {

														String Query = "select * from rooms where blockID=?";
														Connection con = DBConnection.getConnection();

														PreparedStatement psmt = con.prepareStatement(Query);
														psmt.setString(1, Block_Name_Value);

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

									<input type="hidden" name="checkinNxt" value="<%=checkin%>">
									<input type="hidden" name="checkoutNxt" value="<%=checkout%>">
									<input type="hidden" name="BlockNxt" value="<%=RecieveBlock%>">

									<%
										System.out.println("checkin ::: " + checkin);
										System.out.println("checkout ::: " + checkout);
									%>

									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Select Meal Plan</b></b>
											</p>

										</div>

										<div class="col-75">
											<select name="MealTypeNxt" required>

												<option value="bb">Bead and Breakfast</option>
												<option value="hb">Half board</option>
												<option value="fb">Full Board</option>
												<option value="ronly">Room Only</option>

											</select>
										</div>
									</div>


									<div class="row">

										<div class="col-25" style="text-align: left">
											<p>
												<b><b>Price :</b></b>
											</p>

										</div>
										<%
											//System.out.println("checkIn ::: " + checkin);
											//System.out.println("checkOut ::: " + checkout);

											SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

											if (checkin != null && checkout != null) {

												try {
													String price = "1500";
													Date date1 = myFormat.parse(checkin);
													Date date2 = myFormat.parse(checkout);
													long diff = date2.getTime() - date1.getTime();
													//System.out.println("Days: " + TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));

													long dur = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
													int durInt = (int) dur;
													int Tprice = 1500;

													//System.out.println("durInt ::: " + durInt);

													int tot = durInt * Tprice;
													//System.out.println("tot ::: " + tot);

													String str1 = Integer.toString(tot);
													session.setAttribute("str1", str1);

												} catch (java.text.ParseException e) {
													e.printStackTrace();
												}
											}
											String strx = (String) session.getAttribute("str1");
											//System.out.println("str1 ::: " + strx);

											if (strx != null) {
										%>

										<div class="col-25">
											<input type="text" name="Room_Price_tot" readonly
												style="float: right;" id="Room_Price_tot"
												value="Rs.<%=strx%>" placeholder="Price">
										</div>

										<%
											} else {
										%>

										<div class="col-25">
											<input type="text" name="Room_Price_tot" readonly
												style="float: right;" id="Room_Price_tot" value="Rs.0"
												placeholder="Price">
										</div>

										<%
											}
										%>

									</div>
							</div>
							<div class="card-footer text-muted">

								<button type="submit" class="btn btn-outline-dark">Save
									Details</button>

							</div>
						</div>

						</form>
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
	</script>



</body>

</html>
