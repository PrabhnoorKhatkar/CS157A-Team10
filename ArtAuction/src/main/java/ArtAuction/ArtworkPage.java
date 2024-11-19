package ArtAuction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;

public class ArtworkPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO check if artwork auction is over 
		// Update result on page for non winning users
		// For winning user provide place to order the artwork

		int artworkID = Integer.parseInt(request.getParameter("id"));
		
		if (request.getSession().getAttribute("userID") == null) 
		{
			// User is not logged in, redirect to login
			response.sendRedirect("login.jsp");
			return;
		}
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

		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		if(auction.getEndTimestamp().after(currentTimestamp))
		{
			// TODO update status to UNSOLD
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
		System.out.println("check check : " + checkSave);
		
		// Forward to the artwork details JSP page
		RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
		dispatcher.forward(request, response);

	}


}