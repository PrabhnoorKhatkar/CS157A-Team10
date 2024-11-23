package ArtAuction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

/**
 * Servlet implementation class EditArtwork
 */
public class PaymentProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Check if user is logged in
		if (request.getSession().getAttribute("userID") == null) 
		{
			// User is not logged in, redirect to login
			response.sendRedirect("login.jsp");
			return;
		}

		int userID = (int) request.getSession().getAttribute("userID");


		

		UserProfileDAO currUser = new UserProfileDAO();
		User curr = currUser.getUserById(userID);

		String name = curr.getName();
		float totalPaid = Float.parseFloat(request.getParameter("totalPrice"));
		String email = request.getParameter("email");
		int artworkID = Integer.parseInt(request.getParameter("artworkID"));

		OrderDAO orderDAO = new OrderDAO();
		orderDAO.processOrder(userID, artworkID, totalPaid);

		ArtworkDAO searchDAO = new ArtworkDAO();
		Artwork artwork = searchDAO.getArtworkById(artworkID);
		request.setAttribute("artwork", artwork);

		request.setAttribute("name", name);
		request.setAttribute("totalPaid", totalPaid);
		request.setAttribute("email", email);

		

		// Forward to the artwork details JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("order-confirmation.jsp");
		dispatcher.forward(request, response);
		

		


	}

}
