/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.DBManager;
import db.Product;
import db.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 */
@WebServlet(name = "LoadProducts", urlPatterns = {"/LoadProducts"})
public class LoadProducts extends HttpServlet {

    private DBManager dbManager;

    @Override
    public void init() throws ServletException {
        dbManager = (DBManager) super.getServletContext().getAttribute("dbmanager");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String nomeProdotto = (String) req.getParameter("nomeProdotto");
        String categoria = (String) req.getParameter("categoria");
        boolean dalistaprodotti = Boolean.parseBoolean(req.getParameter("dalistaprodotti"));
        String address = req.getParameter("address");
        if (dalistaprodotti & address.equals("")) {
            address = (String) session.getAttribute("addressSalvato");
        }
        double prezzo = Double.parseDouble(req.getParameter("price"));
        int rate = Integer.parseInt(req.getParameter("rate"));
        session.setAttribute("addressSalvato", address);
        String address1 = address.split(",")[0];
        String address2 = "";
        if (address.split(",").length > 1) {
            address2 = address.split(",")[1].trim();
        }
        

        try {
            List<Product> products = dbManager.getProducts(nomeProdotto, categoria, user);
            List<Product> productsFiltered = new ArrayList();
            for (Product p : products) {
                if ((p.getPrice() <= prezzo || prezzo == 0.0) && (p.getAvg_rate() == rate || rate == 0) && ((p.getShop().getAddress().toLowerCase().contains(address1.toLowerCase())) || (p.getShop().getAddress().toLowerCase().contains(address2.toLowerCase())))) {
                    productsFiltered.add(p);
                }
            }
            req.setAttribute("nomeProdotto", nomeProdotto);
            req.setAttribute("categoria", categoria);
            if (!productsFiltered.isEmpty()) {
                session.setAttribute("prodotti", productsFiltered);
                RequestDispatcher rd = req.getRequestDispatcher("/listaProdotti.jsp");
                rd.forward(req, response);
            } else {
                session.setAttribute("dangerMessage", "Non è stato trovato alcun prodotto che soddisfi i criteri di ricerca");
                session.removeAttribute("prodotti");
                RequestDispatcher rd = req.getRequestDispatcher("/listaProdottiVuota.jsp");
                rd.forward(req, response);

            }
        } catch (SQLException ex) {
            Logger.getLogger(LoadProducts.class.getName()).log(Level.SEVERE, ex.toString(), ex);
        }
    }
}
