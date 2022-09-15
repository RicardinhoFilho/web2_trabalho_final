/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.facade;

import com.beibe.database.ConnectionDAO;
import com.beibe.model.Produto;
import com.beibe.database.DAO.DAOProduto;
import com.beibe.utils.exceptions.DAOException;
import com.beibe.utils.exceptions.produtosExceptions.ExcluirProdutoException;
import com.beibe.utils.exceptions.produtosExceptions.ListarProdutosException;
import java.util.List;

/**
 *
 * @author eduar
 */
public class ProdutosFacade {
    
    public static List<Produto> listarProdutos() throws ListarProdutosException{
        
        try{
            DAOProduto dao = new DAOProduto(new ConnectionDAO().conectaDB());
            return dao.listarTodos();
        }catch(DAOException e){
            System.out.println(e);
            throw new ListarProdutosException("Erro ao obter lista de produtos", e);
        }
        
    }
    
    public static void excluirProduto(int id) throws ExcluirProdutoException {
        try{
            DAOProduto dao = new DAOProduto(new ConnectionDAO().conectaDB());
            dao.excluirProduto(id);
        }catch(DAOException e){
            System.out.println(e);
            throw new ExcluirProdutoException("Erro ao excluir produto id =" + id, e);            
        }       
   
    }
}
