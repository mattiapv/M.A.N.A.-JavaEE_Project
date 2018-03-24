package db;

import java.io.Serializable;

/**
 * Created on: 8-ago-2017
 */
public class Review implements Serializable{
    
    private int id;
    private int rate;
    private String name_Author;
    private String description;
    private int id_product;
    private int id_Creator;
    private String date;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getName_Author() {
        return name_Author;
    }

    public void setName_Author(String name_Author) {
        this.name_Author = name_Author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public int getId_Creator() {
        return id_Creator;
    }

    public void setId_Creator(int id_Creator) {
        this.id_Creator = id_Creator;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    

}
