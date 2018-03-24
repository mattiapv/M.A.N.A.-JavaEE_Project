/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import db.Product;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 */
@WebServlet(name = "AddCart", urlPatterns = {"/AddCart"})
public class AddCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Product> previousItems = (ArrayList<Product>) session.getAttribute("previousItems");
        Product p = (Product) session.getAttribute("currentProduct");
        Double total = (Double) session.getAttribute("total");
        if (previousItems == null) {
            previousItems = new ArrayList<Product>();
        }
        if (total == null) {
            total = 0.0;
        }
        synchronized (previousItems) {
            if (p != null) {
                if (previousItems.size() > 0) {
                    for (Product p1 : previousItems) {
                        if (p1.getId() == p.getId()) {
                            p1.addQuantity();
                            total = total + (p.getPrice());
                        } else {
                            previousItems.add(p);
                            total = total + (p.getPrice());
                            break;
                        }
                    }
                } else {
                    previousItems.add(p);
                    total = total + (p.getPrice());
                }
            }
        }
        session.setAttribute("total", total);
        session.setAttribute("previousItems", previousItems);
        response.sendRedirect("cart.jsp");
    }
}
