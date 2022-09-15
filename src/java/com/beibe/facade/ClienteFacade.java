/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.facade;

import com.beibe.database.ConnectionDAO;
import com.beibe.database.DAO.DAOCliente;
import com.beibe.model.Cliente;
import com.beibe.utils.exceptions.DAOException;
import com.beibe.utils.exceptions.clienteExceptions.BuscarClienteException;

/**
 *
 * @author eduar
 */
public class ClienteFacade  {
    public static Cliente buscaPorEmail(String email) throws BuscarClienteException{ 
        try {

            DAOCliente dao = new DAOCliente(new ConnectionDAO().conectaDB());
            return dao.buscaPorEmail(email);

        } catch (DAOException e) {
            throw new BuscarClienteException("Erro ao listar as categorias ", e);
        }

    }
    
    
     public static void criarCliente(Cliente cliente) throws BuscarClienteException{ 
        try {

            DAOCliente dao = new DAOCliente(new ConnectionDAO().conectaDB());
         dao.criar(cliente);
             return;

        } catch (DAOException e) {
            throw new BuscarClienteException("Erro ao listar as categorias ", e);
        }

    }
     
     public static void editarCliente(Cliente cliente) throws BuscarClienteException{ 
        try {

            DAOCliente dao = new DAOCliente(new ConnectionDAO().conectaDB());
         dao.editar(cliente);
             return;

        } catch (DAOException e) {
            throw new BuscarClienteException("Erro ao listar as categorias ", e);
        }

    }
    
}
