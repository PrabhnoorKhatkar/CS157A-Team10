package ArtAuction.Auth;

import ArtAuction.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO extends DAO {

	public boolean validate(String email, String password) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "SELECT * FROM user WHERE emailAddress = ? AND password = ?";
		boolean status = false;

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			// if found then account is valid
			status = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public int getUserIDByEmail(String email) {
		int userID = -1;

		Connection con = getConnection();

		String sql = "SELECT userID FROM user WHERE emailAddress = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				userID = rs.getInt("userID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userID;
	}
	
	public boolean checkAdmin(Integer id) {
		loadDriver(dbdriver);
		Connection con = getConnection();
		String sql = "SELECT COUNT(*) FROM admin WHERE userID = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
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
