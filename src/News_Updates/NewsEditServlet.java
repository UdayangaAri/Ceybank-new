package News_Updates;

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
import RoomManagement.Room;
import RoomManagement.RoomDao;


@WebServlet("/NewsEditServlet")
public class NewsEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NewsEditServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		String sid = (String) session.getAttribute("newsID");
		
		int id = Integer.parseInt(sid);

		//System.out.println("id ::: " + id);

		String NewsTitle = request.getParameter("NewsTitleEdit");
		String NewsDes = request.getParameter("NewsDescriptionEdit");

		NewsBean x = NewsDAO.getNewsById(sid);

		String previousData = "News Title : " + x.getTitle() + " , News Description : " + x.getDescription() + " , ID of News : " + x.getId();
		String e_status = "Edited";
		String edited_unit = "News_Updates";
		String name1 = (String) request.getSession(false).getAttribute("empno");

		NewsBean e = new NewsBean();

		e.setId(id);
		e.setTitle(NewsTitle);
		e.setDescription(NewsDes);

		Log log = new Log();

		log.setPrevious_data(previousData);
		log.setEdited_by(name1);
		log.setEdit_status(e_status);
		log.setEdited_unit(edited_unit);

		int status = NewsDAO.update(e);

		if (status > 0) {

			int logs = LogDAO.InsertLog(log);

			if (logs > 0) {

				request.setAttribute("News_E_succeed", "News_E_succeed");
				request.getRequestDispatcher("News_view.jsp").include(request, response);
				

			} else {
				
				request.setAttribute("News_E_failed", "News_E_failed");
				request.getRequestDispatcher("News_view.jsp").include(request, response);
				
			}

		} else {
			
			request.setAttribute("News_E_failed", "News_E_failed");
			request.getRequestDispatcher("News_view.jsp").include(request, response);
			
		}

		out.close();
	}

}
