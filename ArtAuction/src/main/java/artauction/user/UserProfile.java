package artauction.user;

import artauction.Artwork;
import artauction.ArtworkDAO;
import artauction.image.Image;
import artauction.image.ImageDAO;
import artauction.image.ImageUploader;
import artauction.order.OrderDAO;
import artauction.order.OrderDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserProfile", urlPatterns={"/App/UserProfile"})
@MultipartConfig
public class UserProfile extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UserProfile() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());

        // get user name of current url
        String requestedUserDisplayName = request.getParameter("user");

        // get logged in user id from the current session
        var session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");

        var artworkDAO = new ArtworkDAO();
        UserDAO userDAO = new UserDAO();
        FollowUserDAO followUserDAO = new FollowUserDAO();
        ImageDAO imageDAO = new ImageDAO();
        OrderDAO orderDAO = new OrderDAO();

        int otherID = userDAO.getUserIDByDisplayName(requestedUserDisplayName);
        int followerCount = -1;
        int followingCount = -1;
        int imageID = -1;

        User viewedUser = null;
        Image image = null;
        Image otherImage = null;
        List<Artwork> artworkList = null;
        List<Artwork> favArtworkList = null;
        List<User> getFollowingUsersList = null;
        List<User> getFollowerUsersList = null;
        List<OrderDetails> getOrderList = null;

        // if no parameter for display name it's others profile
        // else it's the logged in user profile
        var myProfile = requestedUserDisplayName == null || requestedUserDisplayName.isEmpty();
        var viewedID = myProfile ? userID : otherID;
            viewedUser = userDAO.getFullUserById(viewedID);

            artworkList = artworkDAO.getArtworkByuserID(viewedID);
            favArtworkList = artworkDAO.getFavoritedArtworkByuserID(viewedID);
            followerCount = followUserDAO.getFollowerCount(viewedID);
            followingCount = followUserDAO.getFollowingCount(viewedID);

            getFollowingUsersList = followUserDAO.getFollowingUsersList(viewedID);
            getFollowerUsersList = followUserDAO.getFollowerUsersList(viewedID);

            getOrderList = orderDAO.getOrderHistory(userID);
            System.out.println(getOrderList);

            try {
				otherID = userDAO.getProfilePictureID(viewedID);
			} catch (SQLException e) {
				// Auto-generated catch block
				e.printStackTrace();
			}


        request.setAttribute("myProfile", myProfile);
        boolean isFollowed = followUserDAO.isFollowing(userID, viewedID);

        request.setAttribute("otherID", otherID);
        request.setAttribute("isFollowed", isFollowed);
        request.setAttribute("followerCount", followerCount);
        request.setAttribute("followingCount", followingCount);
        request.setAttribute("viewedUser", viewedUser);
        request.setAttribute("artworkList", artworkList);
        request.setAttribute("favArtworkList", favArtworkList);

        request.setAttribute("followingUsersList", getFollowingUsersList);
        request.setAttribute("getFollowerUsersList", getFollowerUsersList);

        request.setAttribute("getOrderList", getOrderList);

        request.getRequestDispatcher("/App/user-profile.jsp").forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        Integer userID = (Integer) request.getSession().getAttribute("userID");
        UserDAO userDAO = new UserDAO();
        if (action.equals("editProfilePicture")) {
            var imageDao = new ImageDAO();
            var part = request.getPart("profilepicture");
            var filename = String.format("profile-pic-%s-%s", ImageUploader.salt(8), part.getSubmittedFileName());
            ImageUploader.upload(part.getInputStream(), filename);
            var img = new Image(filename, userID);
            imageDao.insertImage(img);
            try {
                userDAO.upsertProfilePicture(userID, img);
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
            var updatedUser = userDAO.getFullUserById(userID);
            request.getSession().setAttribute("user", updatedUser);
            response.sendRedirect(request.getContextPath() + "/App/UserProfile?user=" + updatedUser.getDisplayName());
        } else {
            String followUserStr = request.getParameter("followedUserId");


            FollowUserDAO followUserDAO = new FollowUserDAO();

            if (followUserStr == null || followUserStr.isEmpty()) {
                response.getWriter().append("Invalid followed user ID.");
                return;
            }

            int followedUserID = Integer.parseInt(followUserStr);

            if (action.equals("follow")) {
                followUserDAO.followUser(userID, followedUserID);
            } else if (action.equals("unfollow")) {
                followUserDAO.unfollowUser(userID, followedUserID);
            }
            response.sendRedirect(request.getContextPath() +"/App/UserProfile?user=" + request.getParameter("displayName"));

        }

    }

}
