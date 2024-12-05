package artauction.order;

import java.sql.Timestamp;

public class OrderDetails {
    private int orderID;
    private Timestamp purchasedTime;
    private String tracking;
    private String status;
    private float total;

    public OrderDetails() {

    }

    public OrderDetails(int orderID, Timestamp purchasedTime, String tracking, String status, float total) {
        this.orderID = orderID;
        this.purchasedTime = purchasedTime;
        this.tracking = tracking;
        this.status = status;
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Timestamp getPurchasedTime() {
        return purchasedTime;
    }

    public void setPurchasedTime(Timestamp purchasedTime) {
        this.purchasedTime = purchasedTime;
    }

    public String getTracking() {
        return tracking;
    }

    public void setTracking(String tracking) {
        this.tracking = tracking;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
}
