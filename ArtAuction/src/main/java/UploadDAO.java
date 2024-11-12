
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UploadDAO extends DAO {

	public String insert(Artwork artwork) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT into Artwork () VALUES (?,?,?,?,?,?)";
		String result = "Data Entered Successfully";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.executeUpdate();

		} catch (SQLException e) {

			// TODO Auto-generated catch block
			result = "Data Not Entered Successfully";
			e.printStackTrace();
		}
		return result;
	}
}