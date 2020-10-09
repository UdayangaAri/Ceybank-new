
<% String name=(String)session.getAttribute("email"); %>
<% String fname=(String)session.getAttribute("fname"); %>




<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
	<button class="btn btn-primary" id="menu-toggle">Menu</button>



	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">


		<ul class="navbar-nav ml-auto mt-2 mt-lg-0">



			<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
			<li class="nav-link"><%= df.format(new java.util.Date()) %></li>


			<li class="nav-link" id="txt" style="text-color: #fff">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><%=name %></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="AdminProfile.jsp">My Profile</a> <a
						class="dropdown-item" href="#">Request Reset Password</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="LogoutServlet">Logout</a>
				</div></li>
		</ul>
	</div>
</nav>

