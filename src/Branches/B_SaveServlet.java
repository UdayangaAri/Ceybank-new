
package Branches;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/B_SaveServlet")
public class B_SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public B_SaveServlet() {
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

		String name = request.getParameter("name");
		String dname = request.getParameter("dname");
		String address = request.getParameter("address");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String fax = request.getParameter("fax");
		String email = request.getParameter("email");
		String Status = ("Active");
 
		Branch e = new Branch();

		e.setName(name);
		e.setDisplayName(dname);
		e.setAddress(address);
		e.setPhone1(phone1);
		e.setPhone2(phone2);
		e.setFax(fax);
		e.setEmail(email);
		e.setStatus(Status);

		int status = BranchDao.save(e);
		
		if (status > 0) {
			
			request.setAttribute("Bsucceed", "Bsucceed");
			request.getRequestDispatcher("B_View.jsp").include(request, response); 
			
		} else {
			request.setAttribute("Bfailed", "Bfailed");
			request.getRequestDispatcher("B_View.jsp").include(request, response); 
		}

		out.close();
	}

}
