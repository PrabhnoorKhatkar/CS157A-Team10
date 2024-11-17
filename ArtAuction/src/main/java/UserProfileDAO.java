import java.awt.image.BufferedImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserProfileDAO extends DAO {

	public User getUserById(int userID) {

		var con = getConnection();
		User returnUser = new User();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM User WHERE userID = ?");
			ps.setInt(1, userID);

			var resultSet = ps.executeQuery();

			if (resultSet.next()) {

				// Retrieve data from the result set
				String name = resultSet.getString("name");
				String displayName = resultSet.getString("displayName");

				returnUser = new User(name, displayName);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnUser;
	}

	public User getUserByDisplayName(String displayName) {
		var con = getConnection();
		User returnUser = new User();

		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM User WHERE displayName = ?");
			ps.setString(1, displayName);

			var resultSet = ps.executeQuery();
			if (resultSet.next()) {
				// Retrieve data from the result set

				String name = resultSet.getString("name");
				String displayNameDB = resultSet.getString("displayName");
				returnUser = new User(name, displayNameDB);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return returnUser;
	}

	public List<Artwork> getArtworkByuserID(int userID) {

		var con = getConnection();
		List<Artwork> returnArtworkList = new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM Artwork NATURAL JOIN Auction WHERE userID = ?;");
			ps.setInt(1, userID);

			var resultSet = ps.executeQuery();

			while (resultSet.next()) {

				// Retrieve data from the result set
				int id = resultSet.getInt("artworkID");
				String title = resultSet.getString("title");
				String description = resultSet.getString("description");
				String artist = resultSet.getString("artist");

				BufferedImage image = null; // TODO: Figure out how to approach image

				returnArtworkList.add(new Artwork(id, title, description, artist));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnArtworkList;
	}

	public List<Artwork> getFavoritedArtworkByuserID(int userID) {

		var con = getConnection();
		List<Artwork> returnArtworkList = new ArrayList<>();
		try {
			PreparedStatement ps = con
					.prepareStatement("SELECT * FROM Artwork NATURAL JOIN Favorite WHERE userID = ?;");
			ps.setInt(1, userID);

			var resultSet = ps.executeQuery();

			while (resultSet.next()) {

				// Retrieve data from the result set
				int id = resultSet.getInt("artworkID");
				String title = resultSet.getString("title");
				String description = resultSet.getString("description");
				String artist = resultSet.getString("artist");

				BufferedImage image = null; // TODO: Figure out how to approach image

				returnArtworkList.add(new Artwork(id, title, description, artist));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnArtworkList;

	}

	public List<Artwork> getArtworkByUserDisplayName(String displayName) {
		var con = getConnection();
		List<Artwork> returnArtworkList = new ArrayList<>();

		try {
			String sql = "SELECT * FROM Artwork NATURAL JOIN User NATURAL JOIN Auction WHERE displayName = ?;";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, displayName);
			var resultSet = ps.executeQuery();

			while (resultSet.next()) {

				// Retrieve data from the result set
				int id = resultSet.getInt("artworkID");
				String title = resultSet.getString("title");
				String description = resultSet.getString("description");
				String artist = resultSet.getString("artist");

				BufferedImage image = null; // TODO: Figure out how to approach image

				returnArtworkList.add(new Artwork(id, title, description, artist));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return returnArtworkList;
	}

	public List<Artwork> getFavoritedArtworkByuserDisplayName(String displayName) {
		var con = getConnection();
		List<Artwork> returnArtworkList = new ArrayList<>();

		try {
			String sql = "SELECT * FROM Artwork NATURAL JOIN Favorite NATURAL JOIN User WHERE displayName = ?;";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, displayName);
			var resultSet = ps.executeQuery();

			while (resultSet.next()) {
				int id = resultSet.getInt("artworkID");
				String title = resultSet.getString("title");
				String description = resultSet.getString("description");
				String artist = resultSet.getString("artist");

				BufferedImage image = null; // TODO: Figure out how to approach image

				returnArtworkList.add(new Artwork(id, title, description, artist));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return returnArtworkList;
	}

}