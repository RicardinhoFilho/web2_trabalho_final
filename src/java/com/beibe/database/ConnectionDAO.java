/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.database;

import com.beibe.utils.exceptions.DAOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class ConnectionDAO implements AutoCloseable {

    public Connection conectaDB() throws DAOException {
        Connection conn = null;

        try {
            //String url = "jdbc:mysql://localhost:3306/trabalho_lpoo2?user=root&password=root&useSSL=true";
             //Class.forName("com.mysql.cj.jdbc.Driver");
            Class.forName("com.mysql.jdbc.Driver"); /* Aqui registra */
            /* Aqui registra */
            String url = "jdbc:mysql://localhost:3306/beibe?user=root&password=teste&useSSL=false";
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DAOException(e);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new DAOException(e);
        }
        return conn;
    }
    
     
    @Override
    public void close() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
