package servlets;

import db.DBManager;
import java.io.IOException;
import java.sql.SQLException;
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
@WebServlet(name = "InviaAnomalia", urlPatterns = {"/InviaAnomalia"})
public class InviaAnomalia extends HttpServlet {

    private DBManager manager;

    @Override
    public void init() throws ServletException {

        this.manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        String nomeProdotto = req.getParameter("nomeProdotto");
        int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
        int idOrder = Integer.parseInt(req.getParameter("idOrder"));
        req.setAttribute("nomeProdotto", nomeProdotto);
        req.setAttribute("idProdotto", idProdotto);
        req.setAttribute("idOrder", idOrder);
        RequestDispatcher rd = req.getRequestDispatcher("/segnalazione_Anomalie.jsp");
        rd.forward(req, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String anomalia = req.getParameter("anomalia");
        int orderStatus = Integer.parseInt(req.getParameter("orderStatus"));
        int idOrder = Integer.parseInt(req.getParameter("idOrder"));
        int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
        try {
            manager.InvioAnomalia(orderStatus, anomalia, idOrder, idProdotto);
            session.setAttribute("successMessage", "Segnalazione Inviata");
            response.sendRedirect("OrdersList");
        } catch (SQLException ex) {
            Logger.getLogger(InviaAnomalia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
