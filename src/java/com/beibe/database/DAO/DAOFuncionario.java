/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.database.DAO;

import com.beibe.database.IFuncionarioDAO;
import com.beibe.model.Funcionario;
import com.beibe.utils.exceptions.DAOException;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class DAOFuncionario implements IFuncionarioDAO {

    Connection conn = null;

    public DAOFuncionario(Connection conn) {
        this.conn = conn;
    }

    public void criar(Funcionario vo) throws DAOException {

        try {
            PreparedStatement st = conn.prepareStatement("Insert into FUNCIONARIO( nome, sobrenome, email, senha, admin) "
                    + "values(?, ?, ?,?,?)");
            st.setString(1, vo.getNome());
            st.setString(2, vo.getSobrenome());
            st.setString(3, vo.getEmail());
            st.setString(4, vo.getSenha());
            st.setBoolean(5, vo.isAdmin());
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }

    }

    public Funcionario buscaPorEmail(String email) throws DAOException{
        Funcionario funcionario = new Funcionario();

        try {

            PreparedStatement st = conn.prepareStatement("select * from FUNCIONARIO where email = ?");
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                funcionario.setId(rs.getInt("id"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setSobrenome(rs.getString("sobrenome"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setAdmin(rs.getBoolean("admin"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return funcionario;
    }

    public List<Funcionario> listarTodos() throws DAOException{
        List<Funcionario> funcionarios = new ArrayList<Funcionario>();
        try {
            Statement st = conn.createStatement();

            ResultSet rs = (st.executeQuery("select * from funcionario order by nome"));

            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setId(rs.getInt("id"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setSobrenome(rs.getString("sobrenome"));
                funcionario.setEmail(rs.getString("email"));
                funcionario.setSenha(rs.getString("senha"));
                funcionario.setAdmin(rs.getBoolean("admin"));

                funcionarios.add(funcionario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return funcionarios;
    }

    @Override
    public void atualizar(int id) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void excluir(int id) throws DAOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
