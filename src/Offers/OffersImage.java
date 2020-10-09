package Offers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/OffersImage")
@MultipartConfig(maxFileSize = 16177215) 
public class OffersImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OffersImage() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Part filePart = request.getPart("photo");
		String exdate = request.getParameter("exdate");

		if (filePart != null) {

			System.out.println("exdate ::: " + exdate);

			OffersBean offersImage = new OffersBean();

			offersImage.setImage(filePart);
			offersImage.setExdate(exdate);

			int status = OffersDAO.saveImage(offersImage);

			if (status > 0) {

				request.setAttribute("NIsucceed", "NIsucceed");

				request.getRequestDispatcher("Offers.jsp").include(request, response);
			} else {

				request.setAttribute("NIFailed", "NIFailed");

				request.getRequestDispatcher("Offers.jsp").include(request, response);
			}
		}

	}

}
