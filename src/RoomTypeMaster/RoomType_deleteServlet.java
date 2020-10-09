package RoomTypeMaster;

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
import block_Register.blockDAO;

@WebServlet("/RoomType_deleteServlet")
public class RoomType_deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomType_deleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		HttpSession session = request.getSession();

		int i = Integer.parseInt(sid);

		Room_type x = roomTypeDAO.getRoomTypeById(i);

		String name = (String) request.getSession(false).getAttribute("empno");
		String e_status = "Deleted";
		String edited_unit = "Room Types";
		String previousData = "Room Type Id : " + x.getId() + " , Room Type Name : " + x.getRoom_Type();

		Log log = new Log();

		System.out.println("previousData : " + previousData);
		System.out.println("name : " + name);

		log.setPrevious_data(previousData);
		log.setEdit_status(e_status);
		log.setEdited_by(name);
		log.setEdited_unit(edited_unit);

		int st = roomTypeDAO.delete(id);

		if (st > 0) {
			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {
				request.setAttribute("RTDSucceed", "RTDSucceed");
				request.getRequestDispatcher("RoomTypeMasterView.jsp").include(request, response);

			}
		} else {
			request.setAttribute("RTDFailed", "RTDFailed");
			request.getRequestDispatcher("RoomTypeMasterView.jsp").include(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
