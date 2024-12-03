package artauction;

import java.sql.Timestamp;

public class Auction {

    private Integer artworkID;
    private Timestamp startTimestamp;
    private Timestamp endTimestamp;
    private float amount;
    private double startingPrice;
    private float reserve;
    private String result;

    public Auction(){
        
    }
    
    public Auction(Integer artworkID, Timestamp startTimestamp, Timestamp endTimestamp, float amount,
    double startingPrice, float reserve, String result) {
        this.artworkID = artworkID;
        this.startTimestamp = startTimestamp;
        this.endTimestamp = endTimestamp;
        this.amount = amount;
        this.startingPrice = startingPrice;
        this.reserve = reserve;
        this.result = result;
    }


    public Integer getArtworkID() {
        return artworkID;
    }
    public void setArtworkID(Integer artworkID) {
        this.artworkID = artworkID;
    }
    public Timestamp getStartTimestamp() {
        return startTimestamp;
    }
    public void setStartTimestamp(Timestamp startTimestamp) {
        this.startTimestamp = startTimestamp;
    }
    public Timestamp getEndTimestamp() {
        return endTimestamp;
    }
    public void setEndTimestamp(Timestamp endTimestamp) {
        this.endTimestamp = endTimestamp;
    }
    public float getAmount() {
        return amount;
    }
    public void setAmount(float amount) {
        this.amount = amount;
    }
    public double getStartingPrice() {
        return startingPrice;
    }
    public void setStartingPrice(double startingPrice) {
        this.startingPrice = startingPrice;
    }
    public float getReserve() {
        return reserve;
    }
    public void setReserve(float reserve) {
        this.reserve = reserve;
    }
    public String getResult() {
        return result;
    }
    public void setResult(String result) {
        this.result = result;
    }

    
    
    
}

