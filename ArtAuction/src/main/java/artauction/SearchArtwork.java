package artauction;

import artauction.user.UserDAO;
import artauction.image.Image;
import artauction.image.ImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
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
    	var userDAO = new UserDAO();
    	var imageDAO = new ImageDAO();
    	Image image = null;
        int userID = -1;
    	
    	int imageID = -1;
    	
    	// get logged in user id from the current session
    	if (request.getSession().getAttribute("userID") != null) {
    		userID = (int) request.getSession().getAttribute("userID");
        	
        	try {
    			imageID = userDAO.getProfilePictureID(userID);
    			//System.out.println(imageID);
    			image = imageDAO.findByID(imageID);
    			//System.out.println(image.getFilename());
    		} catch (SQLException e) {
    			// Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
       // TODO When not logged in prompt user to login to see featured artworks based on their followings.
    	
    	request.setAttribute("image", image);

		String searchText = request.getParameter("searchText");
		if (searchText == null || searchText.trim().isEmpty()) {
			searchText = ""; 
		}
        
        ArtworkDAO searchDAO = new ArtworkDAO();
        
        List<Artwork> artworkList = searchDAO.query(searchText);

        request.setAttribute("artworkList", artworkList);
        
        request.getRequestDispatcher("/homepage.jsp").forward(request, response);
    }
}
