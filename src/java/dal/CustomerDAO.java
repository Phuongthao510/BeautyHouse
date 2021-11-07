/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Five Swag
 */
public class CustomerDAO extends DBContext{
    public void insert(Customer u){
        String sql = "insert into customer values(?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, u.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Customer getUser(String user, String pass){
        Customer a = null;
        String sql = "select * from customer where username = ? and password = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = new Customer(user, pass, rs.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }
    
    public boolean isExsited(String username){
        String sql ="select *  from customer where username = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs=  st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public Customer getUserbyUsername(String username){
        Customer u = null;
        String sql ="select *  from customer where username = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs=  st.executeQuery();
            if (rs.next()) {
                u = new Customer(rs.getString(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
        }
        return u;
    }
}
