/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.freesoftDevPeru.Controllers;

import com.freesoftDevPeru.Clases.Usuario;
import com.freesoftDevPeru.Dao.DaoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author José Maldonado <josephcand at gmail.com>
 */
public class cntrlLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            DaoUsuario objUser = new DaoUsuario();
            LinkedList<Usuario> usuario = objUser.listaUsuario(pass, user);
            Usuario usuarioSesion = new Usuario(usuario.get(0).getDni(), usuario.get(0).getNombreApellido(), usuario.get(0).getUsuario(), usuario.get(0).getPass(), usuario.get(0).getTipo());
            request.getSession().setAttribute("miUsuario", usuarioSesion);
            if (usuario.get(0).getUsuario().equalsIgnoreCase(user) && usuario.get(0).getPass().equalsIgnoreCase(pass)) {
                response.sendRedirect("webs/tramiteDocumentario.jsp");
//            RequestDispatcher d = request.getRequestDispatcher("webs/tramiteDocumentario.jsp");
//            d.include(request, response);

            }

            //response.sendRedirect("webs/tramiteDocumentario.jsp");
        } catch (ClassNotFoundException ex) {
            response.sendRedirect("webs/Error.jsp");
        } catch (SQLException ex) {
            response.sendRedirect("webs/Error.jsp");
        }
        catch (IndexOutOfBoundsException ex) {
            response.sendRedirect("webs/Error.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
