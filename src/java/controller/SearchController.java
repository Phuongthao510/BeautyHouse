/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Five Swag
 */
public class SearchController extends HttpServlet {
    
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
        String page = request.getParameter("page");
        page = page == null || page.trim().isEmpty() ? "1" : page;
        int pageIndex = Integer.parseInt(page);
        int pageSize = 6;
        ProductDAO pdb = new ProductDAO();
        String search = request.getParameter("search");
        String brand = request.getParameter("brand");
        double priceFrom = Double.parseDouble(request.getParameter("priceFrom"));
        double priceTo = Double.parseDouble(request.getParameter("priceTo"));
        ArrayList<Product> products = pdb.searchProduct(search, brand, priceFrom, priceTo, pageIndex, pageSize);
        int totalProds = pdb.getTotalSearchPro(search, brand, priceFrom, priceTo);
        int totalPages = totalProds % pageSize == 0 ? totalProds / pageSize : totalProds / pageSize + 1;
        request.setAttribute("search", search);
        request.setAttribute("brand", brand);
        request.setAttribute("priceFrom", priceFrom);
        request.setAttribute("priceTo", priceTo);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("products", products);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
