/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Manager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Five Swag
 */
public class ManagerDAO extends DBContext{
    public Manager getAdmin(String user, String pass){
        Manager a = null;
        String sql = "select * from manager where username = ? and password = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = new Manager(user, pass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }
}
