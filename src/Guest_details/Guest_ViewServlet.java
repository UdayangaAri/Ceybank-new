package Guest_details;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Guest_ViewServlet")
public class Guest_ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Guest_ViewServlet() {
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

		String sid = request.getParameter("search");

		//System.out.println("sid 1 : "+sid);
		
		Guest e = GuestDAO.getGuestById(sid);
		
		//System.out.println("sid 2 : "+sid);

		String cno = sid;

		String x = "this is wrong";

		String SID = e.getSID();

		if (cno == null) {
			request.setAttribute("wrong", x);
			request.getRequestDispatcher("reservation.jsp").forward(request, response);
			System.out.println("Data not Retrieved");

		} else if (SID == sid) {

			String name = e.getName();
			String pos = e.getPosition();

			String city = e.getCity();
			String country = e.getCountry();
			String citizenship = e.getCitizenship();
			String dob = e.getDob();
			String profession = e.getProf();

			String nic = e.getNic();
			String email = e.getEmail();
			String mobile = e.getMobile();
			String st_nonst = e.getSt_nonst();
			String pfno = e.getPfno();
			String add = e.getAddress();
			
			String xString = sid;

			e.setCnumber(xString);

			e.setSt_nonst(st_nonst);

			e.setName(name);
			e.setPosition(pos);
			e.setCity(city);
			e.setCountry(country);
			e.setCitizenship(citizenship);
			e.setDob(dob);
			e.setProf(profession);
			e.setNic(nic);
			e.setEmail(email);
			e.setMobile(mobile);
			e.setPfno(pfno);
			e.setAddress(add);

			request.setAttribute("name", name);
			request.setAttribute("Pos", pos);
			request.setAttribute("nic", nic);
			request.setAttribute("email", email);
			request.setAttribute("mobile", mobile);
			request.setAttribute("pfno", pfno);

			request.setAttribute("thesid", sid);
			request.setAttribute("sid_guest", sid);
			
			request.setAttribute("st_nonst", st_nonst);
			
			session.setAttribute("xString", xString);

			request.getRequestDispatcher("reservation.jsp").forward(request, response);

			System.out.println("Data Retrieved");

		} else {
			request.setAttribute("wrong", x);
			request.getRequestDispatcher("reservation.jsp").forward(request, response);
			System.out.println("Data not Retrieved");
		}
		out.close();
	}

}
