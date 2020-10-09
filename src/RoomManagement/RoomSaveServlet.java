package RoomManagement;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RoomSaveServlet")
public class RoomSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomSaveServlet() {
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

		//HttpSession session = request.getSession();

		String branchName = request.getParameter("BranchNo");
		String blockName = request.getParameter("blockName");

		String roomNo = request.getParameter("RoomNo");
		String roomName = request.getParameter("Roomname");
		String roomType = request.getParameter("RoomType");

		String roomStatus = request.getParameter("roomStatus");

		System.out.println("branchName ::: " + branchName);
		System.out.println("blockName ::: " + blockName);
		System.out.println("roomStatus ::: " + roomStatus);

		int branchID = Integer.parseInt(branchName);
		int blockID = Integer.parseInt(blockName);
		int RoomTypeID = Integer.parseInt(roomType);

		Room room = new Room();

		String room_Status = "Available";

		room.setBranchID(branchID);
		room.setBlockID(blockID);

		room.setRoomNo(roomNo);
		room.setRoomName(roomName);

		room.setRoomType(RoomTypeID);
		room.setRoomStatus(room_Status);

		int status = RoomDao.save(room);

		if (status > 0) {
			request.setAttribute("SaveMessageRMs", "SaveMessageRMs");

			request.getRequestDispatcher("room_view.jsp").include(request, response);

		} else {
			request.setAttribute("SaveMessageFailsRMs", "SaveMessageFailsRMs");

			request.getRequestDispatcher("room_view.jsp").include(request, response);

		}

		out.close();
	}

}
