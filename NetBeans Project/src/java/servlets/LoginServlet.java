package servlets;

import db.DBManager;
import db.User;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    private DBManager manager;

    @Override
    public void init() throws ServletException {
        // inizializza il DBManager dagli attributi di Application
        this.manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession(true);

        // controllo nel DB se esiste un utente con lo stesso username + password
        User user;
        try {
            user = manager.autenticazione(email, password);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
        // se non esiste, ridirigo verso pagina di login con messaggio di errore
        if (user == null) {
            // metto il messaggio di errore come attributo di Request, così nel JSP si vede il messaggio
            session.setAttribute("dangerMessage", "Username/password non esistente !");
            resp.sendRedirect("login.jsp");

        } else {

            // se nessuna delle condizioni precedenti è verificata, imposto l'utente connesso come attributo di sessione
            session.setAttribute("user", user);
            session.setAttribute("infoMessage", "Mana ti dà il benvenuto, " + user.getFirstName()+ "!");
            resp.sendRedirect("index.jsp");
        }
    }

}
