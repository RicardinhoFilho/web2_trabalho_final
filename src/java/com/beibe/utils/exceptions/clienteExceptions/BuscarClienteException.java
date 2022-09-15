/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.utils.exceptions.clienteExceptions;

/**
 *
 * @author eduar
 */

public class BuscarClienteException extends Exception {
    public BuscarClienteException(String mensagem, Throwable thrwbl){
        super(mensagem, thrwbl);
    }
}

