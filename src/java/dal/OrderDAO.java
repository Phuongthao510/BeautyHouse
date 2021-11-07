/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Cart;
import model.Item;
import model.Product;
import model.Customer;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 *
 * @author Five Swag
 */
public class OrderDAO extends DBContext {

    public void addOrder(Customer u, List<Item> list) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            for (Item i : list) {
                Product p = i.getProduct();
                String pid = p.getPid();
                int quantity = i.getQuantity();
                double price = i.getPrice();
                con.setAutoCommit(false);
                //insert into Order
                String sqlInsert = "insert into Orders(cusAccount,pid,quantity,totalMoney,dateOrder)\n"
                        + "	values(?,?,?,?,?)";
                PreparedStatement stInsert = con.prepareStatement(sqlInsert);
                stInsert.setString(1, u.getUsername());
                stInsert.setString(2, pid);
                stInsert.setInt(3, quantity);
                stInsert.setDouble(4, quantity * price);
                stInsert.setString(5, date);
                stInsert.executeUpdate();

                //update Product
                String sqlUpdate = "update Products\n"
                        + "		set Stock = stock - ?\n"
                        + "		where pid = ?\n";
                PreparedStatement stUpdate = con.prepareStatement(sqlUpdate);
                stUpdate.setInt(1, quantity);
                stUpdate.setString(2, pid);
                stUpdate.executeUpdate();
                con.commit();
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            try {
                con.rollback();
            } catch (SQLException ex1) {
                ex1.printStackTrace();
            }
        }
        try {
            //autoComit=true at the end
            con.setAutoCommit(true);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Order> getAllOrders() {
        NumberFormat formatter = new DecimalFormat("#0.00");
        List<Order> list = new ArrayList<>();
        String sql = "select o.pid,pname,image,sum(quantity) as tq,sum(totalMoney)\n"
                + "from Orders o inner join Products p on o.pid = p.pid\n"
                + "group by o.pid,pname,image\n"
                + "order by sum(quantity) desc";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1), rs.getInt(4), rs.getString(2), rs.getString(3),rs.getDouble(5)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
