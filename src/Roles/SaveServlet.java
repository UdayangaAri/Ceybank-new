package Roles;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SaveServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 response.setContentType("text/html");  
	        PrintWriter out=response.getWriter();  
	        
		  String role=request.getParameter("name");  
	        String roledes=request.getParameter("desc");  
	       
	        Role e=new Role();  
	        
	        e.setRole(role);
	        e.setRoleDesc(roledes);
	       
	        int status=RoleDao.save(e);  
	        if(status>0){  
	        	request.setAttribute("Rsucceed", "Rsucceed");
	            request.getRequestDispatcher("R_View.jsp").include(request, response);  
	        }else{  
	        	request.setAttribute("Rfailed", "Rfailed");
	            request.getRequestDispatcher("R_View.jsp").include(request, response);  
	        }  
	          
	        out.close();  
	      
	}

}
