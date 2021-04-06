/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dal.ProductDAO;
import dal.ProductTypeDAO;
import java.util.ArrayList;
import model.ProductType;

/**
 *
 * @author Five Swag
 */
public class ViewStockController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductTypeDAO ptdb = new ProductTypeDAO();
        List<ProductType> typeList = ptdb.getAllTypes();
        request.setAttribute("typeList", typeList);
        ProductDAO pdb = new ProductDAO();
        request.setAttribute("pdb", pdb);
        List<Product> listAll = pdb.getAllProducts();
        request.setAttribute("listAll", listAll);
        String page = request.getParameter("page");
        page = (page == null || page.trim().isEmpty()) ? "1" : page;
        int pageIndex = Integer.parseInt(page);
        int pageSize = 5;
        int totalProducts = 0;
        int totalPages = 0;
        ArrayList<Product> products = pdb.getProducts(pageIndex, pageSize);;
        totalProducts = pdb.getProductsCount();
        totalPages = totalProducts % pageSize == 0 ? totalProducts / pageSize : totalProducts / pageSize + 1;

        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pList", products);
        request.getRequestDispatcher("viewStock.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pdb = new ProductDAO();
        String productType = request.getParameter("productType");
        String page = request.getParameter("page");
        page = (page == null || page.trim().isEmpty()) ? "1" : page;
        int pageIndex = Integer.parseInt(page);
        int pageSize = 5;
        int totalProducts = 0;
        int totalPages = 0;
        ArrayList<Product> products = null;
        if (productType.equalsIgnoreCase("all")) {
            products = pdb.getProducts(pageIndex, pageSize);;
            totalProducts = pdb.getProductsCount();
            totalPages = totalProducts % pageSize == 0 ? totalProducts / pageSize : totalProducts / pageSize + 1;
        } else {
            products = pdb.getProducts(productType, pageIndex, pageSize);;
            totalProducts = pdb.getProductsCount(productType);
            totalPages = totalProducts % pageSize == 0 ? totalProducts / pageSize : totalProducts / pageSize + 1;
        }
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pList", products);
//        request.setAttribute("pList", list);
        request.setAttribute("typeN", productType);
        request.getRequestDispatcher("viewStock.jsp").forward(request, response);
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
