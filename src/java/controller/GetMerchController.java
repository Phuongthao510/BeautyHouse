/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BrandDAO;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dal.ProductDAO;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Brand;
import model.Cart;
import model.Item;

/**
 *
 * @author Five Swag
 */
public class GetMerchController extends HttpServlet {

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
        HttpSession session = request.getSession();
        BrandDAO adb = new BrandDAO();
        List<Brand> aList = adb.getAllBrands();
        ProductDAO pdb = new ProductDAO();
        Object obj = session.getAttribute("cart");
        int noOfItems = 0;
        if (obj != null) {
            Cart cart = (Cart) obj;
            ArrayList<Item> list = (ArrayList<Item>) cart.getItems();
            noOfItems = list.size();
        }
        String type = request.getParameter("name");
        String page = request.getParameter("page");
        page = (page == null || page.trim().isEmpty()) ? "1" : page;
        int pageIndex = Integer.parseInt(page);
        int pageSize = 6;
        int totalProducts = 0;
        int totalPages = 0;
        ArrayList<Product> products = null;

        if (type == null) {
            products = pdb.getProducts(pageIndex, pageSize);
            type = "All Products";
            totalProducts = pdb.getProductsCount();
            totalPages = totalProducts % pageSize == 0 ? totalProducts / pageSize : totalProducts / pageSize + 1;
        } else {
            products = pdb.getProducts(type, pageIndex, pageSize);
            totalProducts = pdb.getProductsCount(type);
            totalPages = totalProducts % pageSize == 0 ? totalProducts / pageSize : totalProducts / pageSize + 1;
        }
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("products", products);
        request.setAttribute("title", type);
        request.setAttribute("aList", aList);
        request.setAttribute("noOfItems", noOfItems);
        request.getRequestDispatcher("merch.jsp").forward(request, response);
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
        String type = request.getParameter("name");
        ProductDAO pdb = new ProductDAO();
        String brand = request.getParameter("brand");
        String search = request.getParameter("search");
        String price = request.getParameter("price");
        request.setAttribute("title", type);
        request.setAttribute("search", search);
        request.setAttribute("price", price);
        request.setAttribute("brand", brand);
        request.getRequestDispatcher("merch.jsp").forward(request, response);

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
