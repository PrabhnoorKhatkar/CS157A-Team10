package artauction.order;

import artauction.DAO;

import java.sql.*;

public class OrderDAO extends DAO {


    public String processOrder(int userID, int artworkID, float totalPaid) {

        String result = "Order Not Sucessfully Placed";
        int orderID = createOrderID(artworkID);
        if (orderID > -1) {
            result = insertOrderID(orderID, userID);
            if (result.equals("Order Sucessfully Assigned")) {

            	totalPaid = Math.round(totalPaid * 100) / 100.0f;
                result = insertOrderDetails(orderID, totalPaid);
                if (result.equals("Order Sucessfully Assigned")) {
                    return result;
                }
            }

        }

        return result;

    }

    public int createOrderID(int artworkID) {
        loadDriver(dbdriver);
        Connection con = getConnection();

        String sql = "INSERT INTO orderitem (artworkID) VALUES (?)";
        int orderID = -1;

        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, artworkID);

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


    public String insertOrderID(int orderID, int userID) {
        loadDriver(dbdriver);
        Connection con = getConnection();

        String sql = "INSERT INTO artauction.order (userID, orderID) VALUES (?,?)";
        String result = "Order Sucessfully Assigned";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, orderID);
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

        String sql = "INSERT INTO orderdetails (orderID, timestamp, status, totalPaid) VALUES (?, ?, ?, ?)";
        String result = "Order Sucessfully Assigned";

        try {
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, orderID);
            ps.setTimestamp(2, currentTimestamp);
            
            ps.setString(3, "PROCESSING");
            ps.setFloat(4, totalPaid);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return "Order Not Sucessfully Assigned";


        }

        return result;
    }


}