package db;

import java.io.Serializable;
import java.util.ArrayList;


/**
 * Created on: 21-lug-2017
 */
public class User implements Serializable {
    private int id;
    private String email;
    private String firstName;
    private String lastName;
    private String role;
    private String password;
    private int active;
    private int num_notifies;
    private ArrayList<Order> Orders = new ArrayList<Order>();
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String name) {
        this.firstName = name;
    }

    public String getlastName() {
        return lastName;
    }

    public void setLastName(String lastname) {
        this.lastName = lastname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return (active==1);
    }

    public void setActive(int active) {
        this.active = active;
    }
    
    public int getNum_notifies() {
        return num_notifies;
    }

    public void setNum_notifies() {
        this.num_notifies++;
    }

    public ArrayList<Order> getOrders() {
        return Orders;
    }

    public void addOrders(Order o) {
        this.Orders.add(o);
    }

    public void setOrders(ArrayList<Order> Orders) {
        this.Orders = Orders;
    }

}
