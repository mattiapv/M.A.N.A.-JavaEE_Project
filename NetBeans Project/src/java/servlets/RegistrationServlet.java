/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import db.DBManager;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 */
@WebServlet(name = "RegistrationServlet", urlPatterns = {"/Registrazione"})
public class RegistrationServlet extends HttpServlet {

    private DBManager manager;

    @Override
    public void init() throws ServletException {
        // inizializza il DBManager dagli attributi di Application
        this.manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String email = req.getParameter("email");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");

        //se uno qualsiasi dei campi del form di registrazione non è stato compilato, l'utente è rimandato alla pagina di registrazione
        if ("".equals(email) || "".equals(password1) || "".equals(password2) || "".equals(firstName) || "".equals(lastName)) {
            session.setAttribute("dangerMessage", "Per effettuare la registrazione occorre compilare tutti i campi!");
            resp.sendRedirect("registrazione.jsp");
            return;
        }

        //blocco eseguito se le due password inserite sono diverse
        if (!password1.equals(password2)) {
            session.setAttribute("dangerMessage", "Le due password inserite sono diverse!");
            resp.sendRedirect("registrazione.jsp");
            return;
        }

        boolean esistente;
        try {
            esistente = manager.newUser(email, firstName, lastName, password1);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
        //se esiste un utente comn la stessa mail, ridirigo verso pagina di registrazione con messaggio di errore
        if (esistente) {
            // metto il messaggio di errore come attributo di Request, così nel JSP si vede il messaggio
            session.setAttribute("warningMessage", "Username o email già registrata!");
            resp.sendRedirect("registrazione.jsp");
        } else {
            req.getSession().setAttribute("successMessage", "Iscrizione confermata");
            resp.sendRedirect("registrazione.jsp");
        }
    }
}
