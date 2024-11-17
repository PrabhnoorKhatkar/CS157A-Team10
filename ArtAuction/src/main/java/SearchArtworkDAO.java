import java.awt.image.BufferedImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchArtworkDAO extends DAO {

    public List<Artwork> query(String keyword) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM Artwork NATURAL JOIN ArtImage NATURAL JOIN Image WHERE title LIKE ? OR description LIKE ? OR artist LIKE ?;";

        List<Artwork> searchList =  new ArrayList<>();

        ResultSet resultSet = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");

            resultSet = ps.executeQuery();
            

            while (resultSet.next()) 
			{

			    // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
			    String title = resultSet.getString("title");
			    String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");
                String filepath = resultSet.getString("filename");
			    
			    searchList.add(new Artwork(id, title, description, artist, filepath));
			    
			}
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
        return searchList;


    }

	public Artwork getArtworkById(int artworkId) 
	{

        var con = getConnection();
        Artwork returnArtwork = new Artwork();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Artwork NATURAL JOIN ArtImage NATURAL JOIN Image WHERE artworkID = ?;");
            ps.setInt(1, artworkId);

            var resultSet = ps.executeQuery();
            

            if (resultSet.next())
			{
  
			    // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");
                String filepath = resultSet.getString("filename");
			    
			    returnArtwork = new Artwork(id, title, description, artist, filepath);
			   
			    
			}
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
        return returnArtwork;
	}
}

