/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Five Swag
 */
public class ProductDAO extends DBContext {

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Products";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductbyType(String type) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.*, pt.tname\n"
                + "from ProductType pt inner join Products p on pt.tid = p.typeid\n"
                + "where tname =?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, type);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Product> searchProduct(String name, String brand, double priceFrom, double priceTo, int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER (ORDER BY pid DESC) rownum, pid, pname, [image], price, stock FROM dbo.Products WHERE 1 = 1";
            HashMap<Integer, Object[]> params = new HashMap<>();
            int paramCount = 0;
            if (name != null && !name.trim().isEmpty()) {
                sql += " AND pname LIKE '%' + ? + '%'";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "STRING";
                paramValues[1] = name;
                params.put(paramCount, paramValues);
            }
            if (!brand.equalsIgnoreCase("all")) {
                sql += " AND brand = ?";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "STRING";
                paramValues[1] = brand;
                params.put(paramCount, paramValues);
            }
            if (priceFrom >= 0) {
                sql += " AND price >= ?";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "DOUBLE";
                paramValues[1] = priceFrom;
                params.put(paramCount, paramValues);
            }
            if (priceTo >= 0) {
                sql += " AND price <= ?";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "DOUBLE";
                paramValues[1] = priceTo;
                params.put(paramCount, paramValues);
            }
            sql += ") SELECT * FROM r WHERE r.rownum >= (? - 1) * ? + 1 AND r.rownum <= ? * ?";
            PreparedStatement st = con.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> values : params.entrySet()) {
                Integer index = values.getKey();
                Object[] value = values.getValue();
                switch (value[0].toString()) {
                    case "STRING":
                        st.setString(index, value[1].toString());
                        break;
                    case "DOUBLE":
                        st.setDouble(index, Double.parseDouble(value[1].toString()));
                        break;
                }
            }
            st.setInt(++paramCount, pageIndex);
            st.setInt(++paramCount, pageSize);
            st.setInt(++paramCount, pageIndex);
            st.setInt(++paramCount, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setPid(rs.getString("pid"));
                p.setPname(rs.getString("pname"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImage(rs.getString("image"));
                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getTotalSearchPro(String name, String brand, double priceFrom, double priceTo) {
        try {
            String sql = "SELECT COUNT (*) FROM dbo.Products WHERE 1 = 1";
            HashMap<Integer, Object[]> params = new HashMap<>();
            int paramCount = 0;
            if (name != null && !name.trim().isEmpty()) {
                sql += " AND pname LIKE ?";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "STRING";
                paramValues[1] = "%" + name + "%";
                params.put(paramCount, paramValues);
            }
            if (!brand.equalsIgnoreCase("all")) {
                sql += " AND brand = ?";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "STRING";
                paramValues[1] = brand;
                params.put(paramCount, paramValues);
            }
            if (priceFrom >= 0) {
                sql += " AND price >= ?";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "DOUBLE";
                paramValues[1] = priceFrom;
                params.put(paramCount, paramValues);
            }
            if (priceTo >= 0) {
                sql += " AND price <= ?";
                paramCount++;
                Object[] paramValues = new Object[2];
                paramValues[0] = "DOUBLE";
                paramValues[1] = priceTo;
                params.put(paramCount, paramValues);
            }
            System.out.println(sql);
            System.out.println(paramCount);
            PreparedStatement st = con.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> values : params.entrySet()) {
                Integer index = values.getKey();
                Object[] value = values.getValue();
                switch (value[0].toString()) {
                    case "STRING":
                        st.setString(index, value[1].toString());
                        System.out.println(value[1].toString());
                        break;
                    case "DOUBLE":
                        st.setFloat(index, Float.parseFloat(value[1].toString()));
                        System.out.println(value[1].toString());
                        break;
                }
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Product getProductbyID(String id) {
        Product p = null;
        String sql = "select* from Products where pid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getInt(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public int getProductStock(String typeID) {
        String sql = "select COUNT(tname)\n"
                + "from Products p inner join ProductType pt on pt.tid = p.typeid\n"
                + "where typeid = ? ";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, typeID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE Products\n"
                + "SET pname = ?,typeid = ?,brand = ?,image = ?,price = ?,stock = ?\n"
                + "WHERE pid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getPname());
            st.setString(2, p.getTypeid());
            st.setString(3, p.getBrandid());
            st.setString(4, p.getImage());
            st.setDouble(5, p.getPrice());
            st.setInt(6, p.getStock());
            st.setString(7, p.getPid());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeProduct(String id) {
        String sql = "DELETE FROM dbo.Products WHERE pid = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertProduct(Product p) {
        String sql = "INSERT INTO dbo.Products\n"
                + "        ( pid ,pname ,typeid ,brand ,image ,price ,stock)\n"
                + "VALUES  (?,?,?,?,?,?,? )";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, p.getPid());
            st.setString(2, p.getPname());
            st.setString(3, p.getTypeid());
            st.setString(4, p.getBrandid());
            st.setString(5, p.getImage());
            st.setDouble(6, p.getPrice());
            st.setInt(7, p.getStock());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Product> getProducts(String typeID, int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER(ORDER BY pid) AS rownum, * FROM Products p inner join "
                    + "ProductType pt on pt.tid = p.typeid\n"
                    + "where tname = ? ) "
                    + "SELECT * FROM r WHERE rownum >= (? - 1) * ? + 1 AND rownum <= ? * ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, typeID);
            st.setInt(2, pageIndex);
            st.setInt(3, pageSize);
            st.setInt(4, pageIndex);
            st.setInt(5, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setPid(rs.getString("pid"));
                product.setPname(rs.getString("pname"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setStock(rs.getInt("stock"));
                product.setTypeid(rs.getString("typeid"));
                product.setBrandid(rs.getString("brand"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getProducts(int pageIndex, int pageSize) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "WITH r AS (SELECT ROW_NUMBER() OVER(ORDER BY pid) AS rownum, * FROM Products) "
                    + "SELECT * FROM r WHERE rownum >= (? - 1) * ? + 1 AND rownum <= ? * ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, pageSize);
            st.setInt(3, pageIndex);
            st.setInt(4, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setPid(rs.getString("pid"));
                product.setPname(rs.getString("pname"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                product.setStock(rs.getInt("stock"));
                product.setTypeid(rs.getString("typeid"));
                product.setBrandid(rs.getString("brand"));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int getProductsCount() {
        int cnt = 0;
        try {
            String sql = "SELECT COUNT(*) FROM dbo.Products ";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnt;
    }

    public int getProductsCount(String typeID) {
        int cnt = 0;
        try {
            String sql = "SELECT COUNT(*) FROM dbo.Products p inner join ProductType pt on pt.tid = p.typeid\n"
                    + "where tname = ? ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, typeID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cnt = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnt;
    }
}
