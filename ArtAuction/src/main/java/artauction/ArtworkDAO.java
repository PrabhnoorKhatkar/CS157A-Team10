package artauction;

import artauction.image.Image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ArtworkDAO extends DAO
{
	
    public String updateArtwork(Artwork newArtwork)
    {
        loadDriver(dbdriver);
		Connection con = getConnection();

        String result = "Not Succesfully Updated";

        String sql = "UPDATE artwork SET title = ?, description = ?, artist = ? WHERE artworkID = ?;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newArtwork.getTitle());
			ps.setString(2, newArtwork.getDescription());
            ps.setString(3, newArtwork.getArtist());
            ps.setInt(4, newArtwork.getId());
            ps.executeUpdate();
            result = "Successfully Updated";
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return result;
    }

    public List<Artwork> query(String keyword) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "SELECT * FROM artwork NATURAL JOIN auction NATURAL JOIN artimage NATURAL JOIN auctiondetails WHERE title LIKE ? OR description LIKE ? OR artist LIKE ?;";

        List<Artwork> searchList =  new ArrayList<>();

        ResultSet resultSet = null;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setString(3, "%" + keyword + "%");

            resultSet = ps.executeQuery();


            while (resultSet.next())
            {

                // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");

				Timestamp startTimestamp = resultSet.getTimestamp("startTimestamp");
				Timestamp endTimestamp = resultSet.getTimestamp("endTimestamp");
				Float amount = resultSet.getFloat("amount");
				Float startingPrice = resultSet.getFloat("startingPrice");
				Float reserve = resultSet.getFloat("reserve");
				String result = resultSet.getString("result");

                Auction auctionDetails = new Auction(id, startTimestamp, endTimestamp, amount, startingPrice, reserve, result);

                Artwork resultArtwork = new Artwork(id, title, description, artist, auctionDetails);
                var images = new ArrayList<Image>();
                images.add(new Image(resultSet.getInt("imageID")));
                resultArtwork.setImages(images);
                searchList.add(resultArtwork);

            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }


        return searchList;


    }

    public Artwork getArtworkById(int artworkId)
    {
        var con = getConnection();
        Artwork returnArtwork = new Artwork();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT artworkID, title, description, artist, imageID FROM artwork NATURAL JOIN artimage NATURAL JOIN image WHERE artworkID = ?;");
            ps.setInt(1, artworkId);

            var resultSet = ps.executeQuery();
            var images = new ArrayList<Image>();

            if (resultSet.next())
            {
                // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");
                var img = new Image(resultSet.getInt("imageID"));
                returnArtwork = new Artwork(id, title, description, artist);
                returnArtwork.setImages(images);
                images.add(img);
            }
            while (resultSet.next()) {
                var img = new Image(resultSet.getInt("imageID"));
                images.add(img);
            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }


        return returnArtwork;
    }

    public List<String> getTagsByArtworkID(int artworkID)
    {
        var con = getConnection();
        List<String> returnList = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT name FROM tag WHERE artworkID = ? ");
            ps.setInt(1, artworkID);

            var resultSet = ps.executeQuery();

            while (resultSet.next())
            {
                // Retrieve data from the result set
                returnList.add(resultSet.getString("name"));
            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }


        return returnList;

    }
    public List<Artwork> getArtworkByuserID(int userID) {

        var con = getConnection();
        List<Artwork> returnArtworkList = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM artwork NATURAL JOIN auction NATURAL JOIN artimage WHERE userID = ?;");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            while (resultSet.next()) {

                // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");
                var artwork = new Artwork(id, title, description, artist);
                var images = new ArrayList<Image>();
                images.add(new Image(resultSet.getInt("imageID")));
                artwork.setImages(images);
                returnArtworkList.add(artwork);

            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }

        return returnArtworkList;
    }

    public List<Artwork> getFavoritedArtworkByuserID(int userID) {

        var con = getConnection();
        List<Artwork> returnArtworkList = new ArrayList<>();
        try {
            PreparedStatement ps = con
                    .prepareStatement("SELECT * FROM artwork NATURAL JOIN favorite NATURAL JOIN artimage WHERE userID = ?;");
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            while (resultSet.next()) {

                // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String artist = resultSet.getString("artist");
                var artwork = new Artwork(id, title, description, artist);
                var images = new ArrayList<Image>();
                images.add(new Image(resultSet.getInt("imageID")));
                artwork.setImages(images);

                returnArtworkList.add(artwork);

            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }

        return returnArtworkList;

    }

}