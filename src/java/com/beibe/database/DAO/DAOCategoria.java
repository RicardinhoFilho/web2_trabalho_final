/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.database.DAO;


import com.beibe.database.ICategoriaDAO;
import com.beibe.model.Categoria;
import com.beibe.utils.exceptions.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class DAOCategoria implements ICategoriaDAO {

    Connection conn = null;

    public DAOCategoria(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void criar(Categoria vo) throws DAOException {
        try {
            PreparedStatement st = conn.prepareStatement("insert into categorias (nome)values(?);");

            st.setString(1, vo.getNome());
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
    }

    public void editar(Categoria vo) throws DAOException {
        try {
            PreparedStatement st = conn.prepareStatement("update  categorias set nome = ? where id = ? ;");

            st.setString(1, vo.getNome());
            st.setInt(2, vo.getId());
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
    }



    public void excluir(int id) throws DAOException {
        try {
            PreparedStatement st = conn.prepareStatement("delete from categorias where id = ?;");

            st.setInt(1, id);
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }

    }

    @Override
    public List<Categoria> listarTodos() throws DAOException {
        List<Categoria> categorias = new ArrayList<Categoria>();
        try {

            ResultSet rs = (conn.createStatement().executeQuery("select * from categorias"));
            while (rs.next()) {

                Categoria categoria = new Categoria();

                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
                categoria.setCreated_at(rs.getDate("created_at"));

                categorias.add(categoria);

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return categorias;

    }

    @Override
    public void atualizar(int id) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
