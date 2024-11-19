package ArtAuction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
		int userID = (int) request.getSession().getAttribute("userID");

		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String artist = request.getParameter("artist");
		var image = request.getPart("image");
		String startingPriceString = request.getParameter("startingPrice");
		String reservePriceString = request.getParameter("reservePrice");
		String durationString = request.getParameter("duration");
		
		Integer startingPrice = Integer.parseInt(startingPriceString);
		Integer reservePrice = Integer.parseInt(reservePriceString);
		Integer duration = Integer.parseInt(durationString);
		var uploaded = ImageUploader.upload(image.getInputStream(), String.format("art-%s-%s", ImageUploader.salt(8), image.getSubmittedFileName()));

		 // Validate reserve price
		 if (reservePrice < startingPrice) {
			response.getWriter().println("Reserve price cannot be smaller than starting price.");
			return;
		}

		Artwork artwork = new Artwork(title, description, artist);
		
		UploadArtworkDAO uploadDAO = new UploadArtworkDAO();
		Integer artworkID = uploadDAO.insert(artwork);

		if (artworkID > 0) {
			// Add to Auction Table
			AuctionDAO auctionDAO = new AuctionDAO();
			auctionDAO.insert(userID, artworkID, startingPrice, reservePrice, duration);
			String result = uploadDAO.insertArtImage(uploaded.getName(), userID, artworkID);

		
			response.sendRedirect("homepage.jsp"); // redirect to homepage
		} else {
			response.getWriter().println("Failed to upload artwork.");
		}
		
	
	}

}
