package ArtAuction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SaveArtworkDAO extends DAO {
	public boolean insert(int userID, int artworkID) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT into Favorite (userID, artworkID) VALUES (?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userID);
			ps.setInt(2, artworkID);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean removeSave(int userID, int artworkID) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "DELETE FROM Favorite WHERE userID = ? AND artworkID = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userID);
			ps.setInt(2, artworkID);
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean checkSave(int userID, int artworkID) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String sql = "SELECT COUNT(*) FROM Favorite WHERE userID = ? AND artworkID = ?";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, userID);
			ps.setInt(2, artworkID);

			var rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getInt(1) > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}