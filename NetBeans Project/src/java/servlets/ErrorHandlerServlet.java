/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 */
@WebServlet(name = "ErrorHandlerServlet", urlPatterns = {"/Error"})
public class ErrorHandlerServlet extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            
            String message = "Ops! Si è verificato un errore. Riprova più tardi";
        
          
            Integer statusCode = (Integer)request.getAttribute("javax.servlet.error.status_code");
            
            if(statusCode != null && statusCode == 405){
                message="Non puoi accedere in questo modo alla risorsa che hai richiesto";                
            }
            
            if(statusCode != null && statusCode == 404){
                message="La risorsa richiesta non è disponibile";                
            }
            
            
            
            request.getSession().setAttribute("dangerMessage", message);
            response.sendRedirect("/M.A.N.A.-Web-Project/index.jsp");
    }


}
