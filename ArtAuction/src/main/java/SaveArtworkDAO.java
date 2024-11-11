import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SaveArtworkDAO extends DAO {
	
	public String insert(int userID, int artworkID) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT into Favorite (userID, artworkID) VALUES (?,?)";
		String result = "Data Entered Successfully";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userID);
			ps.setInt(2, artworkID);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			result = "Data Not Entered Successfully";
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}