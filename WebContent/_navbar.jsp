
<%
	String name = (String) session.getAttribute("Username");

	String uid = (String) session.getAttribute("userId");

	String empno = (String) session.getAttribute("empno");
	String branch = (String) session.getAttribute("branch");

	String fname = (String) session.getAttribute("fname");

	String gender = (String) session.getAttribute("gender");
%>

<nav class="navbar navbar-expand-lg navbar-light"
	style="background: #373737; margin-left: -15px; margin-right: -15px; width: 102%;">
	<div class="container-fluid" style="margin-left: 0px;">


		<img src="images/menu.png" id="sidebarCollapse" alt="" border=3
			height=22 width=29
			style="margin-left: -20px; float: left; margin-right: 0.5em">


		<div style="margin-left: 25px;">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<%
					java.text.DateFormat ddf = new java.text.SimpleDateFormat("dd/MM/yyyy");
				%>

				<span class="mr-2 d-none d-lg-inline text-gray-100 small"><%=ddf.format(new java.util.Date())%></span>

				<ul class="navbar-nav ml-1 mt-2 mt-lg-0">

					<li class="nav-item dropdown no-arrow">
						<%
							if (gender.equalsIgnoreCase("Male")) {
						%> <a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-100 small"><%=fname%></span>
							<img class="img-profile rounded-circle"
							src="images/userimage.png">
					</a> <%
 	} else if (gender.equalsIgnoreCase("Female")) {
 %> <a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-100 small"><%=fname%></span>
							<img class="img-profile rounded-circle"
							src="images/userfimage.png">
					</a> <%
 	}
 %> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="AdminProfile.jsp"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
							</a> <a class="dropdown-item" href="home.jsp"> <i
								class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
							</a> <a class="dropdown-item" href="Request_Reset_Password.jsp">
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
								Request Reset Password
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="LogoutServlet"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Logout
							</a>
						</div>
					</li>

				</ul>
			</div>
		</div>

	</div>

</nav>

