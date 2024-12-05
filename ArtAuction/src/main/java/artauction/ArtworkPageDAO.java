package artauction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ArtworkPageDAO extends DAO {

    public boolean checkArtworkAccount(int userID, int artworkID) {

        loadDriver(dbdriver);
        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT 1 FROM auction WHERE userID = ? AND artworkID = ?;")
        ) {
            ps.setInt(1, userID);
            ps.setInt(2, artworkID);

            var resultSet = ps.executeQuery();

            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    // get owner userID by artworkID
    public int getUserIDByArtworkID(int artworkID) {
        loadDriver(dbdriver);
        int userID = -1;

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT userID FROM auction WHERE artworkID = ?;")
        ) {
            ps.setInt(1, artworkID);

            var resultSet = ps.executeQuery();

            if (resultSet.next()) {
                userID = resultSet.getInt("userID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userID;

    }

    public String getUserDisplayNameByUserID(int userID) {
        loadDriver(dbdriver);
        String displayName = null; // Default value when no user is found

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT displayName FROM user WHERE userID = ?;")
        ) {
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            if (resultSet.next()) {
                displayName = resultSet.getString("displayName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return displayName;
    }

}
