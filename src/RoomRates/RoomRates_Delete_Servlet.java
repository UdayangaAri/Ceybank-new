package RoomRates;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Branches.BranchDao;
import Log.LogDAO;

@WebServlet("/RoomRates_Delete_Servlet")
public class RoomRates_Delete_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomRates_Delete_Servlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String rid = request.getParameter("id");
		int id = Integer.parseInt(rid);
		int st = RoomRatesDAO.deleteRoomRAtes(id);

		if (st > 0) {

			request.setAttribute("RRDSucceed", "RRDSucceed");
			request.getRequestDispatcher("RoomRates_View.jsp").include(request, response);
			

		} else {
			
			request.setAttribute("RRDFailed", "RRDFailed");
			request.getRequestDispatcher("RoomRates_View.jsp").include(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
