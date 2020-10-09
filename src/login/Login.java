package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dashboard.dashboardDAO;
import register.passwordEncrypt;

@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String EmpNo = request.getParameter("Username");
		String password = request.getParameter("pass");
		
		passwordEncrypt epwdEncrypt = new passwordEncrypt();
		
		String encryptedPwd = epwdEncrypt.userPassword(password);

		LoginBean loginBean = new LoginBean();

		loginBean.setEmpno(EmpNo);
		
		loginBean.setPassword(encryptedPwd);
		
		
		LoginDao loginDao = new LoginDao();

		try { 
			String userValidate = loginDao.authenticateUser(loginBean);

			HttpSession session = request.getSession();

			if (userValidate.equals("Access_Granted")) {
				
				LoginBean b = LoginDao.getEmployeeById(EmpNo);

				String branch = b.getBranch();
				String empNo = b.getEmpno();
				String roleid = b.getRole();
				String fname = b.getFname();
				String gender = b.getGender();
				
				session.setAttribute("Username", EmpNo);
				session.setAttribute("empno", empNo);
				session.setAttribute("branch", branch);
				
				session.setAttribute("roleid", roleid);
				
				session.setAttribute("fname", fname);
				
				session.setAttribute("gender", gender);
		
				String s = String.valueOf(branch);
				String countEmpOnBranch = dashboardDAO.getEmpCount(s);
				
				request.setAttribute("countEmpOnBranch", countEmpOnBranch);
				
				session.setAttribute("countEmpOnBranch", countEmpOnBranch);
				
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}

			else {

				request.setAttribute("errorMessage", "Login Failed");

				request.setAttribute("errMessage", userValidate);

				request.getRequestDispatcher("index.jsp").forward(request, response);
			}

		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
}
