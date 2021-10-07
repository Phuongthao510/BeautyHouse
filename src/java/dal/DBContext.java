/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author sonnt
 */
public class DBContext {
    protected Connection con;
    public DBContext()
    {
        //  private final String jdbcURL = "jdbc:mysql://localhost:3306/swd1414?characterEncoding=latin1";
        try {
            // "jdbc:mysql://localhost:3306;databaseName=BeautyHouse";
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:mysql://localhost:3306/BeautyHouse?characterEncoding=latin1";
            String username = "root";
            String password = "root@gfcd";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
    }
}

