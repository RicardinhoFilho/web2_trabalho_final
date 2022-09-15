/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.facade;

import com.beibe.database.ConnectionDAO;
import com.beibe.database.DAO.DAOFuncionario;
import com.beibe.model.Funcionario;
import com.beibe.utils.exceptions.DAOException;
import com.beibe.utils.exceptions.funcionarioExceptions.BuscarFuncionarioException;
import java.util.List;

/**
 *
 * @author eduar
 */
public class FuncionarioFacade {

    public static Funcionario buscaPorEmail(String email) throws BuscarFuncionarioException {

        try {
            
            DAOFuncionario dao = new DAOFuncionario(new ConnectionDAO().conectaDB());
            return dao.buscaPorEmail(email);

        } catch (DAOException e) {
            throw new BuscarFuncionarioException("Erro ao listar as categorias ", e);
        }
          
    }
    
    
     public static List<Funcionario> listarTodos() throws BuscarFuncionarioException {

        try {
            
            DAOFuncionario dao = new DAOFuncionario(new ConnectionDAO().conectaDB());
            return dao.listarTodos();

        } catch (DAOException e) {
            throw new BuscarFuncionarioException("Erro ao listar funcionarios ", e);
        }
          
    }
     
      public static void criar(Funcionario vo) throws BuscarFuncionarioException {

        try {
            
            DAOFuncionario dao = new DAOFuncionario(new ConnectionDAO().conectaDB());
            dao.criar(vo);
            return ;

        } catch (DAOException e) {
            throw new BuscarFuncionarioException("Erro ao criar funcionarios ", e);
        }
          
    }
}
