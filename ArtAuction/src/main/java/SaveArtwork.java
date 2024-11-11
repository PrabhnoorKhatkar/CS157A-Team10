

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userID = (int) request.getSession().getAttribute("userID");
		
		int artworkID = Integer.parseInt(request.getParameter("artworkId"));
		
		SaveArtworkDAO saveArtworkDAO = new SaveArtworkDAO();
		String result = saveArtworkDAO.insert(userID, artworkID);
		
		if (result.equals("Data Entered Successfully")) {
			// change this to displaying directly that its saved successfully
			response.sendRedirect("user-profile.jsp"); 
		} else {
			response.getWriter().append("Error Saving Artwork");
		}

	}

}
