package ArtAuction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

/**
 * Servlet implementation class EditArtwork
 */
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
        if(currentTimestamp.before(auction.getEndTimestamp()))
        {
            String result = auctionDAO.placeBid(userID, bidAmount, artworkID);
           
            if (result.equals("Bid Succesfully Placed")) 
            {

                Auction updatedAuction = auctionDAO.getAuctionByArtworkID(artworkID);
                User highestBidder = auctionDAO.getHighestBidder(artworkID);
    
                // Set updated attributes
                request.setAttribute("auction", updatedAuction);
                request.setAttribute("highestBidder", highestBidder);
            
                if (request.getSession().getAttribute("userID") == null) 
                {
                    // User is not logged in, redirect to login
                    response.sendRedirect("login.jsp");
                    return;
                }

                ArtworkPageDAO artworkPage = new ArtworkPageDAO();

                if (artworkPage.checkArtworkAccount(userID, artworkID)) {
                    request.setAttribute("isOwner", true); // userID is owner
                } else {
                    request.setAttribute("isOwner", false);
                }

                ArtworkDAO searchDAO = new ArtworkDAO();
                Artwork artwork = searchDAO.getArtworkById(artworkID);
                request.setAttribute("artwork", artwork);

                List<String> tags = searchDAO.getTagsByArtworkID(artworkID);
		        request.setAttribute("tags", tags);


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

}
