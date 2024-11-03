import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDao {
	private final String dburl = "jdbc:mysql://localhost:3306/artauction";
	private final String dbuname = "root";
	private final String dbpassword = "dbpassword";
	private final String dbdriver = "com.mysql.cj.jdbc.Driver";

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

	public String insert(User user) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String sql = "INSERT into User (displayName, Name, emailAddress, password, address, anonymous) VALUES (?,?,?,?,?,?)";
		String result = "Data Entered Successfully";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(2, user.getName());
			ps.setString(1, user.getDisplayName());
			ps.setString(4, user.getPassword());
			ps.setString(3, user.getEmailAddress());
			ps.setString(5, user.getAddress());
			ps.setBoolean(6, user.isAnonymous());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = "Data Not Entered Successfully";
			e.printStackTrace();
		}
		return result;
	}
}