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
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig
public class UploadServlet extends HttpServlet {

    private DBManager manager;

    @Override
    public void init() throws ServletException {

        this.manager = (DBManager) super.getServletContext().getAttribute("dbmanager");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Product prodotto = (Product) session.getAttribute("currentProduct");
        User user = (User) session.getAttribute("user");

        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String[] parts = fileName.split("\\.");
        String extension = parts[1];
        if (extension.equals("jpg") || extension.equals("jpeg") || extension.equals("png")) {
            InputStream fileContent = filePart.getInputStream();
            String dirName = this.getServletContext().getRealPath("/");
            String newDir = dirName.replace("/build", "") + "data/img/userImg";

            boolean result = false;
            try {
                result = manager.addPhoto(prodotto.getId(), "idUser=" + (user.getId()) + "_" + fileName, user.getId(), user.getFirstName() + " " + user.getlastName());
            } catch (SQLException ex) {
                Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (result) {
                Files.copy(fileContent, Paths.get(newDir + "/idUser=" + (user.getId()) + "_" + fileName));
                session.setAttribute("successMessage", "Fotografia inserita con successo!");
                response.sendRedirect("pagina_prodotto.jsp");
            } else {
                session.setAttribute("dangerMessage", "C'è stato un problema con l'upload!");
                response.sendRedirect("pagina_prodotto.jsp");
            }
        } else {
            session.setAttribute("dangerMessage", "Si accettano solo file nel formato .jpg o .png!");
            response.sendRedirect("pagina_prodotto.jsp");
            return;
        }
    }

}
