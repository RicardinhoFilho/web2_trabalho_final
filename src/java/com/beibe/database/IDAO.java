/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.beibe.database;

import com.beibe.utils.exceptions.DAOException;
import java.util.List;

/**
 *
 * @author User
 */
public interface IDAO<T> {

    public void criar(T vo) throws DAOException;
    
    public void atualizar(int id) throws DAOException;
    
    public void excluir(int id) throws DAOException;

    public List<T> listarTodos() throws DAOException;

}
