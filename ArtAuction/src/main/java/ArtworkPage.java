import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ArtworkPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int artworkID = Integer.parseInt(request.getParameter("id"));
		int userID = (int) request.getSession().getAttribute("userID");

		ArtworkPageDAO artworkPage = new ArtworkPageDAO();

		if (artworkPage.checkArtworkAccount(userID, artworkID)) {
			request.setAttribute("isOwner", true); // userID is owner
		} else {
			request.setAttribute("isOwner", false);
		}

		SearchArtworkDAO searchDAO = new SearchArtworkDAO();
		Artwork artwork = searchDAO.getArtworkById(artworkID);
		request.setAttribute("artwork", artwork);

		AuctionDAO auctionDAO = new AuctionDAO();
		Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);
		User highestBidder = auctionDAO.getHighestBidder(artworkID);
		request.setAttribute("auction", auction);
		request.setAttribute("highestBidder", highestBidder);

		int ownerUserID = artworkPage.getUserIDByArtworkID(artworkID);
		request.setAttribute("ownerUserID", ownerUserID);

		// Get the owner display name using the ArtworkPageDAO
		String ownerDisplayName = artworkPage.getUserDisplayNameByUserID(ownerUserID);
		request.setAttribute("ownerDisplayName", ownerDisplayName); // Add the owner display name to the request

		// Forward to the artwork details JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
		dispatcher.forward(request, response);

	}


}