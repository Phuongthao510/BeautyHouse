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
public class Item {
    private Product product;
    private int quantity;
    private double price;

    public Item() {
    }

    public Item( Product product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }



    public void setProduct(Product product) {
        this.product = product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }
    
    
    
}
