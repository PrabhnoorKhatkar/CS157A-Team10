package ArtAuction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EditArtwork
 */
public class EditArtwork extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditArtwork() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int artworkID = Integer.parseInt(request.getParameter("artworkID"));

		ArtworkDAO searchDAO = new ArtworkDAO();

		Artwork artwork = searchDAO.getArtworkById(artworkID);
		request.setAttribute("artwork", artwork);

		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String artist = request.getParameter("artist");

		// If no changes made do nothing
		if (title.equals(artwork.getTitle()) && description.equals(artwork.getDescription()) && artist.equals(artwork.getArtist())) 
		{
			// No changes made, forward back to the same page with a message
			request.setAttribute("message", "No changes were made to the artwork.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("artwork.jsp");
			dispatcher.forward(request, response);
			return;
		}

		// Process the update
		ArtworkDAO editDAO = new ArtworkDAO();
		Artwork updateArtwork = new Artwork(artworkID, title, description, artist);
		String result = editDAO.updateArtwork(updateArtwork);

		System.out.println(result);
		if (!result.equals("Successfully Updated")) {
			request.setAttribute("message", "Failed to update artwork. Please try again.");
		}
		response.sendRedirect(request.getContextPath() + "/ArtworkPage?id="+artworkID);
	}

}
