package ArtAuction;

import jakarta.servlet.RequestDispatcher;
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
        // TODO Auto-generated constructor stub
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
		if (request.getSession().getAttribute("userID") == null) 
		{
			// User is not logged in, redirect to login
			response.sendRedirect("login.jsp");
			return;
		}

		int artworkID = Integer.parseInt(request.getParameter("artworkID"));
		int userID = (int) request.getSession().getAttribute("userID");

        ArtworkDAO searchDAO = new ArtworkDAO();
		Artwork artwork = searchDAO.getArtworkById(artworkID);
		request.setAttribute("artwork", artwork);

        AuctionDAO auctionDAO = new AuctionDAO();
		Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);

        request.setAttribute("artworkID", artworkID);
        request.setAttribute("auction", auction);
        request.setAttribute("userID", userID);

        request.getRequestDispatcher("/payment.jsp").forward(request, response);


	}

}
