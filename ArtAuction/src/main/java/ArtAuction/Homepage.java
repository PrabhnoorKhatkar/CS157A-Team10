package ArtAuction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "homepage", urlPatterns = {"/homepage.jsp"})
public class Homepage extends HttpServlet {
    private void addFeaturedArtworks(HttpServletRequest request, int userID) {
        var dao = new FeaturedArtworkDAO();
        var imageDao = new ImageDAO();
        try {
            var featuredArtworks = dao.getFeaturedArtworksByFollowing(userID, 3);
            for (var featuredArtwork: featuredArtworks) {
            	System.out.println(featuredArtwork.getTitle());
                featuredArtwork.setImages(imageDao.findByArtwork(featuredArtwork));
            }
            request.setAttribute("featuredArtworks", featuredArtworks);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    private void addFeatureArtworksNoUser(HttpServletRequest request) {
    	var dao = new FeaturedArtworkDAO();
        var imageDao = new ImageDAO();
        try {
            var featuredArtworks = dao.getFeaturedArtworks(3);
            for (var featuredArtwork: featuredArtworks) {
            	//System.out.println(featuredArtwork.getTitle());
                featuredArtwork.setImages(imageDao.findByArtwork(featuredArtwork));
            }
            request.setAttribute("featuredArtworks", featuredArtworks);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	UserProfileDAO userDAO = new UserProfileDAO();
    	ImageDAO imageDAO = new ImageDAO();
    	Image image = null;
        int userID = -1;
    	
    	int imageID = -1;
    	// get logged in user id from the current session
    	if (req.getSession().getAttribute("userID") != null) {
    		userID = (int) req.getSession().getAttribute("userID");
        	
        	try {
    			imageID = userDAO.getProfilePictureID(userID);
    			//System.out.println(imageID);
    			image = imageDAO.findImgByID(imageID);
    			System.out.println(userID);
    			addFeaturedArtworks(req, userID);
    		} catch (SQLException e) {
    			// Auto-generated catch block
    			e.printStackTrace();
    		}
    	}
    	else if (req.getSession().getAttribute("userID") == null) {
    		//System.out.println("in else");
    		addFeatureArtworksNoUser(req);
    	}
       // TODO When not logged in prompt user to login to see featured artworks based on their followings.
    	
    	req.setAttribute("image", image);
        
        req.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userID = -1;
    	
    	// get logged in user id from the current session
    	if (req.getSession().getAttribute("userID") != null) {
    		userID = (int) req.getSession().getAttribute("userID");
        }
        // TODO When not logged in prompt user to login to see featured artworks based on their followings.


        addFeaturedArtworks(req, userID);
        req.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(req, resp);
    }
}
