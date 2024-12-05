package artauction.auth;

import artauction.DAO;
import artauction.user.Admin;
import artauction.user.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthDAO extends DAO {
    public Admin upgradeUserToAdmin(User user, String role, String referralCode, String referralCodeUsed) throws SQLException {
        loadDriver(dbdriver);
        Connection con = getConnection();
        var sql = "INSERT INTO admin(userID, role, referralCode, referralCodeUsed) VALUES (?, ?, ?, ?)";
        var ps = con.prepareStatement(sql);
        ps.setInt(1, user.getId());
        ps.setString(2, role);
        ps.setString(3, referralCode);
        ps.setString(4, referralCodeUsed);
        var rs = ps.executeUpdate();
        return new Admin(user, role, referralCode, referralCodeUsed);
    }

    public User findUserByLogin(String email, String password) {
        loadDriver(dbdriver);
        Connection con = getConnection();

        String sql = """
                SELECT * FROM
                user
                LEFT JOIN admin ON user.userID = admin.userID
                LEFT JOIN profilepicture ON user.userID = profilepicture.userID
                WHERE emailAddress = ? AND password = ?
                """;

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

                var role = rs.getString("role");
                if (role != null) {
                    // is admin
                    var refcode = rs.getString("referralCode");
                    var refcodeUsed = rs.getString("referralCodeUsed");
                    return new Admin(userID, name, displayName, emailAddress, address, anonymous, profilePictureId, role, refcode, refcodeUsed);
                }
                return new User(userID, name, displayName, emailAddress, address, anonymous, profilePictureId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // no user found with those login credentials
        return null;
    }

    public String insertNewUser(User user) {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String sql = "INSERT into user (displayName, Name, emailAddress, password, address, anonymous) VALUES (?,?,?,?,?,?)";
        String result = "Data Entered Successfully";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getDisplayName());
            ps.setString(2, user.getName());
            ps.setString(3, user.getEmailAddress());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());
            ps.setBoolean(6, user.isAnonymous());
            ps.executeUpdate();
        } catch (SQLException e) {
            // Auto-generated catch block
            result = e.getMessage();
            e.printStackTrace();
        }
        return result;
    }
}
