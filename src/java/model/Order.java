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
public class Order {
    private int orderId;
    private String cusAccount,pid;
    private int quantity;
    private String dateOrder;
    private String pname,image;
    private Double totalMoney;

    public Order() {
    }

    public Order(int orderId, String cusAccount, String pid, int quantity, String dateOrder) {
        this.orderId = orderId;
        this.cusAccount = cusAccount;
        this.pid = pid;
        this.quantity = quantity;
        this.dateOrder = dateOrder;
    }

    public Order(String cusAccount, String pid, int quantity, String dateOrder) {
        this.cusAccount = cusAccount;
        this.pid = pid;
        this.quantity = quantity;
        this.dateOrder = dateOrder;
    }

    public Order(String pid, int quantity, String pname, String image,Double totalMoney) {
        this.pid = pid;
        this.quantity = quantity;
        this.pname = pname;
        this.image = image;
        this.totalMoney = totalMoney;
    }

    public void setTotalMoney(Double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Double getTotalMoney() {
        return totalMoney;
    }
    
    

    public void setPname(String pname) {
        this.pname = pname;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPname() {
        return pname;
    }

    public String getImage() {
        return image;
    }
    
    
    

    public int getOrderId() {
        return orderId;
    }

    public String getCusAccount() {
        return cusAccount;
    }

    public String getPid() {
        return pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getDateOrder() {
        return dateOrder;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setCusAccount(String cusAccount) {
        this.cusAccount = cusAccount;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }
    
    
}
