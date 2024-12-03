package artauction;

import artauction.image.ImageUploader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Servlet implementation class ArtAuction.UploadArtwork
 */
@MultipartConfig
public class UploadArtwork extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadArtwork() {
        super();
        // Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userID = (int) request.getSession().getAttribute("userID");

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String tags = request.getParameter("tags");
        String artist = request.getParameter("artist");
        var image = request.getPart("image");
        String startingPriceString = request.getParameter("startingPrice");
        String reservePriceString = request.getParameter("reservePrice");
        String durationString = request.getParameter("duration");

        Integer startingPrice = Integer.parseInt(startingPriceString);
        Integer reservePrice = Integer.parseInt(reservePriceString);
        Integer duration = Integer.parseInt(durationString);
        var uploaded = ImageUploader.upload(image.getInputStream(), String.format("art-%s-%s", ImageUploader.salt(8), image.getSubmittedFileName()));

        UploadArtworkDAO uploadDAO = new UploadArtworkDAO();

        String[] tagsArray = tags.split("[,\\s]+");

        List<String> tagsList = new ArrayList<>();
        Collections.addAll(tagsList, tagsArray);

        // Validate reserve price
        if (reservePrice < startingPrice) {
            response.getWriter().println("Reserve price cannot be smaller than starting price.");
            return;
        }

        Artwork artwork = new Artwork(title, description, artist);

        Integer artworkID = uploadDAO.insert(artwork);
        uploadDAO.insertTag(artworkID, tagsList);

        if (artworkID > 0) {
            // Add to Auction Table
            AuctionDAO auctionDAO = new AuctionDAO();
            auctionDAO.insert(userID, artworkID, startingPrice, reservePrice, duration);
            String result = uploadDAO.insertArtImage(uploaded.getName(), userID, artworkID);


            response.sendRedirect("UserProfile"); // redirect to homepage
        } else {
            response.getWriter().println("Failed to upload artwork.");
        }


    }

}
