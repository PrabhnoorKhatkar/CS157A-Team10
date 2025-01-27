package artauction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    private final String dburl = "jdbc:mysql://localhost:3306/artauction";
    private final String dbuname = "root";
    private final String dbpassword = "dbpassword";
    protected String dbdriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void loadDriver() {
        try {
            Class.forName(dbdriver);
        } catch (ClassNotFoundException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }
}
