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
		String startingPriceString = request.getParameter("startingPrice");
		String reservePriceString = request.getParameter("reservePrice");
		String durationString = request.getParameter("duration");
		// TODO image upload/store
		// TODO Reserve price cant be smaller than starting price
		
		Integer startingPrice = Integer.parseInt(startingPriceString);
		Integer reservePrice = Integer.parseInt(reservePriceString);
		Integer duration = Integer.parseInt(durationString);
		
		//Artwork artwork = new Artwork(description, title);
	
		

//		response.getWriter().println(result);
		
		response.sendRedirect("homepage.jsp"); // redirect to home page
		
		
	
	}

}
