/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 */
@WebServlet(name = "LoadProduct", urlPatterns = {"/LoadProduct"})
public class LoadProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int id = Integer.parseInt(req.getParameter("idProdotto"));
        List<Product> products = (List<Product>) session.getAttribute("prodotti");
        for (Product p : products) {
            if (p.getId() == id) {
                session.setAttribute("currentProduct", p);
                response.sendRedirect("pagina_prodotto.jsp");
                return;
            }
        }

        session.setAttribute("infoMessage", "Non è stato trovato alcun prodotto che soddisfi i criteri di ricerca");
        response.sendRedirect("index.jsp");
    }
}
