
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UploadDAO extends DAO {

	public int insert(Artwork artwork) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT INTO Artwork (title, description, artist) VALUES (?, ?, ?)";
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



	
}