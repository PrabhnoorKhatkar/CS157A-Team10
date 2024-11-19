package ArtAuction;

import java.sql.SQLException;

public class FeaturedArtworkDAO extends DAO {
    public FeaturedArtworkDAO() {}
    public Artwork[] getFeaturedArtworks(int limit) throws SQLException {
        loadDriver();
        var con = getConnection();
        // TODO: maybe select randomly or add attribute that can only be set by admins
        String sql = "SELECT artworkID, title, description, artist FROM Artwork LIMIT ?";
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
}
