/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.connection;

/**
 *
 * @author muril
 */
public class User {
    private String nome;
    private double mediaNota;
    
    public User(String nome, double mediaNota){
        this.nome = nome;
        this.mediaNota = mediaNota;
    }
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getMediaNota() {
        return mediaNota;
    }

    public void setMediaNota(double mediaNota) {
        this.mediaNota = mediaNota;
    }

   
    
}
