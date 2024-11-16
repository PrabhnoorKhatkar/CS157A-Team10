import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ArtworkPageDAO extends DAO {

    public boolean checkArtworkAccount(int userID, int artworkID){
        
        loadDriver(dbdriver);
        Connection con = getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT 1 FROM Auction WHERE userID = ? AND artworkID = ?;");
            ps.setInt(1, userID);
            ps.setInt(2, artworkID);

            var resultSet = ps.executeQuery();

            if (resultSet.next())
			{
			   return true;
			}
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;

    }

	



}
