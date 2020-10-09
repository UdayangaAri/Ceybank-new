package RoomReservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReservationSaveServlet")
public class ReservationSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationSaveServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		//////////////////////////////////////////////////////////////////////
		
		String checkinNxt = request.getParameter("checkinNxt");
		String checkoutNxt = request.getParameter("checkoutNxt");
		
		String branch = (String) session.getAttribute("branch");
		String BlockNxt = request.getParameter("BlockNxt");
		String room_in_r = request.getParameter("room_in_r");
		String MealTypeNxt = request.getParameter("MealTypeNxt");
		
		String Room_Price_tot = request.getParameter("Room_Price_tot");
		
		String nameres = request.getParameter("nameres");
		String nicres = request.getParameter("nicres");
		String mobileres = request.getParameter("mobileres");
		String emailres = request.getParameter("emailres");
		
		String GuestType = request.getParameter("options");
		String pfnovalue = request.getParameter("pfnovalue");
		
		System.out.println("BlockNxt ::: "+BlockNxt);
		System.out.println("room_in_r ::: "+room_in_r);
		
		//////////////////////////////////////////////////////////////////////
		
		Rooms rooms = new Rooms();
		
		rooms.setCheckin(checkinNxt);
		rooms.setCheckout(checkoutNxt);
		
		rooms.setBranch(branch);
		rooms.setBlock(BlockNxt);
		rooms.setRoomNo(room_in_r);
		rooms.setMealPlan(MealTypeNxt);
		
		rooms.setPrice(Room_Price_tot);
		
		rooms.setGuestname(nameres);
		rooms.setGuestNIC(nicres);
		rooms.setGuestMobile(mobileres);
		rooms.setGuestEmail(emailres);
		
		rooms.setGuestType(GuestType);
		rooms.setPF(pfnovalue);
		
		int status = RoomDAO.save(rooms);
		
		if (status > 0) {
			
			session.setAttribute("Reservation_Succeed", "Reservation_Succeed");
			request.getRequestDispatcher("reservation.jsp").include(request, response);
		} else {
			session.setAttribute("Reservation_Failed", "Reservation_Failed");
		}

		out.close();

	}

}
