import java.awt.image.BufferedImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class UserProfileDAO extends DAO {
	
	
	public User getUserById(int userID) 
	{

        var con = getConnection();
        User returnUser = new User();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM User WHERE ID = ?");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();
            

            if (resultSet.next())
			{
  
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
	
	
	public List<Artwork> getArtworkByuserID(int userID) {
		return null;
		// TODO implementation
		
	}
	
	public List<Artwork> getFavoritedArtworkByuserID(int userID) {
		return null;
		// TODO implementation
		
	}
	
	
}