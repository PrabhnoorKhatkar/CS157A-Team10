package ArtAuction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UploadArtworkDAO extends DAO {

	public int insert(Artwork artwork) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT INTO Artwork (title, description, artist) VALUES (?, ?, ?)";
		int artworkID = -1;

		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, artwork.getTitle());
			ps.setString(2, artwork.getDescription());
			ps.setString(3, artwork.getArtist());
			
			ps.executeUpdate();
			
			// Retrieve the generated artworkID
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				artworkID = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return artworkID;
	}


	public String insertArtImage(String filename, Integer userID, Integer artworkID){

		loadDriver(dbdriver);
		Connection con = getConnection();


		// TODO prob split into 2 methods so profile pic upload can use the first sql
		String sql = "INSERT INTO Image (filename, uploaderID) VALUES (?, ?)";
		String sql2 = "INSERT INTO ArtImage (artworkID, imageID) VALUES (?, ?)";
		int imageID = -1;
		String result = "Did Not Successfully Upload Image";
		

		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, filename);
			ps.setInt(2, userID);
	
			ps.executeUpdate();
			
			// Retrieve the generated imageID
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				imageID = rs.getInt(1);

				PreparedStatement ps2 = con.prepareStatement(sql2);
				ps2.setInt(1, artworkID);
				ps2.setInt(2, imageID);
		
				var resultSet = ps2.executeQuery();

				if (resultSet.next()) 
				{
					result = "Successfully Upload Image";
					
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	
}