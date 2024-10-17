import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
        
        ResultSet resultQuery = searchDAO.query("%" + searchText + "%");
        
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
			    
			
			}
		} 
        catch (SQLException e) 
        {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        request.setAttribute("artworkList", artworkList);
        
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
        
        

	}
    
    
}
