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
public class ProductType {
    private String typeid,tname;

    public ProductType() {
    }

    public ProductType(String typeid, String tname) {
        this.typeid = typeid;
        this.tname = tname;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTypeid() {
        return typeid;
    }

    public String getTname() {
        return tname;
    }
    
    
}
