package ArtAuction.Auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get email & password
		String email = request.getParameter("email");
		String password = Encrypt.sha256(request.getParameter("password"));
		
		// create new member object with data
		LoginDAO loginDAO = new LoginDAO();
		
		if (loginDAO.validate(email, password)) {
			int userID = loginDAO.getUserIDByEmail(email);
			
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("userID", userID);
			
			if (loginDAO.checkAdmin(userID)) {
				session.setAttribute("admin", true);
			} else { 
				session.setAttribute("admin", false);
			}
			
			response.sendRedirect(request.getContextPath() + "/"); //redirect to home page
		} else {
			request.setAttribute("errorMessage", "Invalid email or password.");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
