package ArtAuction;

import jakarta.servlet.ServletException;
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
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer userID = (Integer) request.getSession().getAttribute("userID");
		String artworkIdParam = request.getParameter("artworkID");
		SaveArtworkDAO saveArtworkDAO = new SaveArtworkDAO();
		String action = request.getParameter("action");

		if (userID == null || userID == -1) {
			// User not logged in
			response.sendRedirect("login.jsp");
			return;
		}

		if (artworkIdParam == null || artworkIdParam.isEmpty()) {
			response.getWriter().append("Invalid artwork ID.");
			return;
		}

		Integer artworkID = Integer.parseInt(artworkIdParam);

		if (action.equals("save")) {
			saveArtworkDAO.favoriteArtwork(userID, artworkID);
		} else if (action.equals("unsave")) {
			saveArtworkDAO.removeSave(userID, artworkID);
		}
		
		
		
		response.sendRedirect(request.getContextPath() + "/ArtworkPage?id=" + artworkID);
	}

}
