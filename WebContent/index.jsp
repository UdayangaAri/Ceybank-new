
<!DOCTYPE html>
<%@page import="Branches.BranchDao"%>
<%@page import="java.util.List"%>
<%@page import="Branches.Branch"%>
<html lang="en">

<%
	String uid = (String) session.getAttribute("userId");
%>

<head>


<!-- #9999ff -->
 

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/login.css">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Login Page</title>


 <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">




</head>

<body onload="javascript:back_block() , noback()">


	<div class="container">

		<div class="my-5 py-5">



			<div class="card my-5 py-5"
				style="max-width: 800px; align: center; left: 15%; border-top: none; border-left: none; border-right: none;">



				<div class="card-header border-bottom"
					style="height: 60px; background-color: #464646;">
					<p>
						<font color="#fffff" style="">Ceybank Holiday Homes </font>
					</p>

				</div>




				<%
					if (null != request.getAttribute("errorMessage")) {
				%>

				<div class="alert alert-danger" role="alert">Invalid
					Username/Password</div>

				<%
					}
				%>


				<div class="row no-gutters">

					<div class="col-md-4">

						<br> <br> <img src="images/ceybank2.png"
							class="image-cropper" style="text-align: center">
					</div>
					<div class="col-md-7">


						<div class="card-body">
							<h5 style="text-align: center">Login</h5>
							<br>
							<form action="Login" method="post">
								<div class="form-group">

									<input type="text" style="text-align: center"
										class="form-control" name="Username" placeholder="Username"
										required>

								</div>

								<div class="form-group">

									<input type="password" style="text-align: center;"
										class="form-control" name="pass" placeholder="Password"
										required>

								</div>
								<br>
								<div>
									<input type="submit" value="Login"
										style="align: center; margin: 0 auto; display: block;">
								</div>
							</form>


						</div>
					</div>

				</div>


			</div>
		</div>
	</div>


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
	</script>

</body>


</html>