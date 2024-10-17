import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SearchArtwork extends HttpServlet {

    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String searchText = request.getParameter("searchText");
        
        SearchArtworkDAO searchDAO = new SearchArtworkDAO();
        
        ResultSet resultQuery = searchDAO.query(searchText);
        
        // TODO add/update resultQuery to homepage
        List<Artwork> artworkList = new ArrayList<>();
        
        try 
        {
			while (resultQuery.next()) 
			{
			    // Retrieve data from the result set
			    String title = resultQuery.getString("title");
			    float duration = resultQuery.getFloat("auctionDuration");
			    String result = resultQuery.getString("result");
			    float reserve = resultQuery.getFloat("reserve");
			    float startingPrice = resultQuery.getFloat("startingPrice");
			    String description = resultQuery.getString("description");
			    BufferedImage image = null; // TODO: Figure out how to approach image

			    
			    Artwork artwork = new Artwork(title, duration, result, reserve, startingPrice, description, image);

			   
			    artworkList.add(artwork);
			    
			    // TODO request send to homepage.jsp
			
			}
		} 
        catch (SQLException e) 
        {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		

	}
    
    
}
