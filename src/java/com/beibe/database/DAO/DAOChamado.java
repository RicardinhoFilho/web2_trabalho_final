/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.database.DAO;

import com.beibe.database.ConnectionDAO;
import com.beibe.database.IChamadoDAO;
import com.beibe.model.Chamado;
import com.beibe.model.Cliente;
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
public class DAOChamado implements IChamadoDAO {

    Connection conn = null;

    public DAOChamado(Connection conn) {
        this.conn = conn;
    }

    @Override
    public void criar(Chamado vo) throws DAOException {

        try {
            PreparedStatement st = conn.prepareStatement("insert into chamado (titulo,texto, cliente_id, produto_id)values(?,?,?,?)");
            st.setString(1, vo.getTitulo());
            st.setString(2, vo.getTexto());
            st.setInt(3, vo.getCliente().getId());
            st.setInt(4, vo.getProduto().getId());

            st.execute();
        } catch (SQLException e) {
            throw new DAOException(e);
        }
    }

    public List<Chamado> listaMeusChamados(Integer user_id) throws DAOException {

        List<Chamado> chamados = new ArrayList<Chamado>();
        try {

            PreparedStatement st = conn.prepareStatement("select * from chamado inner join cliente on cliente_id = cliente.id where cliente.id = ?");
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Chamado chamado = new Chamado();
                Cliente cliente = new Cliente();
                chamado.setId(rs.getInt("id"));
                chamado.setTitulo(rs.getString("titulo"));
                chamado.setTexto(rs.getString("texto"));
                chamado.setFinalizado(rs.getDate("finalizado"));
                chamado.setCriacao(rs.getDate("criacao"));
                cliente.setId(rs.getInt("cliente_id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setSobrenome(rs.getString("sobrenome"));
                cliente.setEmail(rs.getString("email"));

                chamado.setCliente(cliente);
                DAOResposta daoResposta = new DAOResposta(new ConnectionDAO().conectaDB());

                chamado.setRepostas(daoResposta.listaTodosPorChamado(chamado.getId()));

                chamados.add(chamado);

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return chamados;

    }

    public List<Chamado> listarTodos() throws DAOException {

        List<Chamado> chamados = new ArrayList<Chamado>();
        try {

            ResultSet rs = (conn.createStatement().executeQuery("select * from chamado inner join cliente on cliente_id = cliente.id"));
            while (rs.next()) {

                Chamado chamado = new Chamado();
                Cliente cliente = new Cliente();
                chamado.setId(rs.getInt("id"));
                chamado.setTitulo(rs.getString("titulo"));
                chamado.setTexto(rs.getString("texto"));
                chamado.setFinalizado(rs.getDate("finalizado"));
                chamado.setCriacao(rs.getDate("criacao"));
                cliente.setId(rs.getInt("cliente_id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setSobrenome(rs.getString("sobrenome"));
                cliente.setEmail(rs.getString("email"));

                chamado.setCliente(cliente);
                DAOResposta daoResposta = new DAOResposta(new ConnectionDAO().conectaDB());

                chamado.setRepostas(daoResposta.listaTodosPorChamado(chamado.getId()));

                chamados.add(chamado);

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return chamados;

    }

    @Override
    public void excluir(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void atualizar(int id) throws DAOException {
        try {
            PreparedStatement st = conn.prepareStatement("update chamado set finalizado = CURRENT_TIMESTAMP where id = ?;");
            st.setInt(1, id);
            st.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
    }

    public int emAberto() throws DAOException {

        int chamados = 0;
        try {

            ResultSet rs = (conn.createStatement().executeQuery("select count(*) as total from chamado where finalizado is null"));
            while (rs.next()) {

                chamados = rs.getInt("total");

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return chamados;

    }

    public double tempoResolucao() throws DAOException {

        double chamados = 0;
        try {

            ResultSet rs = (conn.createStatement().executeQuery("select avg(TIMESTAMPDIFF(HOUR,criacao,finalizado  )) as total from chamado where finalizado is not null"));
            while (rs.next()) {

                chamados = rs.getDouble("total");

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return chamados;

    }

    public int atrasados() throws DAOException {

        int chamados = 0;
        try {

            ResultSet rs = (conn.createStatement().executeQuery("SELECT count(*) as total FROM chamado where criacao < CURDATE() and finalizado is not null;"));
            while (rs.next()) {

                chamados = rs.getInt("total");
                    
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return chamados;

    }

    public int fechadosHoje() throws DAOException {

        int chamados = 0;
        try {

            ResultSet rs = (conn.createStatement().executeQuery("SELECT count(*) as total FROM chamado where finalizado > CURDATE() ;"));
            while (rs.next()) {

                chamados = rs.getInt("total");

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return chamados;

    }

}
