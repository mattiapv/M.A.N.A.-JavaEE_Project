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
@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})
public class Checkout extends HttpServlet {

    private DBManager dbManager;

    @Override
    public void init() throws ServletException {
        dbManager = (DBManager) super.getServletContext().getAttribute("dbmanager");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("dangerMessage", "Devi aver fatto il login per poter acquistare");
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("checkout.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String nome = req.getParameter("name");
        String cardNumber = req.getParameter("cardNumber");
        String CVC = req.getParameter("CVC");
        String address = req.getParameter("address");
        String expiryMonth = req.getParameter("expiryMonth");
        String expiryYear = req.getParameter("expiryYear");

        if ("".equals(nome) || "".equals(cardNumber) || "".equals(address) || "".equals(CVC) || "Anno".equals(expiryYear) || "Mese".equals(expiryMonth)) {
            session.setAttribute("dangerMessage", "Per effettuare la registrazione occorre compilare tutti i campi!");
            response.sendRedirect("checkout.jsp");
            return;
        } else {
            cardNumber = cardNumber.replaceAll("[^0-9]+", "");

            if ((cardNumber.length() < 16) || (cardNumber.length() > 16)) {
                session.setAttribute("dangerMessage", "La carta deve contenere solo numeri e essere di 16 cifre!");
                response.sendRedirect("checkout.jsp");
                return;
            }
        }

        User user = (User) session.getAttribute("user");
        ArrayList<Product> previousItems = (ArrayList<Product>) session.getAttribute("previousItems");
        boolean OrdineResult = false;
        try {
            OrdineResult = dbManager.newOrder(user.getId(), user.getFirstName() + " " + user.getlastName(), previousItems);
        } catch (SQLException ex) {
            Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (OrdineResult) {
            session.removeAttribute("previousItems");
            session.setAttribute("infoMessage", "Ordine Effettuato con Successo");
            RequestDispatcher rd = req.getRequestDispatcher("/OrdersList");
            rd.forward(req, response);
        } else {
            session.setAttribute("dangerMessage", "C'è stato un problema con l'ordine");
            RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
            rd.forward(req, response);
        }

    }

}
