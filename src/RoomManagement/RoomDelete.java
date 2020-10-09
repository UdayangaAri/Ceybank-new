package RoomManagement;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Branches.Branch;
import Branches.BranchDao;
import Log.Log;
import Log.LogDAO;

@WebServlet("/RoomDelete")
public class RoomDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomDelete() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);

		Room x = RoomDao.getRoomById(sid);

		String name = (String) request.getSession(false).getAttribute("empno");
		String e_status = "Deleted";
		String edited_unit = "Rooms";
		String previousData = "Room Id : " + x.getId() + " , Room No : " + x.getRoomNo() + ", Room Name : "
				+ x.getRoomName() + " , Room Type : " + x.getRoomType() + " , Block ID of Room : " + x.getBlockID();

		Log log = new Log();

		log.setPrevious_data(previousData);
		log.setEdit_status(e_status);
		log.setEdited_by(name);
		log.setEdited_unit(edited_unit);

		int st = RoomDao.delete(id);

		if (st > 0) {
			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {

				request.setAttribute("deleteMessageRMs", "deleteMessageRMs");

				request.getRequestDispatcher("room_view.jsp").include(request, response);
				
				session.setAttribute("RoomViewAlt", "deleteMessageRMs");

			}
		} else {
			request.setAttribute("CannotDeleteAlertRM", "CannotDeleteAlertRM");

			request.getRequestDispatcher("room_view.jsp").include(request, response);
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
