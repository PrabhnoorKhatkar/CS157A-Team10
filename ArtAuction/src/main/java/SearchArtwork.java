import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class SearchArtwork extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    
	public SearchArtwork() {
		super();
	}



	/**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String searchText = request.getParameter("searchText");
        
        SearchArtworkDAO searchDAO = new SearchArtworkDAO();
        
        List<Artwork> artworkList = searchDAO.query(searchText);

        request.setAttribute("artworkList", artworkList);
        
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
        
    }
    
    
}
