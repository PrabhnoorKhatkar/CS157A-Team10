import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class SearchArtwork extends HttpServlet {

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String searchText = request.getParameter("searchQuery");
        
        SearchArtworkDAO searchDAO = new SearchArtworkDAO();
        
        ResultSet resultQuery = searchDAO.query(searchText);
        
        // TODO add/update resultQuery to homepage
        
		

	}
    
    
}
