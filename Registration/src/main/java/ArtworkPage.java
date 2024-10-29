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
        String artworkId = request.getParameter("artworkId");
      
        SearchArtworkDAO searchDAO = new SearchArtworkDAO();
        Artwork artwork = searchDAO.getArtworkById(artworkId); 
        
        request.setAttribute("artwork", artwork);
        
        // Forward to the artwork details JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
        dispatcher.forward(request, response);
    }
}