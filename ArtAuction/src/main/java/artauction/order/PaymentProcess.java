package artauction.order;

import artauction.Artwork;
import artauction.ArtworkDAO;
import artauction.AuctionDAO;
import artauction.user.User;
import artauction.user.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class EditArtwork
 */
@WebServlet(name = "PaymentProcess", urlPatterns = {"/App/PaymentProcess"})
public class PaymentProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentProcess() {
        super();
        // Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userID = (int) request.getSession().getAttribute("userID");
        UserDAO currUser = new UserDAO();
        User curr = currUser.getFullUserById(userID);

        String name = curr.getName();
        float totalPaid = Float.parseFloat(request.getParameter("totalPrice"));
        String email = request.getParameter("email");
        int artworkID = Integer.parseInt(request.getParameter("artworkID"));

        // address
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        OrderDAO orderDAO = new OrderDAO();
        OrderDetails orderDetails = orderDAO.processOrder(userID, artworkID, totalPaid);

        if (orderDetails != null) {
            AuctionDAO auctionDAO = new AuctionDAO();
            auctionDAO.sellArtwork(artworkID);
        }

        ArtworkDAO searchDAO = new ArtworkDAO();
        Artwork artwork = searchDAO.getArtworkById(artworkID);
        request.setAttribute("artwork", artwork);

        request.setAttribute("name", name);
        request.setAttribute("totalPaid", totalPaid);
        request.setAttribute("email", email);
        request.setAttribute("address1", address1);
        request.setAttribute("address2", address2);
        request.setAttribute("city", city);
        request.setAttribute("state", state);
        request.setAttribute("orderDetails", orderDetails);


        // Forward to the artwork details JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/App/order-confirmation.jsp");
        dispatcher.forward(request, response);


    }

}
