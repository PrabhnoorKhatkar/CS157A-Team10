package artauction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Homepage", urlPatterns = {"/Homepage"})
public class Homepage extends HttpServlet {
    private Artwork[] getFeaturedArtworks(HttpServletRequest request, int userID) {
        var dao = new FeaturedArtworkDAO();

        try {
            var featuredArtworks = dao.getFeaturedArtworksByFollowing(userID, 3);

            return featuredArtworks;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private Artwork[] getFeaturedArtworksNoUser(HttpServletRequest request) {
        var dao = new FeaturedArtworkDAO();
        try {
            var featuredArtworks = dao.getFeaturedArtworks(3);
            return featuredArtworks;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userID = -1;
        var session = req.getSession();

        int imageID = -1;
        Artwork[] featuredArtworks = new Artwork[0];
        // get logged in user id from the current session
        if (session.getAttribute("userID") != null) {
            userID = (int) session.getAttribute("userID");

            featuredArtworks = getFeaturedArtworks(req, userID);
            if (featuredArtworks.length == 0) {
                featuredArtworks = getFeaturedArtworksNoUser(req);
            }
        } else {
            featuredArtworks = getFeaturedArtworksNoUser(req);
        }
        // TODO When not logged in prompt user to login to see featured artworks based on their followings.

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
}
