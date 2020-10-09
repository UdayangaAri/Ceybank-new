package Roles;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Log.Log;
import Log.LogDAO;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 PrintWriter out=response.getWriter();  
		 
		String sid=request.getParameter("id");  
        int id=Integer.parseInt(sid);  
        
        Role x = RoleDao.getRoleById(sid);
        
        String name = (String) request.getSession(false).getAttribute("empno");
        String e_status = "Deleted";
        String edited_unit = "Roles";
        
        String previousData = "Role Id : "+x.getId() +" , Role : "+x.getRole() +", Role Description : "+ x.getRoleDesc();
        
        Log log = new Log();
        
        System.out.println("previousData : "+previousData);
        System.out.println("name : "+name);
        
        log.setPrevious_data(previousData);
        log.setEdit_status(e_status);
        log.setEdited_by(name);
        log.setEdited_unit(edited_unit);
        
		int st = RoleDao.delete(id);  
        
        if(st>0){  
        	int logs = LogDAO.InsertLog(log);
        
        
        if(logs>0){  
            
        	request.setAttribute("RDsucceed", "RDsucceed");
			request.getRequestDispatcher("R_View.jsp").include(request, response);  
        	 
        }
        }
   	 	else
        {
   	 	request.setAttribute("RDfailed", "RDfailed");
		request.getRequestDispatcher("R_View.jsp").include(request, response);  
        }  
   	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
