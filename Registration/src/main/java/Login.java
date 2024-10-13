
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		String password = request.getParameter("password");

		// create new member object with data
		LoginDAO loginDAO = new LoginDAO();
		
		if (loginDAO.validate(email, password)) {
			response.sendRedirect("homepage.jsp"); //redirect to home page
		} else {
			request.setAttribute("errorMessage", "Invalid email or password.");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
	    System.out.println("Login Attempt: " + email);
	}

}
