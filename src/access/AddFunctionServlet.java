package access;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddFunctionServlet")
public class AddFunctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddFunctionServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);

		RoleFunction rf = new RoleFunction();

		String[] selectedStudentIdsID = request.getParameterValues("selected");

		for (int i = 0; i < selectedStudentIdsID.length; i++) {

			Integer roleIDByName = (Integer) session.getAttribute("roleIDByName");

			String s = String.valueOf(roleIDByName);

			String name = (String) session.getAttribute("Username");

			String empno = (String) session.getAttribute("empno");

			String a = selectedStudentIdsID[i];

			rf.setFunctionID(a);
			rf.setRoleID(s);
			rf.setCraetedBy(empno);
			int status = RoleFunctionDAO.save(rf);

			if (status < 0) {
				
				request.setAttribute("AFFailed", "AFFailed");
				request.getRequestDispatcher("PageAccessEdit.jsp").include(request, response); 
				
			}

		}

		request.setAttribute("AFSucceed", "AFSucceed");
		request.getRequestDispatcher("PageAccessEdit.jsp").include(request, response); 

		out.close();

	}

}
