package ArtAuction;

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

			    searchList.add(new Artwork(id, title, description, artist));
			    
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
            PreparedStatement ps = con.prepareStatement("SELECT artworkID, title, description, artist, imageID FROM Artwork NATURAL JOIN ArtImage NATURAL JOIN Image WHERE artworkID = ?;");
            ps.setInt(1, artworkId);

            var resultSet = ps.executeQuery();
            var images = new ArrayList<Image>();

            if (resultSet.next())
			{
			    // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");
                var img = new Image(resultSet.getInt("imageID"));
			    returnArtwork = new Artwork(id, title, description, artist);
                returnArtwork.setImages(images);
                images.add(img);
			}
            while (resultSet.next()) {
                var img = new Image(resultSet.getInt("imageID"));
                images.add(img);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
        return returnArtwork;
	}

    public List<String> getTagsByArtworkID(int artworkID)
    {
        var con = getConnection();
        List<String> returnList = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT name FROM Tag WHERE artworkID = ? ");
            ps.setInt(1, artworkID);

            var resultSet = ps.executeQuery();

            while (resultSet.next()) 
            {
                // Retrieve data from the result set
                returnList.add(resultSet.getString("name"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
        return returnList;

    }
}

