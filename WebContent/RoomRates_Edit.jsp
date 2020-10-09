<!DOCTYPE html>
<%@page import="RoomRates.RoomRates"%>
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

<title>Room Rates Management - Edit</title>

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

					<%
						String sid = request.getParameter("id");

						//System.out.println("******************** sid : " + sid);

						RoomRates ew = RoomRatesDAO.getRoomRates(sid);
					%>

					<div class="container mt-5 mb-5">

						<!-- body start -->

						<div class="container mt-3 a">

							<div class="card shadow mb-4">

								<div class="card-header py-3">

									<h4 class="m-0 font-weight-bold text-primary">Room Rates
										Management</h4>
									<br> <a href='RoomRates_View.jsp'>View Room Rates</a> <br>
								</div>

								<%
									String branch_name = RoomRatesDAO.getBranchName(ew.getBranch());
									String block_name = RoomRatesDAO.getBlockName(ew.getBlock());
									String room_type = RoomRatesDAO.getRoomTypeName(ew.getRoomtype());

									String rate_name = ew.getBrate();
									String holi_rate = ew.getHrate();

									String discount_amount = ew.getDiscout();
									String discount_name = ew.getDicount_type();
								%>

								<div class="card-body" style="left: 30%">

									<!-- /#Type Body Here -->

									<form action="RoomRates_Edidt_Servlet" method="post">

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p style="text-align: left;">
													<b><b>Branch</b></b>
												</p>

											</div>

											<div class="col-65">
												<input type="text" style="text-align: left"
													class="form-control" name="EditBranch" id="EditBranch"
													disabled value="<%=branch_name%>">
												<%
													session.setAttribute("EditBranch", ew.getBranch());
												%>
											</div>

										</div>

										<div class="row mt-1 mb-1">


											<div class="col-25">
												<p style="text-align: left;">
													<b><b>Block </b></b>
												</p>

											</div>

											<div class="col-65">
												<input type="text" style="text-align: left"
													class="form-control" name="EditBlock" id="EditBlock"
													disabled value="<%=block_name%>">
												<%
													session.setAttribute("EditBlock", ew.getBlock());
												%>
											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p style="text-align: left;">
													<b><b>Room Type </b></b>
												</p>

											</div>

											<div class="col-65">
												<input type="text" style="text-align: left"
													class="form-control" name="Editroom_type"
													id="Editroom_type" disabled value="<%=room_type%>">
												<%
													session.setAttribute("Editroom_type", ew.getRoomtype());
												%>
											</div>

										</div>

										<div class="row mt-1 mb-1">

											<div class="col-25">
												<p style="text-align: left;">
													<b><b>Meal plan </b></b>
												</p>

											</div>

											<div class="col-65">
												<input type="text" style="text-align: left"
													class="form-control" name="EditMeal" id="EditMeal" disabled
													value="<%=ew.getMealplan()%>">
												<%
													session.setAttribute("EditMeal", ew.getMealplan());
												%>

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

											<div class="row mt-1 mb-1" style="float: right">

												<label onclick="javascript:yesnoCheck();"
													style="margin-left: 10px;"> <input type="radio"
													name="options" id="noCheck" value="Percentage">Percentage
												</label> <label onclick="javascript:yesnoCheck();"
													style="margin-left: 47px;"> <input type="radio"
													name="options" id="yesCheck" checked value="Amount">Amount
												</label>
											</div>

											<div class="row mt-3" style="float: right">
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

										<input type="hidden" name="id_value" value="<%=sid%>">

										<div class="row mt-1 mb-1 "
											style="float: right; margin-right: 75px;">

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