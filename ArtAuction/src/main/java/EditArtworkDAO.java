import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditArtworkDAO extends DAO 
{
	
    public String updateArtwork(Artwork newArtwork)
    {
        loadDriver(dbdriver);
		Connection con = getConnection();

        String result = "Not Succesfully Updated";

        String sql = "UPDATE Artwork SET title = ?, description = ?, artist = ? WHERE artworkID = ?;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newArtwork.getTitle());
			ps.setString(2, newArtwork.getDescription());
            ps.setString(3, newArtwork.getArtist());
            ps.setInt(4, newArtwork.getId());

            int rowsAffected = ps.executeUpdate();

            // Check if update was succesfull
            if (rowsAffected > 0) {
                result = "Successfully Updated";
            }
		
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
    }
	
}