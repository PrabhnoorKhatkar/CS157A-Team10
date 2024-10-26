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
    private String dbdriver = "com.mysql.jdbc.Driver";

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
        String sql = "SELECT * FROM artauction.Artwork WHERE title LIKE ? OR description LIKE ?";

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
			    String title = resultSet.getString("title");
			    float duration = resultSet.getFloat("auctionDuration");
			    String result = resultSet.getString("result");
			    float reserve = resultSet.getFloat("reserve");
			    float startingPrice = resultSet.getFloat("startingPrice");
			    String description = resultSet.getString("description");
			    BufferedImage image = null; // TODO: Figure out how to approach image
			    
			    
			    Artwork artwork = new Artwork(title, duration, result, reserve, startingPrice, description, image);
			    searchList.add(artwork);
			    
			}
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    
        
        return searchList;


    }
}

