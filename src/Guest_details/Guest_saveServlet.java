package Guest_details;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Guest_saveServlet")
public class Guest_saveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Guest_saveServlet() {
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

		String position = request.getParameter("position");
		String cname = request.getParameter("name");
		String caddress = request.getParameter("address");
		String ccity = request.getParameter("city");
		String ccountry = request.getParameter("r_country");
		String ccitizenship = request.getParameter("citizenship");
		String cnic = request.getParameter("nic");
		String cmobile = request.getParameter("mobile");
		String cdob = request.getParameter("dob");
		String cemail = request.getParameter("email");
		String cprof = request.getParameter("profession");
		String cst_nonst = request.getParameter("options");

		String cpfno = request.getParameter("pfnovalue");
		
		Guest e = new Guest();

		if (cst_nonst.equals("Guest") && !cpfno.equals("")) {
			out.print("<div class='alert alert-danger' role='alert'>" + "Cannot save the Guest!" + "</div>");
			request.getRequestDispatcher("reservation.jsp").include(request, response);

		} else {

			e.setPosition(position);
			e.setName(cname);
			e.setAddress(caddress);
			e.setCity(ccity);
			e.setCountry(ccountry);
			e.setCitizenship(ccitizenship);
			e.setNic(cnic);
			e.setMobile(cmobile);
			e.setDob(cdob);
			e.setEmail(cemail);
			e.setProf(cprof);
			e.setSt_nonst(cst_nonst);
			e.setPfno(cpfno);
			
			int status = GuestDAO.save(e);

			if (status > 0) {
				
				out.print("<div class='alert alert-success' role='alert'>" + "Record saved successfully!" + "</div>");
				request.getRequestDispatcher("reservation.jsp").include(request, response);
			} else {
				System.out.println("failed");
				out.println("Sorry! unable to save record");
			}

		}

		out.close();
	}

}
