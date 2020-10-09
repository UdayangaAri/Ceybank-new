package RoomReservation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReservationTestServlet")
public class ReservationTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservationTestServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String guestName = request.getParameter("01");
		String guestNic = request.getParameter("02");

		String guestMeal = request.getParameter("07");
		String checkIn = request.getParameter("08");

		System.out.println("1 ::: " + guestName);
		System.out.println("2 ::: " + guestNic);

		System.out.println("7 ::: " + guestMeal);
		System.out.println("8 ::: " + checkIn);
	}

}
