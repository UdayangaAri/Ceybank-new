package register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(name = "RegisterServlet", urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		String employeeNo = request.getParameter("eno");
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String Gender = request.getParameter("Gender");
		String role = request.getParameter("role");
		String defaultPWD = request.getParameter("defpwd");
		String phone = request.getParameter("phoneno");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String NIC = request.getParameter("nic");
		String Branch = request.getParameter("Branch");
		String status = request.getParameter("Status");
		
		Roles.Role e = RegisterDao.getRoleById(role);
		Branches.Branch b = RegisterDao.getBranchById(Branch);
		
		if(role.equals(e.getRole()) && Branch.equals(b.getDisplayName())) {

			int roleID = e.getId();
			int BranchID = b.getId();
			
			RegisterBean registerBean = new RegisterBean();

			registerBean.setEmployeeNo(employeeNo);
			
			registerBean.setFirstName(firstName);
			registerBean.setLastName(lastName);
			registerBean.setGender(Gender);
			
			registerBean.setRole(roleID);
			registerBean.setDefaultPWD(defaultPWD);
			registerBean.setPhone(phone);
			registerBean.setMobile(mobile);
			registerBean.setEmail(email);
			registerBean.setAddress(address);
			registerBean.setNIC(NIC);
			registerBean.setBranch(BranchID);
			registerBean.setStatus(status);

			RegisterDao registerDao = new RegisterDao();

			String userRegistered = registerDao.registerUser(registerBean);

			if (userRegistered.equals("SUCCESS")) {
				
				request.setAttribute("RSuccessed", "RSuccessed");
				request.getRequestDispatcher("register.jsp").include(request, response); 
				
			} else {
				
				request.setAttribute("RFailed", "RFailed");
				request.getRequestDispatcher("register.jsp").include(request, response); 
				
			}
			
		}

		

	}

}
