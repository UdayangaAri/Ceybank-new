package RoomTypeMaster;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Log.Log;
import Log.LogDAO;
import Roles.Role;
import Roles.RoleDao;

@WebServlet("/RoomType_editServlet")
public class RoomType_editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomType_editServlet() {
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

		String id = request.getParameter("room_type_id");
		int sid = Integer.parseInt(id);

		Room_type x = roomTypeDAO.getRoomTypeById(sid);

		String previousData = "Room Type Id : " + x.getId() + " , Room Type Name : " + x.getRoom_Type();
		String e_status = "Edited";
		String edited_unit = "Room Types";
		String name = (String) request.getSession(false).getAttribute("empno");

		String room_type_n = request.getParameter("room_type_n");

		Room_type e = new Room_type();

		e.setId(sid);
		e.setRoom_Type(room_type_n);

		Log log = new Log();

		log.setPrevious_data(previousData);
		log.setEdited_by(name);
		log.setEdit_status(e_status);
		log.setEdited_unit(edited_unit);

		int status = roomTypeDAO.update(e);

		if (status > 0) {

			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {
				request.setAttribute("RTESucceed", "RTESucceed");
				request.getRequestDispatcher("RoomTypeMasterView.jsp").include(request, response);

			} else {
				request.setAttribute("RTEFailed", "RTEFailed");
				request.getRequestDispatcher("RoomTypeMasterView.jsp").include(request, response);

			}

		} else {
			request.setAttribute("RTEFailed", "RTEFailed");
			request.getRequestDispatcher("RoomTypeMasterView.jsp").include(request, response);

		}

		out.close();
	}

}
