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
    private void addFeaturedArtworks(HttpServletRequest request) {
        var dao = new FeaturedArtworkDAO();
        var imageDao = new ImageDAO();
        try {
            // TODO CALL getFeatuedArtworksbyFollowing
            var featuredArtworks = dao.getFeaturedArtworks(3);
            for (var featuredArtwork: featuredArtworks) {
                featuredArtwork.setImages(imageDao.findByArtwork(featuredArtwork));
            }
            request.setAttribute("featuredArtworks", featuredArtworks);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        addFeaturedArtworks(req);
        req.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        addFeaturedArtworks(req);
        req.getRequestDispatcher("/WEB-INF/homepage.jsp").forward(req, resp);
    }
}
