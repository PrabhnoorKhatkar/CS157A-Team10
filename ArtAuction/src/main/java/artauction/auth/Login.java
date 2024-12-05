package artauction.auth;

import artauction.user.Admin;
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
    public static final String PAGE = "login.jsp";
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
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // get email & password
        String email = request.getParameter("email");
        String password = Hash.sha256(request.getParameter("password"));
        String fromURL = request.getParameter("from");

        // create new member object with data
        AuthDAO authDAO = new AuthDAO();
        var user = authDAO.findUserByLogin(email, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userID", user.getId());
            session.setAttribute("user", user);
            session.setAttribute("admin", user instanceof Admin);

            if (fromURL == null || fromURL.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/"); //redirect to home page
                return;
            }
            response.sendRedirect(fromURL);
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher(PAGE).forward(request, response);
        }
    }
}
