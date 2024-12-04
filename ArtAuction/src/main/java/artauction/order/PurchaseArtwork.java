package artauction.order;

import artauction.Artwork;
import artauction.ArtworkDAO;
import artauction.Auction;
import artauction.AuctionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class EditArtwork
 */
public class PurchaseArtwork extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseArtwork() {
        super();
        // Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check if user is logged in
        if (request.getSession().getAttribute("userID") == null) {
            // User is not logged in, redirect to login
            response.sendRedirect("login.jsp");
            return;
        }

        int artworkID = Integer.parseInt(request.getParameter("artworkID"));
        Integer userID = (Integer) request.getSession().getAttribute("userID");

        ArtworkDAO searchDAO = new ArtworkDAO();
        Artwork artwork = searchDAO.getArtworkById(artworkID);
        request.setAttribute("artwork", artwork);

        AuctionDAO auctionDAO = new AuctionDAO();
        Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);

        request.setAttribute("artworkID", artworkID);
        request.setAttribute("auction", auction);
        request.setAttribute("userID", userID);

        float subTotal = auction.getAmount();
        float shipping = 500f;
        float fees = subTotal * 0.10f;
        float totalPrice = subTotal + shipping + fees;

        request.setAttribute("subTotal", subTotal);
        request.setAttribute("shipping", shipping);
        request.setAttribute("fees", fees);
        request.setAttribute("totalPrice", totalPrice);

        request.getRequestDispatcher("/payment.jsp").forward(request, response);


    }

}
