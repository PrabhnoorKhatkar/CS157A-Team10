package ArtAuction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@MultipartConfig
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

		// get user name of current url
		String requestedUserDisplayName = request.getParameter("user");

		// get logged in user id from the current session
		int userID = (int) request.getSession().getAttribute("userID");

		var artworkDAO = new ArtworkDAO();
		UserProfileDAO userDAO = new UserProfileDAO();
		FollowUserDAO followUserDAO = new FollowUserDAO();

		int otherID = userDAO.getUserIDByDisplayName(requestedUserDisplayName);
		int followerCount = -1;
		int followingCount = -1;
		
		User user = null;
		List<Artwork> artworkList = null;
		List<Artwork> favArtworkList = null;
		List<User> getFollowingUsersList = null;
		List<User> getFollowerUsersList = null;
		
		// if no parameter for display name it's others profile
		// else it's the logged in user profile
		if (requestedUserDisplayName == null || requestedUserDisplayName.isEmpty()) {
			user = userDAO.getUserById(userID);
			artworkList = artworkDAO.getArtworkByuserID(userID);
			favArtworkList = artworkDAO.getFavoritedArtworkByuserID(userID);
			followerCount = followUserDAO.getFollowerCount(userID);
			followingCount = followUserDAO.getFollowingCount(userID);
			
			getFollowingUsersList = followUserDAO.getFollowingUsersList(userID);
			getFollowerUsersList = followUserDAO.getFollowerUsersList(userID);
			
			request.setAttribute("myProfile", true);
		} else {
			user = userDAO.getUserById(otherID);
			artworkList = artworkDAO.getArtworkByuserID(otherID);
			favArtworkList = artworkDAO.getFavoritedArtworkByuserID(otherID);
			followerCount = followUserDAO.getFollowerCount(otherID);
			followingCount = followUserDAO.getFollowingCount(otherID);
			
			getFollowingUsersList = followUserDAO.getFollowingUsersList(otherID);
			getFollowerUsersList = followUserDAO.getFollowerUsersList(otherID);
			
			request.setAttribute("myProfile", false);
		}
		boolean isFollowed = followUserDAO.isFollowing(userID, otherID);
		
		
		request.setAttribute("otherID", otherID);
		request.setAttribute("isFollowed", isFollowed);
		request.setAttribute("followerCount", followerCount);
		request.setAttribute("followingCount", followingCount);
		request.setAttribute("user", user);
		request.setAttribute("artworkList", artworkList);
		request.setAttribute("favArtworkList", favArtworkList);
		

		request.setAttribute("followingUsersList", getFollowingUsersList);
		request.setAttribute("getFollowerUsersList", getFollowerUsersList);

		request.getRequestDispatcher("user-profile.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		Integer userID = (Integer) request.getSession().getAttribute("userID");
		if (action.equals("editProfilePicture")) {
			var imageDao = new ImageDAO();
			UserProfileDAO userDAO = new UserProfileDAO();
			var part = request.getPart("profilepicture");
			var filename = String.format("profile-pic-%s-%s", ImageUploader.salt(8), part.getSubmittedFileName());
			ImageUploader.upload(part.getInputStream(), filename);
			var img = new Image(filename, userID);
			imageDao.insertImage(img);
            try {
                userDAO.upsertProfilePicture(userID, img);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
			return;
        }
		String followUserStr = request.getParameter("followedUserId");
		

		FollowUserDAO followUserDAO = new FollowUserDAO();
		
		if (followUserStr == null || followUserStr.isEmpty()) {
			response.getWriter().append("Invalid followed user ID.");
			return;
		}
		
		Integer followedUserID = Integer.parseInt(followUserStr);
		
		if (action.equals("follow")) {
			followUserDAO.followUser(userID, followedUserID);
		} else if (action.equals("unfollow")) {
			followUserDAO.unfollowUser(userID, followedUserID);
		}

		String displayName = request.getParameter("displayName");
		response.sendRedirect(request.getContextPath() +"/UserProfile?user=" + displayName);
	}

}
