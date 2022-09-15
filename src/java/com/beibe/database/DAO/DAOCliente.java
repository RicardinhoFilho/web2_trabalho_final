/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.database.DAO;

import com.beibe.database.IClienteDAO;
import com.beibe.model.Cliente;
import com.beibe.utils.exceptions.DAOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author User
 */
public class DAOCliente implements IClienteDAO {

    Connection conn = null;

    public DAOCliente(Connection conn) {
        this.conn = conn;
    }

    @Override
    public Cliente buscaPorEmail(String email) throws DAOException {
        Cliente cliente = new Cliente();

        try {

            PreparedStatement st = conn.prepareStatement("select * from  cliente  where email = ?");
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            System.out.println(rs);
            while (rs.next()) {
                System.out.println(" CHEGOU AQUI no while");
                System.out.println(rs.getString("nome"));

                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setSobrenome(rs.getString("sobrenome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setSenha(rs.getString("senha"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return cliente;

    }

    @Override
    public List listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void excluir(int id) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void criar(Cliente vo) throws DAOException {
        try {
            System.out.println(vo.getNome() + vo.getEmail() + vo.getSenha() + "" + vo.getSobrenome());
            PreparedStatement st = conn.prepareStatement("insert into cliente(nome, sobrenome, email, senha) "
                    + "values(?,?,?,?)");
            st.setString(1, vo.getNome());
            st.setString(2, vo.getSobrenome());
            st.setString(3, vo.getEmail());
            st.setString(4, vo.getSenha());
            st.execute();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
    }

    @Override
    public void editar(Cliente vo) throws DAOException {
        try {
            System.out.println(vo.getNome() + vo.getEmail() + vo.getSenha() + "" + vo.getSobrenome());
            PreparedStatement st = conn.prepareStatement("update cliente set nome = ? , sobrenome = ?, email = ?, senha = ? "
                    + "where id = ? ;");
            st.setString(1, vo.getNome());
            st.setString(2, vo.getSobrenome());
            st.setString(3, vo.getEmail());
            st.setString(4, vo.getSenha());
            st.setInt(5, vo.getId());
            st.execute();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return;
    }

    @Override
    public void atualizar(int id) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
