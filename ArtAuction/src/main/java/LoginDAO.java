import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDAO {
	private String dburl = "jdbc:mysql://localhost:3306/artauction";
	private String dbuname = "root";
	private String dbpassword = "thyatran";
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

	public boolean validate(String email, String password) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		
		String sql = "SELECT * FROM User WHERE emailAddress = ? AND password = ?";
		boolean status = false;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			

			ResultSet rs = ps.executeQuery();
			// if found then account is valid
			status = rs.next(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
}
