/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.utils;

import com.beibe.utils.exceptions.ErroEncriptacaoException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author eduar
 */
public class PasswordEncrypter {

    private static byte[] getSHA(String input) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    private static String toHexString(byte[] hash) {

        BigInteger number = new BigInteger(1, hash);

        StringBuilder hexString = new StringBuilder(number.toString(16));

        while (hexString.length() < 32) {
            hexString.insert(0, '0');
        }

        return hexString.toString();
    }

    public static String realizaEncriptacao(String password) throws ErroEncriptacaoException {

        try {
            return toHexString(getSHA(password));
        } catch (NoSuchAlgorithmException e) {
            throw new ErroEncriptacaoException("Ocorreu um erro ao encriptar a senha", e);
        }
    }
}
