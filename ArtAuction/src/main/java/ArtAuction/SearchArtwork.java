package ArtAuction;

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
    	UserProfileDAO userDAO = new UserProfileDAO();
    	ImageDAO imageDAO = new ImageDAO();
    	Image image = null;
        int userID = -1;
    	
    	int imageID = -1;
    	
    	// get logged in user id from the current session
    	if (request.getSession().getAttribute("userID") != null) {
    		userID = (int) request.getSession().getAttribute("userID");
        	
        	try {
    			imageID = userDAO.getProfilePictureID(userID);
    			//System.out.println(imageID);
    			image = imageDAO.findImgByID(imageID);
    			//System.out.println(image.getFilename());
    		} catch (SQLException e) {
    			// Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
       // TODO When not logged in prompt user to login to see featured artworks based on their followings.
    	
    	request.setAttribute("image", image);

        String searchText = request.getParameter("searchText");
        
        ArtworkDAO searchDAO = new ArtworkDAO();
        
        List<Artwork> artworkList = searchDAO.query(searchText);

        request.setAttribute("artworkList", artworkList);
        
        request.getRequestDispatcher("/homepage.jsp").forward(request, response);
    }
}
