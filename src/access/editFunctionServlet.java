package access;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Log.Log;
import Log.LogDAO;
import Roles.Role;
import Roles.RoleDao;
import block_Register.blockDAO;

@WebServlet("/editFunctionServlet")
public class editFunctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public editFunctionServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String functionID[] = request.getParameterValues("functionID");
		try {
			for (int i = 0; i < functionID.length; i++) {

				String a = functionID[i];

				int FunctionID = Integer.parseInt(a);

				Integer roleID = (Integer) session.getAttribute("roleIDByName");

				String FunctionIDString = Integer.toString(FunctionID);

				String roleIDString = Integer.toString(roleID);

				RoleFunction r = RoleFunctionDAO.getFunction(roleIDString);

				String previousData = "Funtion Id : " + r.getFunctionID() + " , Role ID : " + r.getRoleID();
				String e_status = "Access Removed";
				String edited_unit = "Access";
				String name = (String) request.getSession(false).getAttribute("empno");

				Log log = new Log();

				log.setPrevious_data(previousData);
				log.setEdited_by(name);
				log.setEdit_status(e_status);
				log.setEdited_unit(edited_unit);

				if (roleID == 3 && FunctionID == 13) {

					request.setAttribute("EFFailed", "EFFailed");
					request.getRequestDispatcher("PageAccessEdit.jsp").include(request, response); 
					
				} else {

					int logs = LogDAO.InsertLog(log);

					if (logs > 0) {

						RoleFunctionDAO.deleteRoleFunction(FunctionID, roleID);
						
						request.setAttribute("EFSucceed", "EFSucceed");
						request.getRequestDispatcher("PageAccessEdit.jsp").include(request, response); 
						

					} else {
						request.setAttribute("EFFailed", "EFFailed");
						request.getRequestDispatcher("PageAccessEdit.jsp").include(request, response);
					}

				}

			}
			//response.sendRedirect("PageAccessEdit.jsp");
		}

		catch (NullPointerException e) {
			System.out.println("NullPointerException in edit Function servlet\n" + e);
		}

	}

}