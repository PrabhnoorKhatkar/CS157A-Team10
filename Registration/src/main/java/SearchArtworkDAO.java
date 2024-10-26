import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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


    public ResultSet query(String keyword) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM Artwork WHERE title LIKE ? OR description LIKE ?";
        String noResult = "No Artworks Found.";


        ResultSet resultSet = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, keyword);
            ps.setString(2, keyword);

            resultSet = ps.executeQuery();

            if (!resultSet.next()) {
                //TODO Send result no artwork found

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return resultSet;


    }
}

