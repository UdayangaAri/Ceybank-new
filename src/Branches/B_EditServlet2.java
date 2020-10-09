package Branches;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Log.Log;
import Log.LogDAO;

@WebServlet("/B_EditServlet2")
public class B_EditServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public B_EditServlet2() {
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

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		String name = request.getParameter("name");
		String dname = request.getParameter("dname");
		String address = request.getParameter("address");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String fax = request.getParameter("fax");
		String email = request.getParameter("email");
		String currentStatus = request.getParameter("current_status");
		String DStatus = ("Deactive");
		String AStatus = ("Active");

		System.out.println("phone1 ::: " + phone1);

		if (request.getParameter("edit") != null) {

			Branch x = BranchDao.getBranchById(sid);

			String previousData = "Branch Id : " + x.getId() + " , Branch Name : " + x.getName()
					+ ", Branch Display Name : " + x.getDisplayName() + " , Branch Address : " + x.getAddress()
					+ " , Branch Phone1 : " + x.getPhone1() + " , Branch Phone2 : " + x.getPhone2() + " , Branch Fax : "
					+ x.getFax() + " , Branch Email : " + x.getEmail() + " , Branch Status : " + x.getStatus();
			String e_status = "Edited";
			String edited_unit = "Branches";
			String name1 = (String) request.getSession(false).getAttribute("empno");

			Branch e = new Branch();
			e.setId(id);
			e.setName(name);
			e.setDisplayName(dname);
			e.setAddress(address);
			e.setPhone1(phone1);
			e.setPhone2(phone2);
			e.setFax(fax);
			e.setEmail(email);
			e.setStatus(currentStatus);

			Log log = new Log();

			log.setPrevious_data(previousData);
			log.setEdited_by(name1);
			log.setEdit_status(e_status);
			log.setEdited_unit(edited_unit);

			int status = BranchDao.update(e);
			if (status > 0) {

				int logs = LogDAO.InsertLog(log);

				if (logs > 0) {
					request.setAttribute("BEsucceed", "BEsucceed");
					request.getRequestDispatcher("B_View.jsp").include(request, response);

				} else {
					request.setAttribute("BEfailed", "BEfailed");
					request.getRequestDispatcher("B_View.jsp").include(request, response);
				}

			} else {
				request.setAttribute("BEfailed", "BEfailed");
				request.getRequestDispatcher("B_View.jsp").include(request, response);
			}

		}

		else if (request.getParameter("Deactivate") != null) {

			Branch e = new Branch();

			Branch x = BranchDao.getBranchById(sid);

			String previousData = "Branch Id : " + x.getName();
			String e_status = "Deactivated";
			String edited_unit = "Branches";
			String name1 = (String) request.getSession(false).getAttribute("empno");

			e.setId(id);
			e.setStatus(DStatus);

			Log log = new Log();

			log.setPrevious_data(previousData);
			log.setEdited_by(name1);
			log.setEdit_status(e_status);
			log.setEdited_unit(edited_unit);

			int status = BranchDao.deactivate(e);

			if (status > 0) {

				int logs = LogDAO.InsertLog(log);

				if (logs > 0) {

					request.setAttribute("BDCSucceed", "BDCSucceed");
					request.getRequestDispatcher("B_View.jsp").include(request, response);

				} else {
					request.setAttribute("BDCfailed", "BDCfailed");
					request.getRequestDispatcher("B_View.jsp").include(request, response);

				}

			} else {
				request.setAttribute("BDCfailed", "BDCfailed");
				request.getRequestDispatcher("B_View.jsp").include(request, response);

			}

		} else if (request.getParameter("Activate") != null) {

			Branch e = new Branch();

			Branch x = BranchDao.getBranchById(sid);

			String previousData = "Branch Id : " + x.getName();
			String e_status = "Activated";
			String edited_unit = "Branches";
			String name1 = (String) request.getSession(false).getAttribute("empno");

			e.setId(id);
			e.setStatus(AStatus);

			Log log = new Log();

			log.setPrevious_data(previousData);
			log.setEdited_by(name1);
			log.setEdit_status(e_status);
			log.setEdited_unit(edited_unit);

			int status = BranchDao.deactivate(e);

			if (status > 0) {

				int logs = LogDAO.InsertLog(log);

				if (logs > 0) {

					request.setAttribute("BACsucceed", "BACsucceed");
					request.getRequestDispatcher("B_View.jsp").include(request, response);

				} else {
					request.setAttribute("BACfailed", "BACfailed");
					request.getRequestDispatcher("B_View.jsp").include(request, response);

				}

			} else {
				request.setAttribute("BACfailed", "BACfailed");
				request.getRequestDispatcher("B_View.jsp").include(request, response);

			}

		}

		out.close();
	}

}
