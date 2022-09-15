/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.categoria;

import com.beibe.facade.CategoriaFacade;
import com.beibe.model.Funcionario;
import com.beibe.utils.exceptions.categoriaExceptions.AtualizarCategoriaException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "EditarCategoria", urlPatterns = {"/EditarCategoria"})
public class AtualizarCategoria extends HttpServlet {

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

            String nome = request.getParameter("nome");
            Integer id = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession(false);
            Funcionario funcionario = (Funcionario) session.getAttribute("funcionario");

            if (funcionario != null) {

                CategoriaFacade.atualizarCategoria(nome, id);
                response.sendRedirect("ListaCategorias");

            } else {
                response.sendRedirect("login-funcionario.jsp");
            }

        } catch (AtualizarCategoriaException e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }catch(NumberFormatException e){
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
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
