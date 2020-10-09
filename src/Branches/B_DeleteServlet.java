package Branches;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Log.Log;
import Log.LogDAO;

@WebServlet("/B_DeleteServlet")
public class B_DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public B_DeleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		Branch x = BranchDao.getBranchById(sid);

		String name = (String) request.getSession(false).getAttribute("empno");
		String e_status = "Deleted";
		String edited_unit = "Branches";
		String previousData = "Branch Id : " + x.getId() + " , Branch Name : " + x.getName()
				+ " , Branch Display Name : " + x.getDisplayName() + " , Branch Address : " + x.getAddress()
				+ " , Branch Phone1 : " + x.getPhone1() + " , Branch Phone2 : " + x.getPhone2() + " , Branch Fax : "
				+ x.getFax() + " , Branch Email : " + x.getEmail() + " , Branch Status : " + x.getStatus();

		Log log = new Log();

		log.setPrevious_data(previousData);
		log.setEdit_status(e_status);
		log.setEdited_by(name);
		log.setEdited_unit(edited_unit);

		int st = BranchDao.delete(id);

		if (st > 0) {
			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {
				
				request.setAttribute("BDsucceed", "BDsucceed");
				request.getRequestDispatcher("B_View.jsp").include(request, response); 

			}
		} else {
			
			request.setAttribute("BDfailed", "BDfailed");
			request.getRequestDispatcher("B_View.jsp").include(request, response); 

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
