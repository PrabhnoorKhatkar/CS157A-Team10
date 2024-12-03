package artauction;

import java.sql.*;
import java.util.List;

public class UploadArtworkDAO extends DAO {

    public int insert(Artwork artwork) {
        loadDriver(dbdriver);
        Connection con = getConnection();

        String sql = "INSERT INTO artwork (title, description, artist) VALUES (?, ?, ?)";
        int artworkID = -1;

        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, artwork.getTitle());
            ps.setString(2, artwork.getDescription());
            ps.setString(3, artwork.getArtist());

            ps.executeUpdate();

            // Retrieve the generated artworkID
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                artworkID = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return artworkID;
    }


    public String insertArtImage(String filename, Integer userID, Integer artworkID) {

        loadDriver(dbdriver);
        Connection con = getConnection();


        // TODO prob split into 2 methods so profile pic upload can use the first sql
        String sql = "INSERT INTO image (filename, uploaderID) VALUES (?, ?)";
        String sql2 = "INSERT INTO artimage (artworkID, imageID) VALUES (?, ?)";
        String result = "Did Not Successfully Upload Image";


        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, filename);
            ps.setInt(2, userID);

            ps.executeUpdate();

            // Retrieve the generated imageID
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int imageID = rs.getInt(1);
                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, artworkID);
                ps2.setInt(2, imageID);

                var rowCountDelta = ps2.executeUpdate();

                if (rowCountDelta > 0) {
                    result = "Successfully Upload Image";
                } else {
                    result = "Uploading failed";
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public String insertTag(int artworkID, List<String> tags) {
        loadDriver(dbdriver);
        Connection con = getConnection();

        String sql = "INSERT INTO tag (artworkID, name) VALUES (?, ?)";
        String result = "Succesfully Added Tags";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            for (String tagName : tags) {
                ps.setInt(1, artworkID);
                ps.setString(2, tagName);

                ps.executeUpdate();

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


}