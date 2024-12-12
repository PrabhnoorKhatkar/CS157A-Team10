package artauction.order;

import artauction.DAO;

import java.security.SecureRandom;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DAO {


    public OrderDetails processOrder(int userID, int artworkID, float totalPaid) {

        int orderID = createOrderID(artworkID);
        if (orderID > -1) {
            var result = insertOrderID(orderID, userID);
            if (result.equals("Order Sucessfully Assigned")) {

                totalPaid = Math.round(totalPaid * 100) / 100.0f;
                return insertOrderDetails(orderID, "PROCESSING", totalPaid);
            }
        }

        return null;

    }

    public int createOrderID(int artworkID) {
        loadDriver(dbdriver);

        String sql = "INSERT INTO orderitem (artworkID) VALUES (?)";
        int orderID = -1;

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
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

        String sql = "INSERT INTO artauction.order (userID, orderID) VALUES (?,?)";
        String result = "Order Sucessfully Assigned";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, userID);
            ps.setInt(2, orderID);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return "Order Not Sucessfully Assigned";

        }
        return result;
    }

    private String generateTrackingNumber() {
        var random = new SecureRandom();
        return String.format("TRK%dUS", random.nextInt() % (int)Math.pow(10, 8));
    }
    public OrderDetails insertOrderDetails(int orderID, String status, float totalPaid) {
        loadDriver(dbdriver);

        String sql = "INSERT INTO orderdetails (orderID, timestamp, trackingNumber, status, totalPaid) VALUES (?, ?, ?, ?, ?)";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

            OrderDetails order = new OrderDetails(orderID, currentTimestamp, generateTrackingNumber(), status, totalPaid);
            ps.setInt(1, order.getOrderID());
            ps.setTimestamp(2, order.getPurchasedTime());
            ps.setString(3, order.getTracking());
            ps.setString(4, order.getStatus());
            ps.setFloat(5, order.getTotal());

            ps.executeUpdate();

            return order;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;


        }

    }

    public List<OrderDetails> getOrderHistory(int userID) {

        List<OrderDetails> orderList = new ArrayList<>();
        String sql = "SELECT `order`.userID, orderdetails.orderID, orderdetails.timestamp, "
                + "orderdetails.trackingNumber, orderdetails.status, orderdetails.totalPaid "
                + "FROM `order` "
                + "JOIN orderdetails ON orderdetails.orderID = `order`.orderID "
                + "WHERE `order`.userID = ?";

        try (

                var con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, userID);

            var resultSet = ps.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("orderID");
                System.out.println(id);
                Timestamp timestamp = resultSet.getTimestamp("timestamp");
                String tracking = resultSet.getString("trackingNumber");
                System.out.println(tracking);
                String status = resultSet.getString("status");
                Float paid = resultSet.getFloat("totalPaid");

                OrderDetails order = new OrderDetails(id, timestamp, tracking, status, paid);

                orderList.add(order);
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return orderList;
    }


}