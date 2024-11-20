package ArtAuction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

public class ArtworkPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Update result on page for non winning users
		// For winning user provide place to order the artwork
		
		// Check if user is logged in
		if (request.getSession().getAttribute("userID") == null) 
		{
			// User is not logged in, redirect to login
			response.sendRedirect("login.jsp");
			return;
		}

		int artworkID = Integer.parseInt(request.getParameter("id"));
		int userID = (int) request.getSession().getAttribute("userID");

		ArtworkPageDAO artworkPage = new ArtworkPageDAO();

		// Check if visting user is owner
		if (artworkPage.checkArtworkAccount(userID, artworkID)) {
			request.setAttribute("isOwner", true); // userID is owner
		} else {
			request.setAttribute("isOwner", false);
		}

		SearchArtworkDAO searchDAO = new SearchArtworkDAO();
		Artwork artwork = searchDAO.getArtworkById(artworkID);
		request.setAttribute("artwork", artwork);

		List<String> tags = searchDAO.getTagsByArtworkID(artworkID);
		request.setAttribute("tags", tags);

		AuctionDAO auctionDAO = new AuctionDAO();
		Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);


		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		// Check if auction is over and reserve not met
		// If so update to UNSOLD in DB
		if(currentTimestamp.after(auction.getEndTimestamp()) && auction.getAmount() < auction.getReserve())
		{
			auctionDAO.endArtwork(artworkID);
			auction = auctionDAO.getAuctionByArtworkID(artworkID);
			User highestBidder = auctionDAO.getHighestBidder(artworkID);
			request.setAttribute("auction", auction);
			request.setAttribute("highestBidder", highestBidder);
	
			int ownerUserID = artworkPage.getUserIDByArtworkID(artworkID);
			request.setAttribute("ownerUserID", ownerUserID);
	
			// Get the owner display name using the ArtworkPageDAO
			String ownerDisplayName = artworkPage.getUserDisplayNameByUserID(ownerUserID);
			request.setAttribute("ownerDisplayName", ownerDisplayName); // Add the owner display name to the request
			
			SaveArtworkDAO saveArtworkDAO = new SaveArtworkDAO();
			boolean checkSave = saveArtworkDAO.checkSave(userID, artworkID);
			request.setAttribute("checkSave", checkSave);
			
			// Forward to the artwork details JSP page
			RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
			dispatcher.forward(request, response);

		}
		// Check if auction is over and reserve is met
		// If so select winningUser and update to UNSOLD in DB
		else if(currentTimestamp.after(auction.getEndTimestamp()) && auction.getAmount() >= auction.getReserve())
		{
			User winningUser = auctionDAO.getHighestBidder(artworkID);
			UserProfileDAO userDAO = new UserProfileDAO();
			int winningUserID = userDAO.getUserIDByDisplayName(winningUser.getDisplayName());
			auctionDAO.endArtwork(artworkID);
			auction = auctionDAO.getAuctionByArtworkID(artworkID);

			if(winningUserID == userID)
			{
				request.setAttribute("winningUser", true);
				request.setAttribute("userID", userID);
			}
			else
			{
				request.setAttribute("winningUser", false);
			}

			User highestBidder = auctionDAO.getHighestBidder(artworkID);
			request.setAttribute("auction", auction);
			request.setAttribute("highestBidder", highestBidder);

			int ownerUserID = artworkPage.getUserIDByArtworkID(artworkID);
			request.setAttribute("ownerUserID", ownerUserID);

			// Get the owner display name using the ArtworkPageDAO
			String ownerDisplayName = artworkPage.getUserDisplayNameByUserID(ownerUserID);
			request.setAttribute("ownerDisplayName", ownerDisplayName); // Add the owner display name to the request
			
			SaveArtworkDAO saveArtworkDAO = new SaveArtworkDAO();
			boolean checkSave = saveArtworkDAO.checkSave(userID, artworkID);
			request.setAttribute("checkSave", checkSave);
			
			// Forward to the artwork details JSP page
			RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
			dispatcher.forward(request, response);
		}
		else
		{

			User highestBidder = auctionDAO.getHighestBidder(artworkID);
			request.setAttribute("auction", auction);
			request.setAttribute("highestBidder", highestBidder);

			int ownerUserID = artworkPage.getUserIDByArtworkID(artworkID);
			request.setAttribute("ownerUserID", ownerUserID);

			// Get the owner display name using the ArtworkPageDAO
			String ownerDisplayName = artworkPage.getUserDisplayNameByUserID(ownerUserID);
			request.setAttribute("ownerDisplayName", ownerDisplayName); // Add the owner display name to the request
			
			SaveArtworkDAO saveArtworkDAO = new SaveArtworkDAO();
			boolean checkSave = saveArtworkDAO.checkSave(userID, artworkID);
			request.setAttribute("checkSave", checkSave);
			
			// Forward to the artwork details JSP page
			RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
			dispatcher.forward(request, response);

		}

		

	}


}