import java.awt.image.BufferedImage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchArtworkDAO {
    private String dburl = "jdbc:mysql://localhost:3306/artauction";
    private String dbuname = "root";
    private String dbpassword = "dbpassword";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }


    public List<Artwork> query(String keyword) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM artauction.Artwork WHERE title LIKE ? OR description LIKE ?;";

        List<Artwork> searchList =  new ArrayList<>();

        ResultSet resultSet = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            resultSet = ps.executeQuery();
            

            while (resultSet.next()) 
			{
  
			    // Retrieve data from the result set
                int id = resultSet.getInt("artID");
			    String title = resultSet.getString("title");
			    String duration = resultSet.getString("auctionDuration");
			    String result = resultSet.getString("result");
			    String reserve = resultSet.getString("reserve");
			    float startingPrice = resultSet.getFloat("startingPrice");
			    String description = resultSet.getString("description");
			    BufferedImage image = null; // TODO: Figure out how to approach image
			    
			    
			    
			    Artwork artwork = new Artwork(id, title, duration, result, reserve, startingPrice, description, image);
			    searchList.add(artwork);
			    
			}
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
        return searchList;


    }

	public Artwork getArtworkById(int artworkId) 
	{
		
		loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM artauction.Artwork WHERE artID = ?;";

        Artwork returnArtwork = null;

        ResultSet resultSet = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, artworkId);
 

            resultSet = ps.executeQuery();
            

            if (resultSet.next()) 
			{
  
			    // Retrieve data from the result set
                int id = resultSet.getInt("artID");
			    String title = resultSet.getString("title");
			    String duration = resultSet.getString("auctionDuration");
			    String result = resultSet.getString("result");
			    String reserve = resultSet.getString("reserve");
			    float startingPrice = resultSet.getFloat("startingPrice");
			    String description = resultSet.getString("description");
			    BufferedImage image = null; // TODO: Figure out how to approach image
			    
			    
			    
			    returnArtwork = new Artwork(id, title, duration, result, reserve, startingPrice, description, image);
			   
			    
			}
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
        return returnArtwork;
	}
}

