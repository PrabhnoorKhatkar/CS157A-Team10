package ArtAuction;

import java.awt.image.BufferedImage;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserProfileDAO extends DAO {

    public User getUserById(int userID) {

        var con = getConnection();
        User returnUser = new User();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM User WHERE userID = ?");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            if (resultSet.next()) {

                // Retrieve data from the result set
                String name = resultSet.getString("name");
                String displayName = resultSet.getString("displayName");

                returnUser = new User(name, displayName);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return returnUser;
    }

    public int getUserIDByDisplayName(String displayName) {
        var con = getConnection();
        int userID = -1;

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM User WHERE displayName = ?");
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

    public List<Artwork> getArtworkByuserID(int userID) {

        var con = getConnection();
        List<Artwork> returnArtworkList = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Artwork NATURAL JOIN Auction WHERE userID = ?;");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            while (resultSet.next()) {

                // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");

                BufferedImage image = null; // TODO: Figure out how to approach image

                returnArtworkList.add(new Artwork(id, title, description, artist));

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return returnArtworkList;
    }

    public List<Artwork> getFavoritedArtworkByuserID(int userID) {

        var con = getConnection();
        List<Artwork> returnArtworkList = new ArrayList<>();
        try {
            PreparedStatement ps = con
                    .prepareStatement("SELECT * FROM Artwork NATURAL JOIN Favorite WHERE userID = ?;");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            while (resultSet.next()) {

                // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");

                BufferedImage image = null; // TODO: Figure out how to approach image

                returnArtworkList.add(new Artwork(id, title, description, artist));

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return returnArtworkList;

    }

    public void upsertProfilePicture(int userId, Image newProfilePicture) throws SQLException {
        loadDriver();
        var con = getConnection();
        var sql = "INSERT INTO ProfilePicture(userID, imageID) VALUES (?, ?) ON DUPLICATE KEY UPDATE imageID = ?";
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
        var sql = "SELECT imageID FROM User NATURAL JOIN ProfilePicture NATURAL JOIN Image WHERE userID = ?;";
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