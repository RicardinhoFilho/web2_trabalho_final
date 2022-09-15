package com.beibe.database.DAO;

import com.beibe.database.IDAOResposta;
import com.beibe.model.Funcionario;

import com.beibe.model.Resposta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.beibe.utils.exceptions.DAOException;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author User
 */
public class DAOResposta implements IDAOResposta {

    Connection conn = null;

    public DAOResposta(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void criar(Resposta vo) throws DAOException {

        try {
            PreparedStatement st = conn.prepareStatement("Insert into resposta( texto, chamado_id, funcionario_id) "
                    + "values(?, ?, ?)");

            if (vo.getFuncionario() == null) {
                st = conn.prepareStatement("Insert into resposta( texto, chamado_id) "
                        + "values(?, ?)");
            }

            st.setString(1, vo.getTexto());
            st.setDouble(2, vo.getId());
            if (vo.getFuncionario() != null) {
                st.setInt(3, vo.getFuncionario().getId());
            }
            System.out.println("DAO + " + vo.getTexto());
            st.execute();
        } catch (SQLException  e) {
            e.printStackTrace();
            throw new DAOException(e);
        }

    }

    @Override
    public List<Resposta> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Resposta> listaTodosPorChamado(Integer id) throws DAOException{
        List<Resposta> respostas = new ArrayList<Resposta>();
        try {

            PreparedStatement st = conn.prepareStatement("select * from resposta left join funcionario on funcionario.id   "
                    + "= funcionario_id where chamado_id = ? ");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            System.out.println(rs);
            while (rs.next()) {
                Resposta resposta = new Resposta();
                Funcionario funcionario = new Funcionario();
                resposta.setId(rs.getInt("id"));
                resposta.setTexto(rs.getString("texto"));
                resposta.setCriacao(rs.getDate("criacao"));

                if ((Integer) rs.getObject("funcionario_id") != null) {
                    funcionario.setId(rs.getInt("funcionario_id"));
                    funcionario.setNome(rs.getString("nome"));
                    funcionario.setSobrenome(rs.getString("sobrenome"));
                    funcionario.setEmail(rs.getString("email"));

                    resposta.setFuncionario(funcionario);

                }
                System.out.println("ID: " + id + resposta.getTexto());

                respostas.add(resposta);

            }

        } catch (SQLException  e) {
            e.printStackTrace();
            throw new DAOException(e);
        }

        return respostas;
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
