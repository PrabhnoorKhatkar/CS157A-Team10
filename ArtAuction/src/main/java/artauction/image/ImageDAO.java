package artauction.image;

import artauction.Artwork;
import artauction.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ImageDAO extends DAO {
    /**
     * @param img The Image to be added.
     * @return The same Image, but with its ID populated.
     */
    public Image insertImage(Image img) {
        loadDriver(dbdriver);
        System.err.println("inserting img");
        var con = getConnection();
        var sql = "INSERT INTO image(filename, uploaderID) VALUES (?, ?) ";
        try {
            PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, img.getFilename());
            ps.setInt(2, img.getUploaderId());

            ps.executeUpdate();
            var keys = ps.getGeneratedKeys();
            if (keys.next()) {
                var id = keys.getInt(1);
                img.setImageId(id);
                return img;
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Image findByID(int id) {
        loadDriver(dbdriver);
        var con = getConnection();
        String sql = "SELECT imageID, filename, uploaderID FROM image WHERE imageID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            // Retrieve the generated artworkID
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Image findByFilename(String filename) {
        loadDriver(dbdriver);
        var con = getConnection();
        String sql = "SELECT imageID, filename, uploaderID FROM image WHERE filename = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, filename);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return extractFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Image extractFromResultSet(ResultSet rs) throws SQLException {
        var imageID = rs.getInt("imageID");
        var filename = rs.getString("filename");
        var uploaderID = rs.getInt("uploaderID");
        return new Image(imageID, filename, uploaderID);
    }

    public ArrayList<Image> findByArtwork(Artwork artwork) {
        loadDriver(dbdriver);
        var con = getConnection();
        String sql = "SELECT imageID, filename, uploaderID FROM artimage NATURAL JOIN artwork NATURAL JOIN image WHERE artworkID = ?";
        ArrayList<Image> images = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, artwork.getId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                images.add(extractFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }
}