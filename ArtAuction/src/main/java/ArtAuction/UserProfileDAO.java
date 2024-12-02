package ArtAuction;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserProfileDAO extends DAO {

    public User getUserById(int userID) {

        var con = getConnection();
        User returnUser = new User();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE userID = ?");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            if (resultSet.next()) {

                // Retrieve data from the result set
                String name = resultSet.getString("name");
                String displayName = resultSet.getString("displayName");

                returnUser = new User(name, displayName);

            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }

        return returnUser;
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