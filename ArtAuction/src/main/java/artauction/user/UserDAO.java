package artauction.user;

import artauction.DAO;
import artauction.image.Image;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO extends DAO {

    public User getFullUserById(int userID) {

        var con = getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user LEFT OUTER JOIN profilepicture ON user.userID = profilepicture.userID WHERE user.userID = ?");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            if (resultSet.next()) {
                // Retrieve data from the result set
                var emailAddress = resultSet.getString("emailAddress");
                var name = resultSet.getString("name");
                var displayName = resultSet.getString("displayName");
                var address = resultSet.getString("address");
                var anonymous = resultSet.getBoolean("anonymous");
                var profilePictureID = resultSet.getInt("imageID");

                return new User(userID, name, displayName, emailAddress, address, anonymous, profilePictureID);
            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    public User getOtherUserById(int userID) {
        var user = getFullUserById(userID);
        if (user == null) return null;
        if (user.isAnonymous()) return new User(user.getDisplayName());
        return user;
    }

    public int getUserIDByDisplayName(String displayName) {
        var con = getConnection();
        int userID = -1;

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE displayName = ?");
            ps.setString(1, displayName);
            var resultSet = ps.executeQuery();

            if (resultSet.next()) {
                userID = resultSet.getInt("userID");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userID;
    }

    public void upsertProfilePicture(int userId, Image newProfilePicture) throws SQLException {
        loadDriver();
        var con = getConnection();
        var sql = "INSERT INTO profilepicture(userID, imageID) VALUES (?, ?) ON DUPLICATE KEY UPDATE imageID = ?";
        try {
            var upsertSql = con.prepareStatement(sql);
            upsertSql.setInt(1, userId);
            upsertSql.setInt(2, newProfilePicture.getImageId());
            upsertSql.setInt(3, newProfilePicture.getImageId());
            upsertSql.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getProfilePictureID(int userID) throws SQLException {
        loadDriver();
        var con = getConnection();
        var sql = "SELECT imageID FROM user NATURAL JOIN profilepicture NATURAL JOIN image WHERE userID = ?;";
        try {
            var ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.executeQuery();
            var rs = ps.getResultSet();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}