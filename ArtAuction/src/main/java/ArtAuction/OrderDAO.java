package ArtAuction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class OrderDAO extends DAO {


	public String processOrder(int userID, int artworkID, float totalPaid)
	{

		String result = "Order Not Sucessfully Placed";
		int orderID = createOrderID(userID);
		if(orderID > -1)
		{
			result = insertOrderID(orderID, artworkID);
			if(result.equals("Order Sucessfully Assigned"))
			{
				
				result = insertOrderDetails(orderID, totalPaid);
				if(result.equals("Order Sucessfully Assigned"))
				{
					return result;
				}
			}

		}

		return result;

	}

    public int createOrderID(int userID) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT INTO Order (userID, orderID) VALUES (?, ?)";
		int orderID = -1;

		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, userID);
		
			ps.executeUpdate();
			
			// Retrieve the generated artworkID
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				orderID = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderID;
	}


    public String insertOrderID(int orderID, int artworkID) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT INTO OrderItem (orderID, artworkID) VALUES (?,?)";
        String result = "Order Sucessfully Assigned";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, orderID);
			ps.setInt(2, artworkID);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
            return "Order Not Sucessfully Assigned";

		}
        return result;
	}

    public String insertOrderDetails(int orderID, float totalPaid) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT INTO OrderDetails (orderID, timestamp, trackingNumber, status, totalPaid) VALUES (?, ?, ?. ?, ?)";
        String result = "Order Sucessfully Assigned";

		try {
			Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
			// TODO how to generate trackingNumber
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, orderID);
			ps.setTimestamp(2, currentTimestamp);
			ps.setString(4, "PROCESSING");
			ps.setDouble(5, totalPaid);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
            return "Order Not Sucessfully Assigned";


		}

        return result;
	}








}