import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ArtworkPage extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        int artworkID = Integer.parseInt(request.getParameter("id"));
      
        SearchArtworkDAO searchDAO = new SearchArtworkDAO();
        Artwork artwork = searchDAO.getArtworkById(artworkID); 
        request.setAttribute("artwork", artwork);

        AuctionDAO auctionDAO = new AuctionDAO();
        Auction auction = auctionDAO.getAuctionByArtworkID(artworkID);
        request.setAttribute("auction", auction);

        
        // Forward to the artwork details JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
        dispatcher.forward(request, response);
    }
}