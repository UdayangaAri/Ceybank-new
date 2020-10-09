package block_Register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Log.Log;
import Log.LogDAO;
import RoomTypeMaster.Room_type;
import RoomTypeMaster.roomTypeDAO;

@WebServlet("/Block_editServlet")
public class Block_editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Block_editServlet() {
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

		String id = request.getParameter("blockID");
		int sid = Integer.parseInt(id);

		block x = blockDAO.getBlockById(id);

		String previousData = "Block Type Id : " + x.getId() + " , Block Type Location : " + x.getLocation()
				+ " , Block Type Name : " + x.getBlock_name() + " , Block Type Status : " + x.getBlock_status();
		String e_status = "Edited";
		String edited_unit = "Block Types";
		String name = (String) request.getSession(false).getAttribute("empno");

		String block_l = request.getParameter("block_l");
		String block_n = request.getParameter("block_n");
		String block_s = request.getParameter("Block_s");

		Branches.Branch b = blockDAO.getBranchesById(block_l);

		if (block_l.equals(b.getDisplayName())) {

			int branch_id = b.getId();

			block e = new block();

			e.setId(sid);
			e.setLocation(branch_id);
			e.setBlock_name(block_n);
			e.setBlock_status(block_s);

			Log log = new Log();

			log.setPrevious_data(previousData);
			log.setEdited_by(name);
			log.setEdit_status(e_status);
			log.setEdited_unit(edited_unit);

			int status = blockDAO.update(e);
			if (status > 0) {

				int logs = LogDAO.InsertLog(log);

				if (logs > 0) {

					request.setAttribute("Brsucceed", "Brsucceed");

					request.getRequestDispatcher("block_view.jsp").include(request, response);

				} else {

					request.setAttribute("BrFailed", "BrFailed");

					request.getRequestDispatcher("block_view.jsp").include(request, response);
				}

			} else {
				request.setAttribute("BrFailed", "BrFailed");

				request.getRequestDispatcher("block_view.jsp").include(request, response);
			}

		}

		out.close();
	}

}
