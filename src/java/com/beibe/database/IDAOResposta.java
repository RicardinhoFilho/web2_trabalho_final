/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.beibe.database;

import com.beibe.model.Resposta;
import com.beibe.utils.exceptions.DAOException;
import java.util.List;

/**
 *
 * @author User
 */
public interface IDAOResposta extends IDAO<Resposta> {
    
    List<Resposta> listaTodosPorChamado(Integer id) throws DAOException;
}
