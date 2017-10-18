/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.connection;

import java.util.ArrayList;
import java.util.Collections;

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
            Questao q1 = new Questao("Qual a cobra mais venenosa do mundo?",
                         "Taipan ", new String[]{"Taipan ","Coral verdadeira ","Cascavel "});
            questoes.add(q1);
            
            Questao q2 = new Questao("A raça 'Mustangue' pertence a que animal?",
                         "Cavalo ", new String[]{"Boi ","Rinoceronte ","Cavalo "});
            questoes.add(q2);
            
            Questao q3 = new Questao("Qual é o animal terrestre mais rápido do mundo?",
                         "Guepardo ", new String[]{"Coiote ","Leão ","Guepardo "});
            questoes.add(q3);
            
            Questao q4 = new Questao("Qual é o animal mais ruidoso do mundo?",
                         "Baleia Azul ", new String[]{"Cachorro ","Baleia Azul ","Hiena "});
            questoes.add(q4);
            
            Questao q5 = new Questao("Qual o animal mais dorminhoco do mundo?",
                         "Coala ", new String[]{"Coala ","Morcego ","Jacaré "});
            questoes.add(q5);
            
            Questao q6 = new Questao("Qual é o animal mais forte?","Besouro-rinoceronte ",
                         new String[]{"Besouro-rinoceronte ","Hipopótamo ","Elefante "});
            questoes.add(q6);
            
            Questao q7 = new Questao("Qual é o animal mais alto?","Girafa ", 
                         new String[]{"Elefante ","Baleia Azul ","Girafa "});
            questoes.add(q7);
            
            Questao q8 = new Questao("Qual é a gestação mais longa do mundo?" ,
                         "Salamandra-negra-dos-alpes " , 
                         new String[]{"Salamandra-negra-dos-alpes ","Humano ","Tartaruga "});
            questoes.add(q8);
            
            Questao q9 = new Questao("Qual é o maior aracnídeo?",
                         "Aranha-golias-comedora-de-pássaro " ,
                         new String[]{"Aranha-golias-comedora-de-pássaro ","Aranha branca ","Caranguejeira "});
            questoes.add(q9);
            
            Questao q10 = new Questao("Qual é o escavador mais rápido?",
                         "Toupeira ",
                         new String[]{"Castor ","Toupeira ","Cachorro "});
            questoes.add(q10);
            
        }
        Collections.shuffle(questoes);
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
