package access;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Functions.FunctionDAO;
import Functions.*;



@WebServlet("/selectFunctionServlet")
public class selectFunctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public selectFunctionServlet() {
        super();
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();  
		//generate date
		
		 
		HttpSession session=request.getSession(false);
		
		RoleFunction rf = new RoleFunction();
	
		
		 String[] selectedStudentIdsID = request.getParameterValues("selected");
	
		    for (int i = 0; i < selectedStudentIdsID.length; i++) {
		    	

		    	Integer roleIDByName = (Integer) session.getAttribute("roleIDByName");
		    	//System.out.println("roleIDByName : "+roleIDByName);
		    	String s =String.valueOf(roleIDByName);
		    	
		    	
				 String name = (String) session.getAttribute("Username");
				// System.out.println(" name : "+ name);
				 
				 
				 String empno = (String) session.getAttribute("empno");
				// System.out.println(" empno  : "+ empno );
				 
				 
		  
		      String a = selectedStudentIdsID[i];
		  //    System.out.println("Page : "+a); 
		      
		      
		      rf.setFunctionID(a);
		      rf.setRoleID(s);
		      rf.setCraetedBy(empno);
		      
		    //RoleFunctionDAO.save(rf);
		      Functions ff = new Functions();
		   
		     
		      
		      int status = RoleFunctionDAO.save(rf);
		     
		      
			  
		    if(status<0){  
		    
		    	 int b= FunctionDAO.getAllFunctionIDs(ff);
	    		out.print("<div class='alert alert-success' role='alert'>" + "Sorry! unable to save record" +"</div>"); 
	    		 session.setAttribute("error", "failed Message");
	    		 
	    	}
		    else {
		    	session.setAttribute("sucess", "Success Message");
		    	request.getRequestDispatcher("Role.jsp").include(request, response); 
		    }
	    	    
	    	 
    	}  
		   
		    
		  

out.close();  


	}
}