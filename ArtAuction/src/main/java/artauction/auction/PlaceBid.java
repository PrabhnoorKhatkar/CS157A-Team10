package artauction.auction;

import artauction.*;
import artauction.auth.Login;
import artauction.user.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Servlet implementation class EditArtwork
 */
@WebServlet(name = "PlaceBid", urlPatterns={"/App/PlaceBid"})
public class PlaceBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceBid() {
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

		int artworkID = Integer.parseInt(request.getParameter("artworkID"));
        int userID = (int) request.getSession().getAttribute("userID");


        String bidAmountString = request.getParameter("bidAmount");
        Float bidAmount = Float.parseFloat(bidAmountString);

		AuctionDAO auctionDAO = new AuctionDAO();
		Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        if(currentTimestamp.before(auction.getEndTimestamp())) {
            String result = auctionDAO.placeBid(userID, bidAmount, artworkID);
        }
		var originalArtworkUrl = String.format("%s?%s", request.getRequestURI(), request.getQueryString());
		response.sendRedirect(request.getContextPath() + "/App/ArtworkPage?id=" + artworkID);
	}

}
