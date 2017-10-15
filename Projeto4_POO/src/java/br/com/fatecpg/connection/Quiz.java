/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.connection;

import java.util.ArrayList;

/**
 *
 * @author Muca
 */
public class Quiz {
    private int quantidade;
    private double soma;
    private String usuarioTestado;
    public double getMedia(){
        return (soma / (double) quantidade)*10;
    }
    private static ArrayList <Questao> questoes;
    public static ArrayList <Questao> getQuestoes(){
        if(questoes == null){
            questoes = new ArrayList<>();
            for(int i = 1; i <= 10; i++){
                Questao q = new Questao("1 + " + i + "?", "" + (1 + i), new String[]{""+(i + 1), ""+(i - 1), "" + i});
                questoes.add(q);
            }
        }
        return questoes;
    }
    public Quiz(int quantidade, double soma, String usuarioTestado) {
        this.quantidade = quantidade;
        this.soma = soma;
        this.usuarioTestado = usuarioTestado;
    }
    
    public String getUsuarioTestado(){
        return usuarioTestado;
    }
}
