package RoomRates;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RoomRates_Edidt_Servlet")
public class RoomRates_Edidt_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RoomRates_Edidt_Servlet() {
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

		doGet(request, response);
		HttpSession session = request.getSession();

		String SessionBranch = (String) session.getAttribute("EditBranch");
		String SessionBlock = (String) session.getAttribute("EditBlock");
		String SessionRoomType = (String) session.getAttribute("Editroom_type");
		String SessionMealPlan = (String) session.getAttribute("EditMeal");

		String Nrate = request.getParameter("Rate");
		String Hrate = request.getParameter("HoliRate");

		String discount_percentage = request.getParameter("Percentagee");
		String discount_amount = request.getParameter("Amountt");
		String options = request.getParameter("options");
		String Activestatus = "Active";
		
		String id_value = request.getParameter("id_value");
		
		
		RoomRates rr = new RoomRates();

		int idd = RoomRatesDAO.updateRoomRates(id_value);
		
		System.out.println("id update ::: "+idd);
		
		rr.setBranch(SessionBranch);
		rr.setBlock(SessionBlock);
		rr.setRoomtype(SessionRoomType);
		rr.setMealplan(SessionMealPlan);
		rr.setBrate(Nrate);
		rr.setDicount_type(options);
		rr.setHrate(Hrate);

		if (options.equals("Percentage")) {

			rr.setDiscout(discount_percentage);

		}

		if (options.equals("Amount")) {

			rr.setDiscout(discount_amount);

		}

		rr.setStatus(Activestatus);

		int check = RoomRatesDAO.checkValues(SessionBranch, SessionBlock, SessionRoomType, SessionMealPlan,
				Activestatus);
		// System.out.println("check value : "+check);
		if (check > 0) {

			request.setAttribute("RRESucceed", "RRESucceed");
			request.getRequestDispatcher("RoomRates_View.jsp").include(request, response);
		} else if (check == 0) {

			int status = RoomRatesDAO.saveRatesMnagement(rr);

			if (status > 0) {

				request.setAttribute("RRESucceed", "RRESucceed");
				request.getRequestDispatcher("RoomRates_View.jsp").include(request, response);
			}

			else {

				request.setAttribute("RREFailed", "RREFailed");
				request.getRequestDispatcher("RoomRates_View.jsp").include(request, response);

			}

		}

		out.close();

	}
}
