package Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.CustomerDOM;

/**
 * Servlet implementation class WebappClass
 */
@WebServlet("/View/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		DaoFacade c = new DaoFacade();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pWord = request.getParameter("pWord");
		String confirm = request.getParameter("pWord-repeat");
		String address = request.getParameter("address");

		if (pWord.equals(confirm)) {
			c.create("Customer", name, email, pWord, address, "", 0.0, "", 0, "", 0, null, 0, 0, "", response);
			response.sendRedirect(request.getContextPath() + "/View/index.jsp");
		}

	}

}
