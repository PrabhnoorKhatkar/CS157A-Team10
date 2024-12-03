package ArtAuction.Auth;

import ArtAuction.DAO;
import ArtAuction.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends DAO {

    public User findUserByLogin(String email, String password) {
        loadDriver(dbdriver);
        Connection con = getConnection();

        String sql = "SELECT * FROM user LEFT OUTER JOIN profilepicture ON user.userID = profilepicture.userID WHERE emailAddress = ? AND password = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            // if found then account is valid
            if (rs.next()) {
                var userID = rs.getInt("userID");
                var emailAddress = rs.getString("emailAddress");
                var name = rs.getString("name");
                var displayName = rs.getString("displayName");
                var address = rs.getString("address");
                var anonymous = rs.getBoolean("anonymous");
                var profilePictureId = rs.getInt("imageID");
                return new User(userID, name, displayName, emailAddress, address, anonymous, profilePictureId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // no user found with those login credentials
        return null;
    }

    public boolean checkAdmin(Integer userID) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "SELECT COUNT(*) FROM admin WHERE userID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }


        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
}
