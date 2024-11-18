import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.nio.file.Path;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class ImageDAO extends DAO {
    public int insertImage(Image img) {
        loadDriver(dbdriver);
        var con = getConnection();
        var sql = "INSERT INTO Image(filename, uploaderID) VALUES (?, ?) ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, img.getFilename());
            ps.setInt(2, img.getUploaderId());

            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    public Image findByID(int id) {
        loadDriver(dbdriver);
        var con = getConnection();

        String sql = "SELECT imageID, filename, uploaderID FROM Image WHERE imageID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            // Retrieve the generated artworkID
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                var imageID = rs.getInt(1);
                var filename = rs.getString(2);
                var uploaderID = rs.getInt(3);
                Image img = new Image();
                img.setImageId(imageID);
                img.setFilename(filename);
                img.setUploaderId(uploaderID);
                return img;
            }
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}