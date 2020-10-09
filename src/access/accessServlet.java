package access;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Roles.Role;
import Roles.RoleDao;

@WebServlet("/accessServlet")
public class accessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public accessServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//
//		String rolename = request.getParameter("rolename");
//		System.out.println("hii");
//		System.out.println("role : "+rolename);

		//
		// System.out.println("role : "+roleselectedID);

		String rolename = request.getParameter("rolename");
		//System.out.println("role name : " + rolename);
		Role r = RoleDao.getRoleByRoleName(rolename);
		

		int roleIDByName = r.getId();

		HttpSession session = request.getSession();
		session.setAttribute("roleIDByName", roleIDByName);
		
	//	System.out.println("roleID in servlet : " + r.getId());

		session.setAttribute("sucess", "Success Message");
		
		String s = String.valueOf(roleIDByName);
		
		//RoleFunctionDAO.getAllPagesByID(s);
		
		
		
		boolean a = RoleFunctionDAO.getAllPagesByID(s);
		int val = (a) ? 1 : 0;
		if(val>0) {
			request.getRequestDispatcher("PageAccessEdit.jsp").include(request, response);
		}
		
		else {
			request.getRequestDispatcher("Page.jsp").include(request, response);
		}
		
		
		
	}

}
