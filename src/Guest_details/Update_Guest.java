package Guest_details;

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

@WebServlet("/Update_Guest")
public class Update_Guest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Update_Guest() {
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

		String position = request.getParameter("posi");

		String Customer_Number = request.getParameter("cnumb");

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String r_country = request.getParameter("r_country");
		String citizenship = request.getParameter("citizenship");
		String nic = request.getParameter("nic");
		String mobile = request.getParameter("mobile");
		String dob = request.getParameter("dobirth");

		String email = request.getParameter("email");
		String profession = request.getParameter("profession");
		String pfnovalue = request.getParameter("options");
		String pfno = request.getParameter("pfnovalue");

		String st_nonSt = null;

		Guest x = GuestDAO.getGuestById(nic);

		String previousData = "Name : " + x.getName() + " , Address : " + x.getAddress() + ", City : "
				+ x.getCity() + " , Resident : " + x.getCountry() + " , citizenship : " + x.getCitizenship() +
				" , nic : " + x.getNic() + " , Mobile : " + x.getMobile() + " , dob : " + x.getDob()
				+ " , email : " + x.getEmail() + " , profession : " + x.getProf() + " , pf : " + x.getPfno()
				+ " , St/nonSt : " + x.getSt_nonst();
		
		String e_status = "Edited";
		
		String edited_unit = "Guest";
		
		Log log = new Log();
        log.setPrevious_data(previousData);
        log.setEdited_by(name);
        log.setEdit_status(e_status);
        log.setEdited_unit(edited_unit);
        
        //System.out.println("previous data : "+previousData);

		String bee = "success message";

		if (pfnovalue.equals("Public")) {

			st_nonSt = "Public";
			pfno = "";

			System.out.println("Data Updated Public");

		} else if (pfnovalue.equals("BOC Staff")) {

			st_nonSt = "BOC Staff";

			System.out.println("Data Updated BOC Staff");
		}

		Guest e = new Guest();

		e.setCnumber(Customer_Number);
		e.setPosition(position);

		e.setName(name);
		e.setAddress(address);
		e.setCity(city);

		e.setCountry(r_country);
		e.setCitizenship(citizenship);
		e.setNic(nic);

		e.setMobile(mobile);
		e.setDob(dob);
		e.setEmail(email);

		e.setProf(profession);
		e.setSt_nonst(st_nonSt);
		e.setPfno(pfno);

		System.out.println("Customer Number :" + Customer_Number);

		int status = GuestDAO.update(e);

		if (status > 0) {
			int logs = LogDAO.InsertLog(log);
			
			if(logs>0){  
			     
				request.setAttribute("bee", bee);

				request.getRequestDispatcher("Guest_update.jsp").forward(request, response);

				System.out.println("Data Updated");
                
            }
       	 else
            {
                out.println("Sorry! unable to update record");  
            }  

			

		} else {
			session.setAttribute("updated_Guest", null);
			out.print("<div class='alert alert-danger' role='alert'>" + "Record not saved!" + "</div>");

		}

	}

}
