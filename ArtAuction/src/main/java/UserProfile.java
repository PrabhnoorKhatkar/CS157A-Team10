import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserProfile extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    
	public UserProfile() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
        
		String requestedUserDisplayName = request.getParameter("user"); // display user name of current url
		
		
		int userID = (int) request.getSession().getAttribute("userID"); // logged in user id
		
        UserProfileDAO userDAO = new UserProfileDAO();
		User user = null;
          
		if (requestedUserDisplayName == null || requestedUserDisplayName.isEmpty()) {
			user = userDAO.getUserById(userID);
		} else {
			user = userDAO.getUserByDisplayName(requestedUserDisplayName);
		}
		
		List<Artwork> artworkList = userDAO.getArtworkByuserID(userID);
		List<Artwork> favArtworkList = userDAO.getFavoritedArtworkByuserID(userID);
		

        request.setAttribute("user", user);
        request.setAttribute("artworkList", artworkList);
		request.setAttribute("favArtworkList", favArtworkList);
        
        
        request.getRequestDispatcher("user-profile.jsp").forward(request, response);
        		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
    
}
