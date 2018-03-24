/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.DBManager;
import db.Order;
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
@WebServlet(name = "OrdersListSeller", urlPatterns = {"/OrdersListSeller"})
public class OrdersListSeller extends HttpServlet {

      private DBManager manager;

    @Override
    public void init() throws ServletException {

        this.manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGetPost(req, resp);
    }

    //è possibile invocare la servlet anche attraverso una richiesta in GET
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGetPost(req, resp);
    }

    //il codice viene eseguito anche se l'utente o venditore digita il nome della servlet sulla barra degli indirizzi
    protected void doGetPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<Order> orders = null;
        User user = (User) session.getAttribute("user");
        try {
            orders = manager.getOrdersSeller(user);
            session.setAttribute("ordiniVenditore", orders);
            RequestDispatcher rd = req.getRequestDispatcher("/gestioneOrdiniVenditore.jsp");
            rd.forward(req, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}