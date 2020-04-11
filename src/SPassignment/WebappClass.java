package SPassignment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WebappClass
 */
@WebServlet("/WebappClass")
public class WebappClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SQLConnection sql = new SQLConnection();
	


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WebappClass() {
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

		
		 boolean signin =
		 sql.signIn(request.getParameter("email"),request.getParameter("password") );
		  
		 if(signin == true) { 
			 HttpSession session = request.getSession();
			 session.setAttribute("email", request.getParameter("email"));
			 
			 
//			 PrintWriter writer = response.getWriter();
//		        writer.println("Session ID: " + session.getId());
//		        writer.println("Creation Time: " + session.getAttribute("email"));
			
			  response.sendRedirect(request.getContextPath() + "/report.jsp");
			 
			 }
		 

	}

}
