/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 */
@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        ArrayList<Product> previousItems = (ArrayList<Product>) session.getAttribute("previousItems");
        Double total = (Double) session.getAttribute("total");
        int id = Integer.parseInt(req.getParameter("idProdotto"));
        String button = (String) (req.getParameter("button"));

        if (button.equals("minus")) {
            for (Product p1 : previousItems) {
                if (p1.getId() == id) {
                    if (p1.getQuantity() == 1) {
                        previousItems.remove(p1);
                        total = total - (p1.getPrice());
                        break;
                    } else {
                        p1.subtractQuantity();
                        total = total - (p1.getPrice());
                        break;
                    }
                }
            }
        } else if (button.equals("plus")) {
            for (Product p1 : previousItems) {
                if (p1.getId() == id) {
                    p1.addQuantity();
                    total = total + (p1.getPrice());
                    break;
                }
            }
        } else if (button.equals("trash")) {
            for (Product p1 : previousItems) {
                if (p1.getId() == id) {
                    previousItems.remove(p1);
                    total = total - (p1.getPrice() * p1.getQuantity());
                    break;
                }
            }
        }

        session.setAttribute("total", total);
        session.setAttribute("previousItems", previousItems);
        resp.sendRedirect("cart.jsp");

    }
}
