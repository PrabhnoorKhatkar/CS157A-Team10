package artauction;

import artauction.user.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class AuctionDAO extends DAO {

    public String insert(Integer userID, Integer artworkID, Integer startingPrice, Integer reservePrice, Integer duration) {
        loadDriver(dbdriver);

        String sql = "INSERT INTO auction (userID, artworkID) VALUES (?, ?)";
        String sql2 = "INSERT INTO auctiondetails (artworkID, startTimestamp, endTimestamp, startingPrice, reserve, result) VALUES (?, ?, ?, ?, ?, ?)";
        String result = "Data Entered Successfully";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, userID);
            ps.setInt(2, artworkID);
            ps.executeUpdate();


            // TODO Add to AuctionDetail if INSERT into Auction was sucessful
            Timestamp startTimestamp = new Timestamp(System.currentTimeMillis());
            Timestamp endTimestamp = new Timestamp(System.currentTimeMillis() + (duration * 86400000L));


            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setInt(1, artworkID);
            ps2.setTimestamp(2, startTimestamp);
            ps2.setTimestamp(3, endTimestamp);
            ps2.setInt(4, startingPrice);
            ps2.setInt(5, reservePrice);
            ps2.setString(6, "ACTIVE");

            ps2.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;

    }

    public Auction getAuctionByArtworkID(Integer artworkID) {

        Auction returnAuction = new Auction();
        try (

                var con = getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM auctiondetails WHERE artworkID = ?")
        ) {
            ps.setInt(1, artworkID);

            var resultSet = ps.executeQuery();


            if (resultSet.next()) {

                // Retrieve data from the result set
                int id = resultSet.getInt("artworkID");
                Timestamp startTimestamp = resultSet.getTimestamp("startTimestamp");
                Timestamp endTimestamp = resultSet.getTimestamp("endTimestamp");
                Float amount = resultSet.getFloat("amount");
                Float startingPrice = resultSet.getFloat("startingPrice");
                Float reserve = resultSet.getFloat("reserve");
                String result = resultSet.getString("result");


                returnAuction = new Auction(id, startTimestamp, endTimestamp, amount, startingPrice, reserve, result);


            }
        } catch (SQLException e) {
            // Auto-generated catch block
            e.printStackTrace();
        }


        return returnAuction;

    }

    public String removeArtwork(Integer artworkID) {
        loadDriver(dbdriver);

        String result = "Not Succesfully Removed";
        Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        String sql = "UPDATE auctiondetails SET result = 'REMOVED', endTimestamp = ? WHERE artworkID = ?;";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(2, artworkID);
            ps.setTimestamp(1, currentTimestamp);

            int rowsAffected = ps.executeUpdate();

            // Check if update was succesfull
            if (rowsAffected > 0) {
                result = "Successfully Removed";
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return result;
    }

    public String endArtwork(Integer artworkID) {
        loadDriver(dbdriver);

        String result = "Not Succesfully Ended";

        String sql = "UPDATE auctiondetails SET result = 'UNSOLD' WHERE artworkID = ?;";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, artworkID);

            int rowsAffected = ps.executeUpdate();

            // Check if update was succesfull
            if (rowsAffected > 0) {
                result = "Successfully Ended";
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return result;
    }

    public String sellArtwork(Integer artworkID) {
        loadDriver(dbdriver);

        String result = "Not Succesfully Sold";

        String sql = "UPDATE auctiondetails SET result = 'SOLD' WHERE artworkID = ?;";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, artworkID);

            int rowsAffected = ps.executeUpdate();

            // Check if update was succesfull
            if (rowsAffected > 0) {
                result = "Successfully Sold";
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return result;
    }

    public String reserveNotMetArtwork(Integer artworkID) {
        loadDriver(dbdriver);

        String result = "Not Succesfully Sold";

        String sql = "UPDATE auctiondetails SET result = 'RESERVE NOT MET' WHERE artworkID = ?;";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, artworkID);

            int rowsAffected = ps.executeUpdate();

            // Check if update was succesfull
            if (rowsAffected > 0) {
                result = "Successfully Sold";
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return result;
    }


    public String placeBid(Integer userID, Float bidAmount, Integer artworkID) {
        loadDriver(dbdriver);

        String result = "Bid Not Succesfully Placed";

        String sql = "UPDATE auctiondetails SET amount = ? WHERE artworkID = ? AND result = 'ACTIVE';";
        String sql2 = "INSERT INTO bid (userID, artworkID, timestamp, bidAmount) VALUES (?, ?, ?, ?)";

        try (

                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setFloat(1, bidAmount);
            ps.setInt(2, artworkID);

            int rowsAffected = ps.executeUpdate();

            // Check if update was succesfull
            if (rowsAffected > 0) {

                Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

                PreparedStatement ps2 = con.prepareStatement(sql2);
                ps2.setInt(1, userID);
                ps2.setInt(2, artworkID);
                ps2.setTimestamp(3, currentTimestamp);
                ps2.setFloat(4, bidAmount);

                ps2.executeUpdate();


                result = "Bid Succesfully Placed";
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }


        return result;

    }

    public User getHighestBidder(Integer artworkID) {

        loadDriver(dbdriver);

        User highestBidder = new User();

        String sql = "SELECT displayName FROM user WHERE userID = (SELECT userID FROM bid WHERE artworkID = ? ORDER BY bidAmount DESC LIMIT 1);";

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(sql)

        ) {
            ps.setInt(1, artworkID);

            var resultSet = ps.executeQuery();

            if (resultSet.next()) {

                // Retrieve data from the result set
                String displayName = resultSet.getString("displayName");

                highestBidder = new User(displayName);

            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return highestBidder;

    }


}