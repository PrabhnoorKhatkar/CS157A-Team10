package artauction;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeaturedArtworkDAO extends DAO {
    public FeaturedArtworkDAO() {
    }

    public Artwork[] getFeaturedArtworks(int limit) throws SQLException {
        loadDriver();
        var con = getConnection();
        // TODO: maybe select randomly or add attribute that can only be set by admins
        String sql = "SELECT artworkID, title, description, artist FROM artwork LIMIT ?";
        var featuredArtworks = new Artwork[limit];
        var ps = con.prepareStatement(sql);
        try {
            ps.setInt(1, limit);
            var rs = ps.executeQuery();
            var i = 0;
            while (rs.next() && i < limit) {
                var artworkId = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String artist = rs.getString(4);
                Artwork artwork = new Artwork(artworkId, title, description, artist);
                featuredArtworks[i++] = artwork;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return featuredArtworks;
    }

    public Artwork[] getFeaturedArtworksByFollowing(int loggedInUserID, int limit) {

        loadDriver();
        var con = getConnection();

        String sql = "SELECT * FROM artwork NATURAL JOIN auction NATURAL JOIN auctiondetails WHERE userID IN (SELECT followingID as userID FROM follow WHERE ? = followerID) AND result = 'ACTIVE' ORDER BY endTimestamp ASC LIMIT ?;";
        List<Artwork> featuredArtworks = new ArrayList<>();

        try {
            var ps = con.prepareStatement(sql);
            ps.setInt(1, loggedInUserID);
            ps.setInt(2, limit);

            var rs = ps.executeQuery();
            var i = 0;
            while (rs.next() && i < limit) {
                var artworkId = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String artist = rs.getString(4);
                Artwork artwork = new Artwork(artworkId, title, description, artist);
                featuredArtworks.add(artwork);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return featuredArtworks.toArray(new Artwork[0]);

    }
}