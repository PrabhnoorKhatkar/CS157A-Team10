
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class SaveArtwork
 */
public class SaveArtwork extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveArtwork() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer userID = (Integer) request.getSession().getAttribute("userID");
		//response.getWriter().append("User: " + userID);

		if (userID == null || userID == -1) {
			// response.getWriter().append("User not logged in.");
			response.sendRedirect("login.jsp"); // redirect to login if not logged in
			return;
		}

		String artworkIdParam = request.getParameter("artworkID");

		if (artworkIdParam == null || artworkIdParam.isEmpty()) {
			response.getWriter().append("Invalid artwork ID.");
			return;
		}
		// response.getWriter().append("artworkID: " + artworkIdParam);

		int artworkID = Integer.parseInt(artworkIdParam);

		SaveArtworkDAO saveArtworkDAO = new SaveArtworkDAO();
		String result = saveArtworkDAO.insert(userID, artworkID);

		if (result.equals("Data Entered Successfully")) {
			// response.getWriter().append("saved");
			// response.getWriter().append("UserID: " + userID);
			// response.getWriter().append("ArtworkID: " + artworkID);
			response.sendRedirect("user-profile.jsp"); // saved then redirect to user profile
		} else {
			response.getWriter().append("Error Saving Artwork");
		}

	}

}
