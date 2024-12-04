package artauction;

import artauction.user.UserDAO;
import artauction.image.Image;
import artauction.image.ImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "homepage", urlPatterns = {"/homepage.jsp"})
public class Homepage extends HttpServlet {
    private Artwork[] getFeaturedArtworks(HttpServletRequest request, int userID) {
        var dao = new FeaturedArtworkDAO();
        var imageDao = new ImageDAO();
        try {
            var featuredArtworks = dao.getFeaturedArtworksByFollowing(userID, 3);
            for (var featuredArtwork : featuredArtworks) {
                featuredArtwork.setImages(imageDao.findByArtwork(featuredArtwork));
            }
            return featuredArtworks;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private Artwork[] getFeaturedArtworksNoUser(HttpServletRequest request) {
        var dao = new FeaturedArtworkDAO();
        var imageDao = new ImageDAO();
        try {
            var featuredArtworks = dao.getFeaturedArtworks(3);
            for (var featuredArtwork : featuredArtworks) {
                featuredArtwork.setImages(imageDao.findByArtwork(featuredArtwork));
            }
            return featuredArtworks;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        ImageDAO imageDAO = new ImageDAO();
        Image image = null;
        int userID = -1;
        var session = req.getSession();

        int imageID = -1;
        Artwork[] featuredArtworks = new Artwork[0];
        // get logged in user id from the current session
        if (session.getAttribute("userID") != null) {
            userID = (int) session.getAttribute("userID");

            try {
                imageID = userDAO.getProfilePictureID(userID);
                //System.out.println(imageID);
                image = imageDAO.findByID(imageID);
                featuredArtworks = getFeaturedArtworks(req, userID);
                if (featuredArtworks.length == 0) {
                    featuredArtworks = getFeaturedArtworksNoUser(req);
                }
            } catch (SQLException e) {
                // Auto-generated catch block
                e.printStackTrace();
            }
        } else {
            featuredArtworks = getFeaturedArtworksNoUser(req);
        }
        // TODO When not logged in prompt user to login to see featured artworks based on their followings.

        req.setAttribute("image", image);
//        for (var featuredArtwork : featuredArtworks) {
//            System.err.println(featuredArtwork.getTitle());
//            for (var img : featuredArtwork.getImages()) {
//                System.err.println(img.getImageId());
//                System.err.println(img.getFilename());
//            }
//        }

        String searchText = req.getParameter("searchText");
		if (searchText == null || searchText.trim().isEmpty()) {
			searchText = ""; 
		}
        
        ArtworkDAO searchDAO = new ArtworkDAO();
        
        List<Artwork> artworkList = searchDAO.query(searchText);

        req.setAttribute("artworkList", artworkList);

        req.setAttribute("featuredArtworks", featuredArtworks);
        req.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userID = -1;

        // get logged in user id from the current session
        if (req.getSession().getAttribute("userID") != null) {
            userID = (int) req.getSession().getAttribute("userID");
        }
        // TODO When not logged in prompt user to login to see featured artworks based on their followings.
        doGet(req, resp);
    }
}
