/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.beibe.database;

import com.beibe.model.Cliente;
import com.beibe.utils.exceptions.DAOException;

/**
 *
 * @author User
 */
public interface IClienteDAO extends IDAO<Cliente>{
    
    Cliente buscaPorEmail(String email) throws DAOException;
    
    void editar(Cliente vo) throws DAOException;
    
}
