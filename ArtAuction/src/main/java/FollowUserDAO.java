import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String sql = "DELETE FROM follow WHERE followerID = ? AND followingID = ?;";
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
	
	public List<User> getFollowingUsersList(int userID) {
		var con = getConnection();
		List<User> followingUsers = new ArrayList<>();
		String sql = "SELECT displayName FROM User INNER JOIN follow ON userID = followingID WHERE  followerID = ?;";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, userID);
			var resultSet = ps.executeQuery();

			while (resultSet.next()) {
				String displayName = resultSet.getString("displayName");
				followingUsers.add(new User(displayName));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return followingUsers;
	}
	
	public List<User> getFollowerUsersList(int userID) {
		var con = getConnection();
		List<User> followerUsers = new ArrayList<>();
		String sql = "SELECT displayName FROM User INNER JOIN Follow ON userID = followerID WHERE  followingID = ?;";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, userID);
			var resultSet = ps.executeQuery();

			while (resultSet.next()) {
				String displayName = resultSet.getString("displayName");
				followerUsers.add(new User(displayName));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return followerUsers;
	}
}
