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
import RoomReservation.RoomDAO;
import RoomTypeMaster.Room_type;
import RoomTypeMaster.roomTypeDAO;
import block_Register.blockDAO;

@WebServlet("/RoomEditServlet")
public class RoomEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomEditServlet() {
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

		String sid = (String) session.getAttribute("sid_in_roomMM");

		int id = Integer.parseInt(sid);

		String RoomNo = request.getParameter("RoomNoEdit");

		String Roomname = request.getParameter("RoomnameEdit");
		String RoomType = request.getParameter("RoomTypeEdit");

		String RoomStatus = request.getParameter("RoomStatusEdit");
		String blockName = request.getParameter("blockNameEdit");

		Room x = RoomDao.getRoomById(sid);

		String previousData = "block Name : " + x.getBlockID() + " ,Branch Name : " + x.getBranchID() + " , Room No : "
				+ x.getRoomNo() + ", Room Name : " + x.getRoomName() + " , Room Type : " + x.getRoomType()
				+ " , Room Status : " + x.getRoomStatus() + " , ID of Room : " + x.getId();
		String e_status = "Edited";
		String edited_unit = "Rooms";
		String name1 = (String) request.getSession(false).getAttribute("empno");

		int blockID = Integer.parseInt(blockName);
		int RoomTypeID = Integer.parseInt(RoomType);

		Room e = new Room();

		e.setId(id);
		e.setBlockID(blockID);

		e.setRoomNo(RoomNo);
		e.setRoomName(Roomname);

		e.setRoomType(RoomTypeID);
		e.setRoomStatus(RoomStatus);

		Log log = new Log();

		log.setPrevious_data(previousData);
		log.setEdited_by(name1);
		log.setEdit_status(e_status);
		log.setEdited_unit(edited_unit);

		int status = RoomDao.update(e);

		if (status > 0) {

			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {

				request.setAttribute("editedMessageRM", "editedMessageRM");
				request.getRequestDispatcher("room_view.jsp").include(request, response);

			} else {
				request.setAttribute("editedMessageRMF", "editedMessageRMF");
				request.getRequestDispatcher("room_view.jsp").include(request, response);
			}

		} else {
			request.setAttribute("editedMessageRMF", "editedMessageRMF");
			request.getRequestDispatcher("room_view.jsp").include(request, response);
		}

		out.close();
	}

}
