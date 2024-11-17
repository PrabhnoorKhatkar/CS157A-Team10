
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class AuctionDAO extends DAO {

	public String insert(Integer userID, Integer artworkID, Integer startingPrice, Integer reservePrice, Integer duration) {
		loadDriver(dbdriver);
		Connection con = getConnection();

		String sql = "INSERT INTO Auction (userID, artworkID) VALUES (?, ?)";
		String sql2 = "INSERT INTO AuctionDetails (artworkID, startTimestamp, endTimestamp, startingPrice, reserve, result) VALUES (?, ?, ?, ?, ?, ?)";
        String result = "Data Entered Successfully";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userID);
			ps.setInt(2, artworkID);
            ps.executeUpdate();


            // TODO Add to AuctionDetail if INSERT into Auction was sucessful
			// TODO change ID to artworkID in schema
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

	public Auction getAuctionByArtworkID(Integer artworkID){

		var con = getConnection();
        Auction returnAuction = new Auction();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM AuctionDetails WHERE artworkID = ?");
            ps.setInt(1, artworkID);

            var resultSet = ps.executeQuery();
            

            if (resultSet.next())
			{
  
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
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       
        return returnAuction;

	}


	
}