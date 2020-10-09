package LogsTextFile;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TextFileServlet")
public class TextFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TextFileServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbb");

		// request.getRequestDispatcher("index.jsp").include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
		//System.out.println("dddddddddddddddd");

		response.setContentType("text/plain");
		response.setHeader("Content-Disposition", "attachment; filename=\"Logs Details.txt\"");

		//System.out.println("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

		try {
			OutputStream outputStream = response.getOutputStream();
			//System.out.println("FFFFFFFFFFFFFFFFFF");
			// String outputResult = "This is Test";

			List<LogData> list = LogFileDAO.getAllLogs();

			for (LogData data : list) {

				String id = data.getId();
				String edited_unit = data.getEdited_unit();
				String edited_by = data.getEdited_by();
				String edit_status = data.getEdit_status();
				String edited_time = data.getEdited_time();
				String previous_data = data.getPrevious_data();
		
							
				String Id = "Id : ";
				String Edited_unit = "Edited_unit : ";
				String Edited_by = "Edited_by : ";
				String Edit_status = "Edit_status : ";
				String Edited_time = "Edited_time : ";
				String Previous_data = "Previous_data : ";
				
				String c = "\n";

				outputStream.write(Id.getBytes());
				outputStream.write(id.getBytes());
				
				outputStream.write(c.getBytes());
				
				outputStream.write(Edited_unit.getBytes());
				outputStream.write(edited_unit.getBytes());
				
				outputStream.write(c.getBytes());
				
				outputStream.write(Edited_by.getBytes());
				outputStream.write(edited_by.getBytes());

				outputStream.write(c.getBytes());

				outputStream.write(Edit_status.getBytes());
				outputStream.write(edit_status.getBytes());
				
				outputStream.write(c.getBytes());
				
				outputStream.write(Edited_time.getBytes());
				outputStream.write(edited_time.getBytes());
				
				outputStream.write(c.getBytes());
				
				outputStream.write(Previous_data.getBytes());
				outputStream.write(previous_data.getBytes());
				
				outputStream.write(c.getBytes());

				outputStream.write(c.getBytes());
				//outputStream.write(c.getBytes());
			}
			outputStream.flush();
			outputStream.close();
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
