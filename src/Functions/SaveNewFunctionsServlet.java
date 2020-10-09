package Functions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/SaveNewFunctionsServlet")
public class SaveNewFunctionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SaveNewFunctionsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	//	System.out.println("aaaaaaaaaaaaaaaaaa");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		HttpSession session = request.getSession();

		
		PrintWriter out=response.getWriter(); 
		
	 String mainName = request.getParameter("a");
		 System.out.println("Mainfunction : "+mainName);

		 String subName = request.getParameter("b");
	 System.out.println("Subfunction : "+subName);
		 
		 Functions f = new Functions();
		 f.setMainFunction(mainName);
		 f.setSubFunction(subName);
		
	 	 int status = FunctionDAO.save(f);
//		  
		    if(status<0){  
	    		
	    	System.out.println("Sorry! unable to save record");
	    	session.setAttribute("notsucess", "notsucess"); 
	    	 request.getRequestDispatcher("Role.jsp").include(request, response); 
	    	}
		    else {
		    	System.out.println("success");
		    	session.setAttribute("sucess", "sucess"); 
		    	 request.getRequestDispatcher("Role.jsp").include(request, response); 
		    }
//	 
//		   
//		   
//		  
//
out.close();  

	}

}
