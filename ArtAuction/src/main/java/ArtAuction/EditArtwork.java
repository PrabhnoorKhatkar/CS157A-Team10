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
public class EditArtwork extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditArtwork() {
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

		int artworkID = Integer.parseInt(request.getParameter("artworkID"));

		SearchArtworkDAO searchDAO = new SearchArtworkDAO();

		Artwork artwork = searchDAO.getArtworkById(artworkID);

		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String artist = request.getParameter("artist");

		// If no changes made do nothing
		if (title.equals(artwork.getTitle()) && description.equals(artwork.getDescription()) && artist.equals(artwork.getArtist())) 
		{
			// No changes made, forward back to the same page with a message
			request.setAttribute("message", "No changes were made to the artwork.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
			dispatcher.forward(request, response);
			return;
		}

		// Process the update
		EditArtworkDAO editDAO = new EditArtworkDAO();
		Artwork updateArtwork = new Artwork(artworkID, title, description, artist);
		String result = editDAO.updateArtwork(updateArtwork);

		if (result.equals("Successfully Added"))
		{

			int userID = (int) request.getSession().getAttribute("userID");

			ArtworkPageDAO artworkPage = new ArtworkPageDAO();

			if (artworkPage.checkArtworkAccount(userID, artworkID)) 
			{
				request.setAttribute("isOwner", true); // userID is owner
			} 
			else 
			{
				request.setAttribute("isOwner", false);
			}

			Artwork updatedArtwork = searchDAO.getArtworkById(artworkID);
			request.setAttribute("artwork", updatedArtwork);

			AuctionDAO auctionDAO = new AuctionDAO();
			Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);
			request.setAttribute("auction", auction);

			int ownerUserID = artworkPage.getUserIDByArtworkID(artworkID);
			request.setAttribute("ownerUserID", ownerUserID);

			// Get the owner display name using the ArtworkPageDAO
			String ownerDisplayName = artworkPage.getUserDisplayNameByUserID(ownerUserID);
			request.setAttribute("ownerDisplayName", ownerDisplayName); // Add the owner display name to the request

			// Forward to the artwork details JSP page	
			RequestDispatcher dispatcher = request.getRequestDispatcher("ArtworkPage?id=" + artworkID);
			dispatcher.forward(request, response);
			
			
		} 
		else 
		{
			request.setAttribute("message", "Failed to update artwork. Please try again.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
			dispatcher.forward(request, response);
		}

	}

}
