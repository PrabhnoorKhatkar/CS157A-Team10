import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class UploadArtwork
 */
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
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String artist = request.getParameter("artist");
		String startingPriceString = request.getParameter("startingPrice");
		String reservePriceString = request.getParameter("reservePrice");
		String durationString = request.getParameter("duration");

		Integer startingPrice = Integer.parseInt(startingPriceString);
		Integer reservePrice = Integer.parseInt(reservePriceString);
		Integer duration = Integer.parseInt(durationString);
		// TODO image upload/store

		 // Validate reserve price
		 if (reservePrice < startingPrice) {
			response.getWriter().println("Reserve price cannot be smaller than starting price.");
			return;
		}

		Artwork artwork = new Artwork(title, description, artist);
		
		UploadDAO uploadDAO = new UploadDAO();
		
		String result = uploadDAO.insert(artwork);
		

		//response.getWriter().println(result);
		
		response.sendRedirect("homepage.jsp"); // redirect to home page
		
		
	
	}

}
