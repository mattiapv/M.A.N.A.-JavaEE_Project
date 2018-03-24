package db;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Mattia Created on: 24-ago-2017
 */
public class Order implements Serializable {

    private int id;
    private int idBuyer;
    private String buyerName;
    private String date;
    private ArrayList<OrderProducts> orderDetails = new ArrayList<OrderProducts>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getIdBuyer() {
        return idBuyer;
    }

    public void setIdBuyer(int idBuyer) {
        this.idBuyer = idBuyer;
    }
    
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public ArrayList<OrderProducts> getOrderDetails() {
        return orderDetails;
    }

    public void addOrderDetails(OrderProducts orderDetails) {
        this.orderDetails.add(orderDetails);
    }
    
    

}
