/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.cliente;

import com.beibe.facade.ClienteFacade;
import com.beibe.model.Cliente;
import com.beibe.utils.PasswordEncrypter;
import com.beibe.utils.exceptions.ErroEncriptacaoException;
import com.beibe.utils.exceptions.clienteExceptions.BuscarClienteException;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
@WebServlet(name = "EditarCliente", urlPatterns = {"/EditarCliente"})
public class EditarCliente extends HttpServlet {

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
            request.setCharacterEncoding("UTF-8");
      String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");

        //Boolean isAdmin = request.getParameter("admin").equals("1") ? true : false;
        String senha = request.getParameter("senha");
        HttpSession session = request.getSession(false);

        try {
              Cliente cliente= (Cliente) session.getAttribute("cliente");
            
            cliente.setEmail(email);
            cliente.setNome(nome);
            cliente.setSenha(PasswordEncrypter.realizaEncriptacao(senha));
            cliente.setSobrenome(sobrenome);

            ClienteFacade.editarCliente(cliente);
             session.setAttribute("cliente", cliente);
                    response.sendRedirect("index.jsp");
            return;
        } catch (BuscarClienteException e) {
            request.setAttribute("msg", "N??o foi poss??vel fazer cadastro!");

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login-cliente.jsp");
            rd.forward(request, response);
            return;
        } catch (ErroEncriptacaoException ex) {
            request.setAttribute("msg", "N??o foi poss??vel fazer cadastro!");

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login-cliente.jsp");
            rd.forward(request, response);
            return;
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
