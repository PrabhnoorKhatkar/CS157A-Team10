package ArtAuction.Auth;

import ArtAuction.DAO;
import ArtAuction.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDAO extends DAO {

    public String insert(User user) {
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