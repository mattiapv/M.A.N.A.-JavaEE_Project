package db;

import java.io.Serializable;

/**
 * Created on: 7-ago-2017
 */
public class Shop implements Serializable {
    
    private int id;
    
    private String name;
    
    private String description;
    
    private String web_Site_Url;
    
    private String address;
    
    private int rate;
    
    private int id_Owner;
    
    private int id_Creator;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getWeb_Site_Url() {
        return web_Site_Url;
    }

    public void setWeb_Site_Url(String web_Site_Url) {
        this.web_Site_Url = web_Site_Url;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getId_Owner() {
        return id_Owner;
    }

    public void setId_Owner(int id_Owner) {
        this.id_Owner = id_Owner;
    }

    public int getId_Creator() {
        return id_Creator;
    }

    public void setId_Creator(int id_Creator) {
        this.id_Creator = id_Creator;
    }
    
    

}
