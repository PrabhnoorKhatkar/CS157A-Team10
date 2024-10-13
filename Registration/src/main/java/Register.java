
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
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
		String name = request.getParameter("name");
		String displayName = request.getParameter("displayName");
		String password = request.getParameter("password");
		String emailAddress = request.getParameter("emailAddress");
		String address = request.getParameter("address");
		String anonymousParam = request.getParameter("anonymous");
		Boolean anonymous = Boolean.parseBoolean(anonymousParam);
		User user = new User(name, displayName, password, emailAddress, address, anonymous);
		RegisterDao rdao = new RegisterDao();
		String result = rdao.insert(user);
		response.getWriter().println(result);

	}

}
