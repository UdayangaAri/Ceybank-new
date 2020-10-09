


<%@page import="sidebar.sideBarBeanClass"%>
<%@page import="Functions.FunctionDAO"%>
<%@page import="access.RoleFunctionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sidebar.sidebarDAO"%>
<%@page import="access.RoleFunction"%>
<%@page import="Update.Emp"%>


<nav id="sidebar">
	<div class="sidebar-header" style="margin-right: 1px;">
		<div>
		<a href="home.jsp"
			style="color: #fafafa; background-color: transparent;">
			<img src="images/ceybankholi.png" class="image-cropper" alt="..."
				height="120" width="210"></a>
		</div>
	</div>

	<%
		String roleid = (String) session.getAttribute("roleid");
		//System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&& role id in side bar : " + roleid +"&&&&&&&&&&&&&&&&");

		List<RoleFunction> list = sidebarDAO.getFunctionsByRoleID(roleid);
	%>


	<ul class="list-unstyled components">
		<%
			for (RoleFunction e : list) {
				int i = Integer.parseInt(e.getFunctionID());
				//System.out.println("i value : "+i);
				if (i == 1) {
					//style="display:none;"
		%>
		<li><a href="home.jsp"
			style="color: #fafafa; background-color: transparent;"> <img
				src="images/dashboardTest.png" alt="" border=3 height=27 width=27
				style="float: left; margin-right: 0.5em"> Dashboard
		</a></li>
		<%
			}
			}
		%>

		<li><a href="#pageSubmenu4"
			style="color: #fafafa; background-color: transparent;"
			data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<img src="images/house.png" alt="" border=3 height=27 width=27
				style="float: left; margin-right: 0.5em"> Front Officer
		</a>

			<ul class="collapse list-unstyled" id="pageSubmenu4">
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 2 || i == 3 || i == 4){
						if (i == 14) {
				%>
				<li><a href="RoomStatus.jsp"
					style="color: #fafafa; background-color: transparent;"> Room
						Status </a></li>
				<%
					}
					}
				%>
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 2 || i == 3 || i == 4){
						if (i == 2) {
				%>
				<li><a href="reservation.jsp"
					style="color: #fafafa; background-color: transparent;">
						Reservation </a></li>
				<%
					}
					}
				%>
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 2 || i == 3 || i == 4){

					}
				%>
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 2 || i == 3 || i == 4){
					}
				%>

			</ul></li>


		<li><a href="#pageSubmenu"
			style="color: #fafafa; background-color: transparent;"
			data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<img src="images/homes.png" alt="" border=3 height=27 width=27
				style="float: left; margin-right: 0.5em"> House Keeping
		</a>

			<ul class="collapse list-unstyled" id="pageSubmenu">

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 5 || i == 6){
						if (i == 6) {
				%>

				<li><a href="block_view.jsp"
					style="color: #fafafa; background-color: transparent;"> Block
						Management </a></li>

				<%
					}
					}
				%>

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 5 || i == 6){
						if (i == 5) {
				%>
				<li><a href="room_view.jsp"
					style="color: #fafafa; background-color: transparent;"> Room
						Management </a></li>
				<%
					}
					}
				%>

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 5 || i == 6){
						if (i == 16) {
				%>
				<li><a href="Room_Status_Management.jsp"
					style="color: #fafafa; background-color: transparent;"> Room
						Status Management </a></li>
				<%
					}
					}
				%>
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 5 || i == 6){
						if (i == 15) {
				%>
				<li><a href="RoomRates_View.jsp"
					style="color: #fafafa; background-color: transparent;"> Room
						Rates Management </a></li>
				<%
					}
					}
				%>

			</ul>
		</li>
		
		
		<li><a href="#pageSubmenu11"
			style="color: #fafafa; background-color: transparent;"
			data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<img src="images/news.png" alt="" border=3 height=27 width=27
				style="float: left; margin-right: 0.5em"> News & Offers
		</a>
			<ul class="collapse list-unstyled" id="pageSubmenu11">

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						// if(i == 8 || i == 9){
						if (i == 17) {
				%>

				<li><a href="NewsUpdates.jsp"
					style="color: #fafafa; background-color: transparent;"> News </a></li>
				<%
					}
					}
				%>
				
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						// if(i == 8 || i == 9){
						if (i == 345) {
				%>

				<li><a href="News_view.jsp"
					style="color: #fafafa; background-color: transparent;"> Update News </a></li>
				<%
					}
					}
				%>
				
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						// if(i == 8 || i == 9){
						if (i == 344) {
				%>

				<li><a href="Offers.jsp"
					style="color: #fafafa; background-color: transparent;"> Offers </a></li>
				<%
					}
					}
				%>
				
				

			</ul>
		</li>
		
		

		<li><a href="#pageSubmenu1"
			style="color: #fafafa; background-color: transparent;"
			data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<img src="images/report.png" alt="" border=3 height=27 width=27
				style="float: left; margin-right: 0.5em"> Reports
		</a>
			<ul class="collapse list-unstyled" id="pageSubmenu1">

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						// if(i == 8 || i == 9){
						if (i == 7) {
				%>

				<li><a href="TextFileGenerating.jsp"
					style="color: #fafafa; background-color: transparent;"> Audit
						Log File </a></li>
				<%
					}
					}
				%>

			</ul>
		</li>

		<li><a href="#pageSubmenu9"
			style="color: #fafafa; background-color: transparent;"
			data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<img src="images/uses.png" alt="" border=3 height=27 width=27
				style="float: left; margin-right: 0.5em"> User Management
		</a>
			<ul class="collapse list-unstyled" id="pageSubmenu9">

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						// if(i == 8 || i == 9){
						if (i == 8) {
				%>

				<li><a href="register.jsp"
					style="color: #fafafa; background-color: transparent;">
						Register User </a></li>
				<%
					}
					}
				%>

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 8 || i == 9){
						if (i == 9) {
				%>
				<li><a href="Update.jsp"
					style="color: #fafafa; background-color: transparent;"> Update
						User </a></li>
				<%
					}
					}
				%>
			</ul></li>

		<li><a href="#pageSubmenu2"
			style="color: #fafafa; background-color: transparent;"
			data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<img src="images/setting.png" alt="" border=3 height=26 width=26
				style="float: left; margin-right: 0.5em"> Settings
		</a>

			<ul class="collapse list-unstyled" id="pageSubmenu2">

				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 10 || i == 11 || i == 12){
						if (i == 10) {
				%>
				<li><a href="R_View.jsp"
					style="color: #fafafa; background-color: transparent;"> User
						Role Groups </a></li>
				<%
					}
					}
				%>
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 10 || i == 11 || i == 12){
						if (i == 11) {
				%>
				<li><a href="B_View.jsp"
					style="color: #fafafa; background-color: transparent;"> Branch
						Management </a></li>
				<%
					}
					}
				%>
				
				<%
					for (RoleFunction e : list) {
						int i = Integer.parseInt(e.getFunctionID());
						//System.out.println("i value : "+i);
						//if(i == 10 || i == 11 || i == 12){
						if (i == 12) {
				%>
				<li><a href="RoomTypeMasterView.jsp"
					style="color: #fafafa; background-color: transparent;"> Room
						Type Master </a></li>
				<%
					}
					}
				%>
				
				
			</ul></li>


		<%
			for (RoleFunction e : list) {
				int i = Integer.parseInt(e.getFunctionID());
				//System.out.println("i value : "+i);
				if (i == 13) {
		%>
		<li><a href="Role.jsp"
			style="color: #fafafa; background-color: transparent;"> <img
				src="images/access.png" alt="" border=3 height=27 width=27
				style="float: left; margin-right: 0.5em"> Access
		</a></li>

		<%
			}
			}
		%>
	</ul>

</nav>







<script>
	var today = new Date().toISOString().split('T')[0];
	document.getElementsByName("doba")[0].setAttribute('max', today);
	function yesnoCheck() {
		if (document.getElementById('yesChecka').checked) {
			document.getElementById('ifYesa').style.visibility = 'visible';
		} else
			document.getElementById('ifYesa').style.visibility = 'hidden';
	}
	function my1() {
		$(document).ready(function() {
			$("#update").modal('show');
			$tr = $this.closest('tr');
			tr = $(this).closet('tr');
		});
	}
</script>

