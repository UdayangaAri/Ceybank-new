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


<title>Reservation Room Details</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<%
	ResultSet rs1 = null;
	ResultSet rx = null;

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
	//System.out.println("Guest_Branch" + (String) session.getAttribute("branch"));
%>

<style>
a {
	text-decoration: none;
	display: inline-block;
	padding: 8px 16px;
}

a:hover {
	background-color: #ddd;
	color: black;
}

.previous {
	background-color: #f1f1f1;
	color: black;
}

.next {
	background-color: #4CAF50;
	color: white;
}

.round {
	border-radius: 50%;
}

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
}
</style>

</head>

<body>

	<div class="d-flex" id="sidebar-wrapper">

		<!-- Sidebar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div class=container-fluid>

			<div id="content">

				<jsp:include page="_navbar.jsp"></jsp:include>

				<div class="container">

					<div class="container mt-5 mb-5">

						<!-- body start -->

						<div class="container mt-3 a">

							<div class="card shadow mb-4">

								<div class="card-header py-3">

									<h4 class="m-0 font-weight-bold text-primary">Reservation</h4>
								</div>

								<div class="card-body" style="left: 30%">

									<%
										if (null != session.getAttribute("Reservation_Succeed")) {
									%>

									<div class="alert alert-success" role="alert">Reservation
										Succeed..</div>

									<%
										} else if (null != session.getAttribute("Reservation_Failed")) {
									%>

									<div class="alert alert-danger" role="alert">Reservation
										Failed..</div>

									<%
										}
									%>

									<!--------------------------------------------->
									<!--------------------------------------------->
									<!--------------------------------------------->
									<!--------------------------------------------->
									<!--------------------------------------------->

									<form action="" class="forms" method="post">

										<%
											
										%>

										<ul class="list-group list-group-flush">
											<li class="list-group-item">Room Details</li>

										</ul>
										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>
													<b><b>Check in Date</b></b>
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
													id="checkin" class="form-control"
													onchange="this.form.submit();" /> <span
													class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>

											</div>

											<div class="col-25" style="text-align: center">
												<p>
													<b><b>Checkout Date</b></b>
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
													id="checkout" class="form-control"
													onchange="this.form.submit();" /> <span
													class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>

											</div>

										</div>


										<%
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
												String totD = Integer.toString(durInt);
												
												session.setAttribute("str1", str1);
												session.setAttribute("totDays", totD);
												
											} catch (java.text.ParseException e) {
												e.printStackTrace();
											}
										}
										String totDays = (String) session.getAttribute("totDays");
										%>
										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>
													<b><b>No of Days</b></b>
												</p>

											</div>
											<div class="col-75">

												<input type="text" readonly name="totaldays"
													value="<%=totDays%>">
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
													
														String RecieveBlock1 = (String) session.getAttribute("Block_Name_Value");
														//System.out.println("RecieveBlock 1 ::: " + RecieveBlock1);

														String x = request.getParameter("block_in_r");
														session.setAttribute("Block_Name_Value", x);

														//System.out.println("x ::: " + x);

														block z = blockDAO.getBlocksByUserIdForRSM(x);
														block r = blockDAO.getBlocksByUserIdForRSM(RecieveBlock1);
														if (x != null) {
													%>

													<option value="" disabled selected><%=z.getBlock_name()%></option>

													<%
														//System.out.println("z.get ::: " + z.getBlock_name());

														} else if (RecieveBlock1 != null) {
													%>

													<option value="" disabled selected><%=r.getBlock_name()%></option>

													<%
														//System.out.println("r.get ::: " + r.getBlock_name());

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

										<%
										
										%>

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>
													<b><b>Select Room No</b></b>
												</p>

											</div>

											<div class="col-75">

												<select name="room_in_r" id="room_in_r"
													onchange="this.form.submit();">

													<%
														String rname = request.getParameter("room_in_r");

														session.setAttribute("Room_Name_Value", rname);
														
														
														String room1 = (String) session.getAttribute("Room_Name_Value");
														

														String roomGuest = (String) session.getAttribute("roomGuest");

														String Block_Name_Value = (String) session.getAttribute("Block_Name_Value");

														Room rm = RoomDao.getRoomById(room1);

														session.setAttribute("Block_Name_Value01", Block_Name_Value);

														//System.out.println("rname ::: " + rname);

														if (rname != null) {
													%>
													<option value="" disabled selected><%=rm.getRoomName()%></option>

													<%
														}

														else {
													%>
													<option value="" disabled selected>Select a Room</option>

													<%
														}
													%>

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

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>
													<b><b>Select Meal Plan</b></b>
												</p>

											</div>

											<div class="col-75">
												<select name="MealTypeNxt" required
													onchange="this.form.submit();">

													<%
											System.out.println("room1 ::: " + room1);

											System.out.println("checkout ::: " + checkout);
											System.out.println("checkin ::: " + checkin);

											System.out.println("RecieveBlock 01 ::: " + RecieveBlock1);
										%>

													<option value="bb">Bed and Breakfast</option>
													<option value="hb">Half board</option>
													<option value="fb">Full Board</option>
													<option value="ronly">Room Only</option>

												</select>
											</div>
										</div>

									</form>

									<form action="" class="forms" method="post">

										<!--
										<input type="hidden" name="checkinNxt" value="<%=checkin%>">
										<input type="hidden" name="checkoutNxt" value="<%=checkout%>">
										<input type="hidden" name="BlockNxt"
											value="<%=RecieveBlock1%>"> <input type="hidden"
											name="checkinNxt" value="<%=room1%>">
											-->

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>
													<b><b>Price :</b></b>
												</p>

											</div>
											<%
												//System.out.println("checkIn ::: " + checkin);
												//System.out.println("checkOut ::: " + checkout);

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

										<!--------------------------------------------->
										<!--------------------------------------------->
										<!--------------------------------------------->
										<!--------------------------------------------->

										<ul class="list-group list-group-flush">
											<li class="list-group-item">Guest Details</li>

										</ul>

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>Name</p>

											</div>

											<div class="col-75">

												<input type="text" name="nameres" value=""
													placeholder="Name" required>
											</div>

										</div>

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>NIC Number</p>

											</div>

											<div class="col-75">

												<input type="text" name="nicres" value="" required
													placeholder="NIC">
											</div>

										</div>

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>Mobile Number</p>

											</div>

											<div class="col-75">

												<input type="text" name="mobileres" value="" required
													placeholder="Mobile">
											</div>

										</div>

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>Email Address</p>

											</div>

											<div class="col-75">

												<input type="email" name="emailres" value="" required
													placeholder="Email">
											</div>

										</div>

										<div class="row">

											<div class="col-25" style="text-align: left">
												<p>Guest Type</p>

											</div>

											<div class="col-75">
												<div class="ml-3" style="float: left;">

													<label onclick="javascript:yesnoCheck();"> <input
														type="radio" name="options" id="noCheck" value="Public">Public
													</label> <label onclick="javascript:yesnoCheck();"> <input
														type="radio" name="options" id="yesCheck" checked
														value="BOC Staff">BOC Staff
													</label> <br>
												</div>

												<div class="col-40 ml-3" style="float: right;" id="ifYes"
													style="visibility: hidden">
													<input type="text" id="yes" name="pfnovalue" value=""
														placeholder="PF Number">
												</div>

											</div>

										</div>

										<br>
								</div>

								<div class="card-footer text-muted">

									<button type="submit" class="btn btn-outline-dark">Save</button>

								</div>

								</form>

							</div>

						</div>

						<!-- cards end -->

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

		var cinValue = document.getElementById("checkin").value;
		var coutValue = document.getElementById("checkout").value;

		function calculateAmount() {
			var tot_price = val * 100;

			var j = document.getElementById('Room_Price_tot');
			/*display the result*/
			var divobj = document.getElementById('totalout');
			divobj.value = j;
		}
	</script>



</body>

</html>
