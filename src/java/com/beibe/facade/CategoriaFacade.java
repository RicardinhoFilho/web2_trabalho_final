/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.facade;

import com.beibe.database.ConnectionDAO;
import com.beibe.database.DAO.DAOCategoria;
import com.beibe.model.Categoria;
import com.beibe.utils.exceptions.categoriaExceptions.AtualizarCategoriaException;
import com.beibe.utils.exceptions.categoriaExceptions.CriarCategoriaException;
import com.beibe.utils.exceptions.DAOException;
import com.beibe.utils.exceptions.categoriaExceptions.ExcluirCategoriaException;
import com.beibe.utils.exceptions.categoriaExceptions.ListarCategoriasException;
import java.util.List;

/**
 *
 * @author eduar
 */
public class CategoriaFacade {

    public static void criarCategoria(String nome) throws CriarCategoriaException {
        try {
            DAOCategoria dao = new DAOCategoria(new ConnectionDAO().conectaDB());
            Categoria categoria = new Categoria();
            categoria.setNome(nome);
            dao.criar(categoria);

        } catch (DAOException e) {
            throw new CriarCategoriaException("Erro ao criar categoria " + nome, e);
        }

    }

    public static void atualizarCategoria(String nome, Integer id) throws AtualizarCategoriaException {
        try {
            DAOCategoria dao = new DAOCategoria(new ConnectionDAO().conectaDB());
            Categoria categoria = new Categoria();
            categoria.setNome(nome);
            categoria.setId(id);
            dao.editar(categoria);

        } catch (DAOException e) {
            throw new AtualizarCategoriaException("Erro ao atualizar categoria " + nome, e);
        }
    }

    public static void excluirCategoria(Integer id) throws ExcluirCategoriaException {
        try {
            DAOCategoria dao = new DAOCategoria(new ConnectionDAO().conectaDB());
            dao.excluir(id);

        } catch (DAOException e) {
            throw new ExcluirCategoriaException("Erro ao excluir categoria id =" + id, e);
        }
    }

    public static List<Categoria> listarCategorias() throws ListarCategoriasException {
        try {
            
            DAOCategoria dao = new DAOCategoria(new ConnectionDAO().conectaDB());
            return dao.listarTodos();

        } catch (DAOException e) {
            throw new ListarCategoriasException("Erro ao listar as categorias ", e);
        }
    }

}
