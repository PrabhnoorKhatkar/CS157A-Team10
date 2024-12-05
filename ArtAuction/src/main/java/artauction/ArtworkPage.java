package artauction;

import artauction.user.User;
import artauction.user.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "ArtworkPage", urlPatterns = {"/App/ArtworkPage"})
public class ArtworkPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int artworkID = Integer.parseInt(request.getParameter("id"));
        Integer userID = (Integer) request.getSession().getAttribute("userID");
        var user = (User) request.getSession().getAttribute("user");

        // Check if visting user is owner
        ArtworkPageDAO artworkPage = new ArtworkPageDAO();
        request.setAttribute("isOwner", artworkPage.checkArtworkAccount(userID, artworkID)); // userID is owner

        ArtworkDAO searchDAO = new ArtworkDAO();
        Artwork artwork = searchDAO.getArtworkById(artworkID);
        request.setAttribute("artwork", artwork);

        List<String> tags = searchDAO.getTagsByArtworkID(artworkID);
        request.setAttribute("tags", tags);

        AuctionDAO auctionDAO = new AuctionDAO();
        Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);

        User highestBidder = auctionDAO.getHighestBidder(artworkID);

        // Check if current user is highest bidder
        request.setAttribute("isHighest", highestBidder != null && highestBidder.getId() == (user.getId()));

        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        // Check if auction is over and reserve not met and is ACTIVE
        // If so update to RESERVE NOT MET in DB
        if (currentTimestamp.after(auction.getEndTimestamp()) && auction.getAmount() < auction.getReserve() && auction.getResult().equals("ACTIVE")) {
            auctionDAO.reserveNotMetArtwork(artworkID);
        }
        // Check if auction is over and reserve is met
        // If so select winningUser and update to UNSOLD in DB
        else if (currentTimestamp.after(auction.getEndTimestamp()) && auction.getAmount() >= auction.getReserve() && auction.getResult().equals("ACTIVE")) {
            User winningUser = auctionDAO.getHighestBidder(artworkID);
            UserDAO userDAO = new UserDAO();
            int winningUserID = userDAO.getUserIDByDisplayName(winningUser.getDisplayName());
            auctionDAO.endArtwork(artworkID);

            request.setAttribute("winningUser", winningUserID == userID);

            highestBidder = auctionDAO.getHighestBidder(artworkID);
        }
        // Check if auction is over and reserve is met and is UNSOLD status
        // If so select winningUser and display to auction losers
        else if (currentTimestamp.after(auction.getEndTimestamp()) && auction.getAmount() >= auction.getReserve() && auction.getResult().equals("UNSOLD")) {
            User winningUser = auctionDAO.getHighestBidder(artworkID);
            UserDAO userDAO = new UserDAO();
            int winningUserID = userDAO.getUserIDByDisplayName(winningUser.getDisplayName());

            request.setAttribute("winningUser", winningUserID == userID);

            highestBidder = auctionDAO.getHighestBidder(artworkID);
        }
        auction = auctionDAO.getAuctionByArtworkID(artworkID);
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/App/artwork.jsp");
        dispatcher.forward(request, response);
    }


}
