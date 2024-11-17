import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FollowUserDAO extends DAO {
	public boolean followUser(int followerID, int followingID) {
		var con = getConnection();
		String sql = "INSERT INTO follow (followerID, followingID) VALUES (?,?);";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, followerID);
			ps.setInt(2, followingID);
			int resultSet = ps.executeUpdate();

			return resultSet > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean unfollowUser(int followerID, int followingID) {
		var con = getConnection();
		String sql = "DELETE FROM follow wHERE followerID = ? AND followingID = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, followerID);
			ps.setInt(2, followingID);
			int resultSet = ps.executeUpdate();

			return resultSet > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean isFollowing(int followerID, int followingID) {
		var con = getConnection();
		String sql = "SELECT COUNT(*) FROM Follow WHERE followerID = ? AND followingID = ?;";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, followerID);
			ps.setInt(2, followingID);

			var rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getInt(1) > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getFollowerCount(int followerID) {
		var con = getConnection();
		String sql = "SELECT COUNT(*) FROM Follow WHERE followingID = ?;";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, followerID);

			var rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getFollowingCount(int followedUserID) {
		var con = getConnection();
		String sql = "SELECT COUNT(*) FROM Follow WHERE followerID = ?;";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, followedUserID);

			var rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}
}
