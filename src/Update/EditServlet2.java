package Update;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/EditServlet2")
public class EditServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet2() {
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

		HttpSession session = request.getSession();

		String employeeNo = request.getParameter("empno");
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String nic = request.getParameter("nic");

		String Gender = request.getParameter("Gender");

		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		String role = request.getParameter("role");
		String Branch = request.getParameter("Branch");

		String username = request.getParameter("empno");
		String currentStatus = request.getParameter("current_status");
		String DStatus = ("Deactive");
		String AStatus = ("Active");

		Roles.Role y = EmpDao.getRoleById(role);
		Branches.Branch b = EmpDao.getBranchById(Branch);

		if (role.equals(y.getRole())) {

			if (Branch.equals(b.getDisplayName())) {

				int roleID = y.getId();
				int BranchID = b.getId();

				Emp x = EmpDao.getEmployeeById(employeeNo);

				String previousData_1 = "Employee No : " + x.getEmployeeNo() + " , Employee First Name : "
						+ x.getFirstName() + " , Employee Last Name : " + x.getLastName() + ", Gender : "
						+ x.getGender() + " , Employee Username : " + x.getUsername() + " , Employee Role : "
						+ x.getRole() + " , Employee Phone No : " + x.getPhoneNo() + " , Employee Mobile No : "
						+ x.getMobileNo() + ", Employee Email : " + x.getEmail() + " , Employee Address : "
						+ x.getAddress() + " , Employee NIC : " + x.getNIC() + " , Employee Branch : " + x.getBranch()
						+ " , Employee Status : " + x.getStatus();
				String e_status_1 = "Edited";
				String edited_unit_1 = "Employee Types";
				String name_1 = (String) request.getSession(false).getAttribute("empno");

				if (request.getParameter("edit") != null) {

					Emp e = new Emp();

					e.setEmployeeNo(employeeNo);
					e.setFirstName(firstName);
					e.setLastName(lastName);
					e.setNIC(nic);
					e.setGender(Gender);
					e.setUsername(username);
					e.setPhoneNo(phone);
					e.setMobileNo(mobile);
					e.setEmail(email);
					e.setAddress(address);
					e.setRole(roleID);
					e.setBranch(BranchID);
					e.setStatus(currentStatus);
					;

					Log log = new Log();

					log.setPrevious_data(previousData_1);
					log.setEdited_by(name_1);
					log.setEdit_status(e_status_1);
					log.setEdited_unit(edited_unit_1);

					int status = EmpDao.update(e);

					out.println("status : " + status);

					if (status > 0) {

						int logs = LogDAO.InsertLog(log);

						if (logs > 0) {
							
							request.setAttribute("updated", "updated");
							request.getRequestDispatcher("Update.jsp").include(request, response);

						} else {
							request.setAttribute("not_updated", "not_updated");
							request.getRequestDispatcher("Update.jsp").include(request, response);
							
						}

					} else {
						request.setAttribute("not_updated", "not_updated");
						request.getRequestDispatcher("Update.jsp").include(request, response);
						
					}

				} else if (request.getParameter("Deactivate") != null) {

					Emp e = new Emp();

					String previousData = "Employee No : " + x.getEmployeeNo();
					String e_status = "Deactivated";
					String edited_unit = "Employee";
					String name = (String) request.getSession(false).getAttribute("empno");

					e.setEmployeeNo(employeeNo);
					e.setStatus(DStatus);

					Log log = new Log();
					log.setPrevious_data(previousData);
					log.setEdited_by(name);
					log.setEdit_status(e_status);
					log.setEdited_unit(edited_unit);

					int status = EmpDao.deactivate(e);

					if (status > 0) {
						int logs = LogDAO.InsertLog(log);

						if (logs > 0) {

							request.setAttribute("Dsucceed", "Dsucceed");
							request.getRequestDispatcher("Update.jsp").include(request, response);
							

						} else {
							request.setAttribute("Dfailed", "Dfailed");
							request.getRequestDispatcher("Update.jsp").include(request, response);
							
						}

					} else {
						request.setAttribute("Dfailed", "Dfailed");
						request.getRequestDispatcher("Update.jsp").include(request, response);
						
					}

				} else if (request.getParameter("Activate") != null) {

					Emp e = new Emp();

					String previousData = "Employee No : " + x.getEmployeeNo();
					String e_status = "Activated";
					String edited_unit = "Employee";
					String name = (String) request.getSession(false).getAttribute("empno");

					e.setEmployeeNo(employeeNo);
					e.setStatus(AStatus);

					Log log = new Log();
					log.setPrevious_data(previousData);
					log.setEdited_by(name);
					log.setEdit_status(e_status);
					log.setEdited_unit(edited_unit);
					;

					int status = EmpDao.deactivate(e);

					if (status > 0) {

						int logs = LogDAO.InsertLog(log);

						if (logs > 0) {
							request.setAttribute("Asucceed", "Asucceed");
							request.getRequestDispatcher("Update.jsp").include(request, response);
							

						} else {
							request.setAttribute("Afailed", "Afailed");
							request.getRequestDispatcher("Update.jsp").include(request, response);
							
						}

					} else {

						request.setAttribute("Afailed", "Afailed");
						request.getRequestDispatcher("Update.jsp").include(request, response);
						
					}

				}
			}
		}
		out.close();

	}

}
