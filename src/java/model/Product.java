/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Five Swag
 */
public class Product {
    private String pid,pname,typeid,brandid,image;
    private Double price;
    private int stock;

    public Product() {
    }

    public Product(String pid) {
        this.pid = pid;
    }

    public Product(String pid, String pname, String image, Double price, int stock) {
        this.pid = pid;
        this.pname = pname;
        this.image = image;
        this.price = price;
        this.stock = stock;
    }
    
    

    public Product(String pid, String pname, String typeid, String brandid, String image, Double price, int stock) {
        this.pid = pid;
        this.pname = pname;
        this.typeid = typeid;
        this.brandid = brandid;
        this.image = image;
        this.price = price;
        this.stock = stock;
    }

    public String getPid() {
        return pid;
    }

    public String getPname() {
        return pname;
    }

    public String getTypeid() {
        return typeid;
    }

    public String getBrandid() {
        return brandid;
    }

    public String getImage() {
        return image;
    }

    public Double getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }

    public void setBrandid(String brandid) {
        this.brandid = brandid;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    
    
}
