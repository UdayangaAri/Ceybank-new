package RoomManagement;

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

@WebServlet("/Room_Status_Management")
public class Room_Status_Management extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Room_Status_Management() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter(); 
        
        HttpSession session1 = request.getSession();
          
        String sid=request.getParameter("id");  
        int id=Integer.parseInt(sid);  
            
        String RoomStatus=request.getParameter("rtype");  
        
//        Room x = RoomDao.getRoomById(sid);
//
//		String previousData = "Room Id : " + x.getId() + " , Room No : " + x.getRoomNo()
//				+ ", Room Name : " + x.getRoomName() + " , Room Type : " + x.getRoomType()
//				+ " , Block ID of Room : " + x.getBlockID();
//		String e_status = "Edited";
//		String edited_unit = "Rooms";
//		String name1 = (String) request.getSession(false).getAttribute("empno");
        
        Room e=new Room();  
        
        e.setId(id);  
        e.setRoomStatus(RoomStatus);  
//        Log log = new Log();

//		log.setPrevious_data(previousData);
//		log.setEdited_by(name1);
//		log.setEdit_status(e_status);
//		log.setEdited_unit(edited_unit);
        
          
        int status=RoomDao.updateStatus(e);  
        
        if (status > 0) {

//			int logs = LogDAO.InsertLog(log);

//			if (logs > 0) {

	            request.setAttribute("StatusSucceedMessage", "StatusSucceedMessage");
				request.getRequestDispatcher("Room_Status_Management.jsp").include(request, response); 
				
//			} else {
//				out.println("Sorry! unable to update record");
//			}

		} else {
            request.setAttribute("StatusFailedMessage", "StatusFailedMessage");
			request.getRequestDispatcher("Room_Status_Management.jsp").include(request, response); 
		}
          
        out.close(); 
	}

	
}
