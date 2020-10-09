package block_Register;

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
import RoomTypeMaster.Room_type;
import RoomTypeMaster.roomTypeDAO;

@WebServlet("/blockDeleteServlet")
public class blockDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public blockDeleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		block x = blockDAO.getBlockById(sid);

		String name = (String) request.getSession(false).getAttribute("empno");
		String e_status = "Deleted";
		String edited_unit = "Block Types";
		String previousData = "Block Type Id : " + x.getId() + " , Block Type Location : " + x.getLocation()
				+ " , Block Type Name : " + x.getBlock_name() + " , Block Type Status :" + x.getBlock_status();

		Log log = new Log();

		log.setPrevious_data(previousData);
		log.setEdit_status(e_status);
		log.setEdited_by(name);
		log.setEdited_unit(edited_unit);

		int st = blockDAO.delete(id);

		if (st > 0) {
			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {

				request.setAttribute("BrDsucceed", "BrDsucceed");

				request.getRequestDispatcher("block_view.jsp").include(request, response);

			}
		} else {

			request.setAttribute("BrDfailed", "BrDfailed");

			request.getRequestDispatcher("block_view.jsp").include(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
