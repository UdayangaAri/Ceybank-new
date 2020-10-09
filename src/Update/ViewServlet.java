package Update;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h1>Update Employee</h1>");
		
		String sid = request.getParameter("name");
		
		
		Emp e = EmpDao.getEmployeeById(sid);
		
		if(sid == e.getEmployeeNo()) {

		out.print("<form action='user_update.jsp' method='post'>");
		out.print("<table>");
		
		out.print("<tr><td>Name:</td><td><input type='text' name='fname' value='" + e.getEmployeeNo() + "'/></td></tr>");
		out.print("<tr><td>Name:</td><td><input type='text' name='fname' value='" + e.getUsername() + "'/></td></tr>");
		out.print("<tr><td>Name:</td><td><input type='text' name='fname' value='" + e.getFirstName() + "'/></td></tr>");
		out.print("<tr><td>firstName:</td><td><input type='text' name='lname' value='" + e.getLastName()+ "'/></td></tr>");
		out.print("<tr><td>nic:</td><td><input type='text' name='nic' value='" + e.getNIC() + "'/></td></tr>");
		
		out.print("<tr><td>phone:</td><td><input type='text' name='phone' value='" + e.getPhoneNo() + "'/></td></tr>");
		out.print("<tr><td>mobile:</td><td><input type='text' name='mobile' value='" + e.getMobileNo() + "'/></td></tr>");
		out.print("<tr><td>Email:</td><td><input type='text' name='email' value='" + e.getEmail() + "'/></td></tr>");
		out.print("<tr><td>address:</td><td><input type='text' name='address' value='" + e.getAddress() + "'/></td></tr>");
		
		out.print("<tr><td>username:</td><td><input type='text' name='role' value='" + e.getRole() + "'/></td></tr>");
		out.print("<tr><td>lastName:</td><td><input type='text' name='uname' value='" + e.getBranch() + "'/></td></tr>");
		out.print("<tr><td colspan='2'><input type='submit' value='Edit & Save '/></td></tr>");
		out.print("</table>");
		out.print("</form>");

		System.out.println(sid);
		
		}
		else {
request.setAttribute("errorMessage", "errorMessage");
			
			request.getRequestDispatcher("Update.jsp").forward(request, response);
		}
		out.close();
	}

}
