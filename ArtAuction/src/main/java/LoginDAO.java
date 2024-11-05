import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDAO extends DAO {

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
