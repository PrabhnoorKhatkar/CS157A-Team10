package artauction;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import artauction.image.Image;

public class FeaturedArtworkDAO extends DAO {
    public FeaturedArtworkDAO() {
    }

    public Artwork[] getFeaturedArtworks(int limit) throws SQLException {
      
        loadDriver();
        var con = getConnection();

        String sql = """
                SELECT * FROM artwork
                NATURAL JOIN auction
                NATURAL JOIN auctiondetails
                NATURAL JOIN artimage WHERE result = 'ACTIVE' ORDER BY endTimestamp LIMIT ?;
                """;
        List<Artwork> featuredArtworks = new ArrayList<>();

        try {
            var ps = con.prepareStatement(sql);
            ps.setInt(1, limit);

            var rs = ps.executeQuery();
            var i = 0;
            while (rs.next() && i < limit) {

                // Retrieve data from the result set
				int id = rs.getInt("artworkID");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String artist = rs.getString("artist");

				Timestamp startTimestamp = rs.getTimestamp("startTimestamp");
				Timestamp endTimestamp = rs.getTimestamp("endTimestamp");
				Float amount = rs.getFloat("amount");
				Float startingPrice = rs.getFloat("startingPrice");
				Float reserve = rs.getFloat("reserve");
				String result = rs.getString("result");

				Auction auctionDetails = new Auction(id, startTimestamp, endTimestamp, amount, startingPrice, reserve,
						result);

				Artwork resultArtwork = new Artwork(id, title, description, artist, auctionDetails);
				var images = new ArrayList<Image>();
				images.add(new Image(rs.getInt("imageID")));
				resultArtwork.setImages(images);
				featuredArtworks.add(resultArtwork);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return featuredArtworks.toArray(new Artwork[0]);

    
    }

    public Artwork[] getFeaturedArtworksByFollowing(int loggedInUserID, int limit) {

        loadDriver();
        var con = getConnection();

        String sql = "SELECT * FROM artwork NATURAL JOIN auction NATURAL JOIN auctiondetails NATURAL JOIN artimage WHERE userID IN (SELECT followingID as userID FROM follow WHERE ? = followerID) AND result = 'ACTIVE' ORDER BY endTimestamp ASC LIMIT ?;";
        List<Artwork> featuredArtworks = new ArrayList<>();

        try {
            var ps = con.prepareStatement(sql);
            ps.setInt(1, loggedInUserID);
            ps.setInt(2, limit);

            var rs = ps.executeQuery();
            var i = 0;
            while (rs.next() && i < limit) {

                // Retrieve data from the result set
				int id = rs.getInt("artworkID");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String artist = rs.getString("artist");

				Timestamp startTimestamp = rs.getTimestamp("startTimestamp");
				Timestamp endTimestamp = rs.getTimestamp("endTimestamp");
				Float amount = rs.getFloat("amount");
				Float startingPrice = rs.getFloat("startingPrice");
				Float reserve = rs.getFloat("reserve");
				String result = rs.getString("result");

				Auction auctionDetails = new Auction(id, startTimestamp, endTimestamp, amount, startingPrice, reserve,
						result);

				Artwork resultArtwork = new Artwork(id, title, description, artist, auctionDetails);
				var images = new ArrayList<Image>();
				images.add(new Image(rs.getInt("imageID")));
				resultArtwork.setImages(images);
				featuredArtworks.add(resultArtwork);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return featuredArtworks.toArray(new Artwork[0]);

    }
}
