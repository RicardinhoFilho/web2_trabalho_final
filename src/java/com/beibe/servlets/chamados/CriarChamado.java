/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.chamados;

import com.beibe.facade.ChamadoFacade;
import com.beibe.model.Cliente;
import com.beibe.model.Chamado;
import com.beibe.model.Produto;
import com.beibe.utils.exceptions.chamadosExceptions.CriarChamadoException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "CriarChamado", urlPatterns = {"/CriarChamado"})
public class CriarChamado extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try {
            String texto = request.getParameter("texto");
            String titulo = request.getParameter("titulo");
            Integer produto_id = Integer.parseInt(request.getParameter("produto_id"));

            HttpSession session = request.getSession(false);
            Cliente cliente = (Cliente) session.getAttribute("cliente");
            Chamado chamado = new Chamado();
            Produto produto = new Produto();

            chamado.setTexto(texto);
            chamado.setTitulo(titulo);
            produto.setId(produto_id);
            chamado.setProduto(produto);
            if (cliente != null) {
                 System.out.println("ESSE É O PRODUTO: " + chamado.getProduto().getId());
                chamado.setCliente(cliente);
                ChamadoFacade.criarChamado(chamado);
            }
            System.out.println("ESSA É A RESPOSTA: " + chamado.getTexto());

            response.sendRedirect("MeusChamados");

        } catch (CriarChamadoException ex) {
            System.out.println(ex);
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
