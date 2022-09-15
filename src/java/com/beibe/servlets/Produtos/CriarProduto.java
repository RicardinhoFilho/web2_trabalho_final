/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beibe.servlets.Produtos;

import com.beibe.database.ConnectionDAO;
import com.beibe.database.DAO.DAOProduto;
import com.beibe.model.Funcionario;
import com.beibe.model.Produto;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author User
 */
@WebServlet(name = "CriarProduto", urlPatterns = {"/CriarProduto"})
public class CriarProduto extends HttpServlet {

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
            HttpSession session = request.getSession(false);
            Funcionario funcionario = (Funcionario) session.getAttribute("funcionario");

            if (funcionario != null) {
                String nome = request.getParameter("nome");
                Integer saldo = Integer.parseInt(request.getParameter("saldo"));
                Date validade = new Date();// new SimpleDateFormat("yyy/MM/dd").parse(request.getParameter("validade"));
                Double preco = Double.parseDouble(request.getParameter("preco"));

                DAOProduto dao = new DAOProduto(new ConnectionDAO().conectaDB());
                Produto produto = new Produto();
                produto.setNome(nome);
                produto.setValidade(validade);
                produto.setPreco(preco);
                produto.setSaldo(saldo);
                dao.criar(produto);
            }

            response.sendRedirect("ListaProdutos");

        } catch (Exception e) {
            System.out.println(e);
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
