/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Cart;
import model.Item;
import model.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dal.ProductDAO;
import java.text.DecimalFormat;

/**
 *
 * @author Five Swag
 */
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int quantity = 1;
            String id = "";
            ProductDAO pdb = new ProductDAO();
            if (request.getParameter("pid") != null) {
                id = request.getParameter("pid");
                Product p = pdb.getProductbyID(id);
                String type = request.getParameter("title");
                if (p != null) {
                    HttpSession session = request.getSession(true);
                    if (session.getAttribute("cart") == null) {
                        Cart cart = new Cart();
                        List<Item> listItems = new ArrayList<>();
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setProduct(p);
                        item.setPrice(p.getPrice());
                        listItems.add(item);
                        cart.setItems(listItems);
                        session.setAttribute("cart", cart);
                        session.setAttribute("noOfItems", listItems.size());
                    } else {
                        Cart cart = (Cart) session.getAttribute("cart");
                        List<Item> listItems = cart.getItems();
                        boolean check = false;
                        for (Item item : listItems) {
                            if (item.getProduct().getPid().equalsIgnoreCase(id)) {
                                if (item.getProduct().getStock() == item.getQuantity()) {
                                    item.setQuantity(item.getProduct().getStock());
                                } else {
                                    item.setQuantity(item.getQuantity() + 1);
                                }
                                check = true;
                            }
                        }
                        if (check == false) {
                            Item item = new Item();
                            item.setProduct(p);
                            item.setQuantity(quantity);
                            item.setPrice(p.getPrice());
                            listItems.add(item);
                        }
                        Double total = 0.0;
                        for (Item i : listItems) {
                            total += i.getPrice() * i.getQuantity();
                        }
                        DecimalFormat df = new DecimalFormat("#.##");
                        session.setAttribute("cart", cart);
                        session.setAttribute("itemList", listItems);
                        session.setAttribute("total", df.format(total));
                    }

                    String path = "getMerch?name=" + type;
                    if (type.equalsIgnoreCase("All Products")) {
                        path = "getMerch";
                    }
                    response.sendRedirect(path);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        Item item = new Item(new Product(id), 1, 1);
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.removeItem(item);
            response.sendRedirect("cart.jsp");
        } else {
            response.getWriter().print("ERROR");
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
