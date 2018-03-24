package db;

import java.io.Serializable;

/**
 * Created on: 10-ago-2017
 */
public class UsersPhoto implements Serializable{
    private int id;
    private String name;
    private int id_Product;
    private int id_Owner;
    private String nameOwner;

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
    
    public int getId_Product() {
        return id_Product;
    }

    public void setId_Product(int id_Product) {
        this.id_Product = id_Product;
    }

    public int getId_Owner() {
        return id_Owner;
    }

    public void setId_Owner(int id_Owner) {
        this.id_Owner = id_Owner;
    }

    public String getNameOwner() {
        return nameOwner;
    }

    public void setNameOwner(String nameOwner) {
        this.nameOwner = nameOwner;
    }
    
    
    

}

