/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Five Swag
 */
public class UserDAO extends DBContext{
    public void insert(User u){
        String sql = "insert into Users values(?,?,?)";
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
    public User getUser(String user, String pass){
        User a = null;
        String sql = "select * from Users where username = ? and password = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = new User(user, pass, rs.getString(3));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }
    
    public boolean isExsited(String username){
        String sql ="select *  from users where username = ?";
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
    
    public User getUserbyUsername(String username){
        User u = null;
        String sql ="select *  from users where username = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs=  st.executeQuery();
            if (rs.next()) {
                u = new User(rs.getString(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception e) {
        }
        return u;
    }
}
