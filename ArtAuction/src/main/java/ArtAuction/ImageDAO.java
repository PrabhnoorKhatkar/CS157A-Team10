package ArtAuction;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ImageDAO extends DAO {
    /**
     * @param img The Image to be added.
     * @return The ID of the image in the database.
     */
    public int insertImage(Image img) {
        loadDriver(dbdriver);
        var con = getConnection();
        var sql = "INSERT INTO Image(filename, uploaderID) VALUES (?, ?) ";
        try {
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, img.getFilename());
            ps.setInt(2, img.getUploaderId());

            ps.executeUpdate();
            var keys = ps.getGeneratedKeys();
            var id = keys.getInt(1);
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    public ArrayList<Image> findByID(int id) {
        loadDriver(dbdriver);
        var con = getConnection();
        String sql = "SELECT imageID, filename, uploaderID FROM Image WHERE imageID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            // Retrieve the generated artworkID
            ResultSet rs = ps.executeQuery();
            return extractFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public ArrayList<Image> findByFilename(String filename) {
        loadDriver(dbdriver);
        var con = getConnection();
        String sql = "SELECT imageID, filename, uploaderID FROM Image WHERE filename = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, filename);
            ResultSet rs = ps.executeQuery();
            return extractFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private ArrayList<Image> extractFromResultSet(ResultSet rs) throws SQLException {
        var images = new ArrayList<Image>();
        while (rs.next()) {
            var imageID = rs.getInt(1);
            var filename = rs.getString(2);
            var uploaderID = rs.getInt(3);
            Image img = new Image();
            img.setImageId(imageID);
            img.setFilename(filename);
            img.setUploaderId(uploaderID);
            images.add(img);
        }
        return images;
    }
    public ArrayList<Image> findByArtwork(Artwork artwork) {
        loadDriver(dbdriver);
        var con = getConnection();
        String sql = "SELECT imageID, filename, uploaderID FROM ArtImage NATURAL JOIN Artwork NATURAL JOIN Image WHERE artworkID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, artwork.getId());

            // Retrieve the generated artworkID
            ResultSet rs = ps.executeQuery();

            return extractFromResultSet(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}