<!DOCTYPE html>
<%@page import="RoomRates.RoomRatesDAO"%>
<%@page import="RoomStatus.StatusRooms"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connections.DBConnection"%>

<%@page import="block_Register.blockBean"%>
<%@page import="block_Register.blockDAO"%>
<%@page import="RoomStatus.RoomStatusDAO"%>
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
	ResultSet r1 = null;
	ResultSet r2 = null;
	ResultSet r3 = null;
	ResultSet r4 = null;
%>


<head>

<!-- #9999ff -->

<link rel="stylesheet" type="text/css" href="css/All.css">
<link rel="stylesheet" type="text/css" href="css/sample.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="js/clock.js"></script>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Room Rates Management</title>

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">




<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">





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

<body>
<body onload="startTime()">
	<%
		try {
			Connection con = DBConnection.getConnection();
			//System.out.println("Printing connection object " + con);
			Statement statement = con.createStatement();
			Statement st = con.createStatement();
			r1 = statement.executeQuery("SELECT * FROM branches;");
			//rs = st.executeQuery("select * from branches");
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

	<div class="d-flex" id="sidebar-wrapper">

		<!-- Side-bar -->

		<jsp:include page="_sidebar.jsp"></jsp:include>
		<!-- /#side-bar-wrapper -->

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

									<h4 class="m-0 font-weight-bold text-primary">Add Room
										Rates</h4>

								</div>

								<div class="card-body" style="left: 30%">

									<!-- /#Type Body Here -->
									<%
										String branch = (String) session.getAttribute("branch");
										String branchstatus = RoomStatusDAO.getBranchIDbyLoging(branch);

										String t = (String) session.getAttribute("TranslateBranch");

										if (branchstatus.equalsIgnoreCase("Head Office")) {
									%>
									<form action="" method="post">


										<div class="row mt-1 mb-1">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Branch</b></b>
												</p>

											</div>

											<div class="col-65">

												<select name="branchidforRates" id="branchidforRates"
													required onchange="this.form.submit()" onchange="my()">

													<%
														String x = request.getParameter("branchidforRates");
															session.setAttribute("TranslateBranch", x);

															String RecieveBranch = (String) session.getAttribute("Branch_Name_Value");

															String takenameofbranchname = RoomRatesDAO.getBranchName(x);

															session.setAttribute("Branch_Name_Value", takenameofbranchname);

															//-----------------------------------------------------------------------------------------------------------------------
															if (x != null) {
													%>
													<option value="" disabled selected><%=takenameofbranchname%></option>
													<%
														} else if (RecieveBranch != null) {
													%>
													<option value="" disabled selected><%=RecieveBranch%></option>
													<%
														} else {
													%>
													<option value="" disabled selected>Select a Branch</option>
													<%
														}
													%>

													<%
														try {
																while (r1.next()) {
													%>

													<option value="<%=r1.getString(1)%>"><%=r1.getString(3)%></option>

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
											int idBranch = RoomRatesDAO.getBranchID(takenameofbranchname);

												session.setAttribute("Branch_Name_For_Form", idBranch);
										%>

										<div class="row mt-1 mb-1">


											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Block </b></b>
												</p>

											</div>

											<div class="col-65">
												<select name="blockidforRates" id="blockidforRates" required
													onchange="this.form.submit()">

													<%
														String y = request.getParameter("blockidforRates");
															session.setAttribute("TranslateBlock", y);

															String RecieveBlock = (String) session.getAttribute("Block_Name_Value");

															String takenameofblockName = RoomRatesDAO.getBlockName(y);

															session.setAttribute("Block_Name_Value", takenameofblockName);

															if (y != null) {
													%>
													<option value="" disabled selected><%=takenameofblockName%></option>

													<%
														} else if (RecieveBlock != null) {
													%>
													<option value="" disabled selected><%=RecieveBlock%></option>
													<%
														} else {
													%>
													<option value="" disabled selected>Select a Block</option>
													<%
														}
													%>

													<%
														String Q2 = "select * from block where block_location=?";
															Connection c2 = DBConnection.getConnection();
															PreparedStatement p2 = c2.prepareStatement(Q2);
															p2.setString(1, x);

															r2 = p2.executeQuery();
															while (r2.next()) {
													%>

													<option value="<%=r2.getString(1)%>"><%=r2.getString(3)%></option>

													<%
														}
													%>
												</select>

											</div>

										</div>

									</form>

									<%
										} else {
									%>
									
									<form action="" method="post">

										<div class="row mt-1 mb-1">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Branch</b></b>
												</p>

											</div>

											<div class="col-65">

												<select name="" id="">

													<option selected value="<%=branch%>"><%=branchstatus%></option>

												</select>
											</div>

										</div>

										<div class="row mt-1 mb-1">


											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Block </b></b>
												</p>

											</div>

											<div class="col-65">
												<select name="blockidforRates" id="blockidforRates" required
													onchange="this.form.submit()">

													<%
														String y = request.getParameter("blockidforRates");
														session.setAttribute("TranslateBlock", y);

														String RecieveBlock = (String) session.getAttribute("Block_Name_Value");

														String takenameofblockName = RoomRatesDAO.getBlockName(y);

														if (y != null) {
													%>
													<option value="" disabled selected><%=takenameofblockName%></option>

													<%
														} else {
													%>
													<option value="" disabled selected>Select a block</option>

													<%
														}

														String Q2 = "select * from block where block_location=?";
														Connection c2 = DBConnection.getConnection();
														PreparedStatement p2 = c2.prepareStatement(Q2);
														p2.setString(1, branch);

														r2 = p2.executeQuery();
														while (r2.next()) {
													%>

													<option value="<%=r2.getString(1)%>"><%=r2.getString(3)%></option>

													<%
														}
													%>
												</select>

											</div>

										</div>

									</form>
									
									<%
										}
									%>

									<form action="RoomRatesAddServlet" method="post">

										<%
											String SessionTranslateBlock = (String) session.getAttribute("TranslateBlock");
										%>
										<p id="aa"></p>
										<input type="hidden" id="SessionBranchID"
											name="SessionBranchID" value="<%=branch%>"> <input
											type="hidden" id="SessionBlockID" name="SessionBlockID"
											value="<%=SessionTranslateBlock%>">

										<div class="row mt-1 mb-1">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Room Type </b></b>
												</p>

											</div>

											<div class="col-65">

												<select name="roomtypeforRates" id="roomtypeforRates"
													required>

													<%
														String z = request.getParameter("roomtypeforRates");

														String RecieveRoomType = (String) session.getAttribute("Room_Name_Value");

														String takenameofRoomType = RoomRatesDAO.getRoomTypeName(z);

														session.setAttribute("Room_Name_Value", takenameofRoomType);
													%>
													<option value="" disabled selected>Select a Room
														type</option>

													<%
													String y = (String) session.getAttribute("TranslateBlock");
													
														String Q3 = "SELECT distinct roomType FROM ceybank_rest.rooms where blockID=?";
														Connection c3 = DBConnection.getConnection();
														PreparedStatement p3 = c3.prepareStatement(Q3);
														p3.setString(1, y);

														r3 = p3.executeQuery();
														//
														while (r3.next()) {
															String Q4 = "SELECT * FROM roomtypes where roomTypeId=?";

															Connection c4 = DBConnection.getConnection();
															PreparedStatement p4 = c4.prepareStatement(Q4);
															p4.setString(1, r3.getString(1));
															String bb = r3.getString(1);

															r4 = p4.executeQuery();
															while (r4.next()) {
													%>

													<option value="<%=r4.getString(1)%>"><%=r4.getString(2)%></option>

													<%
														}
														}
													%>
												</select>

											</div>

										</div>
										<%
											int idRoomType = RoomRatesDAO.getRoomTypeID(takenameofRoomType);

											session.setAttribute("RoomType_Name_For_Form", idRoomType);
										%>

										<div class="row mt-1 mb-1">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Meal Plan </b></b>
												</p>

											</div>

											<div class="col-65">

												<select name="mealtypeforRates" id="mealtypeforRates"
													required>

													<option value="" disabled selected>Select meal
														type</option>

													<option value="Bed & Breakfast">Bed & Breakfast</option>
													<option value="Half board">Half board</option>
													<option value="Full Board">Full Board</option>
													<option value="Room only">Room only</option>

												</select>

											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Normal Rate </b></b>
												</p>

											</div>

											<div class="col-25">

												<input type="number" style="text-align: center"
													class="form-control" name="Rate" id="Rate" required>

											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>BOC Holiday Rate </b></b>
												</p>

											</div>

											<div class="col-25">

												<input type="number" style="text-align: center"
													class="form-control" name="HoliRate" id="HoliRate" required>

											</div>

										</div>

										<div class="row">

											<div class="col-25">

												<p style="text-align: left;">
													<b><b>Discount </b></b>
												</p>

											</div>

											<div class="row mt-1 mb-1">

												<label onclick="javascript:yesnoCheck();"
													style="margin-left: 10px;"> <input type="radio"
													name="options" id="noCheck" value="Percentage">Percentage
												</label> <label onclick="javascript:yesnoCheck();"
													style="margin-left: 47px;"> <input type="radio"
													name="options" id="yesCheck" checked value="Amount">Amount
												</label>

											</div>

											<div class="row mt-3" style="float: right;">

												<div class="col-30 ml-5" style="float: right;"
													id="percentage" style="visibility: hidden">

													<input type="text" name="Percentagee" maxlength="2"
														placeholder="Percentage"
														style="width: 125px; margin-left: 134px;">
												</div>

												<div class="col-30 ml-2" style="float: right;" id="amount"
													style="visibility: hidden">

													<input type="text" name="Amountt" minlength="3"
														placeholder="Amount"
														style="width: 125px; margin-left: 18px;">
												</div>

											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="row ">

												<input type="submit"
													style="width: 100px; margin-left: 450px; margin-top: 25px;"
													value="Add">
											</div>

										</div>

									</form>

								</div>

							</div>

						</div>

					</div>

					<!-- Content Row -->

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
		function my() {
			document.getElementById("aa").innerHTML = name;

		}

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

		//javascript for 

		function yesnoCheck() {
			if (document.getElementById('yesCheck').checked) {
				document.getElementById('amount').style.visibility = 'visible';
			} else
				document.getElementById('amount').style.visibility = 'hidden';

			if (document.getElementById('noCheck').checked) {
				document.getElementById('percentage').style.visibility = 'visible';
			} else
				document.getElementById('percentage').style.visibility = 'hidden';
		}

		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>

</body>

</html>