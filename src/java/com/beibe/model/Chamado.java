/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beibe.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author User
 */
public class Chamado {

    Integer id;
    String titulo;
    String texto;
    Date finalizado;
    Cliente cliente;
    List<Resposta> repostas = new ArrayList<Resposta>();
    Produto produto;
    Date criacao;

    public Chamado() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTexto() {
        return texto;
    }
    
    public Produto getProduto(){
        return produto;
    }
    
    public void setProduto(Produto produto){
      this.produto = produto;
    }


    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Date getFinalizado() {
        return finalizado;
    }

    public void setFinalizado(Date finalizado) {
        this.finalizado = finalizado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public List<Resposta> getRepostas() {
        return repostas;
    }

    public void setRepostas(List<Resposta> repostas) {
        this.repostas = repostas;
    }

    public Date getCriacao() {
        return criacao;
    }

    public void setCriacao(Date criacao) {
        this.criacao = criacao;
    }
}
