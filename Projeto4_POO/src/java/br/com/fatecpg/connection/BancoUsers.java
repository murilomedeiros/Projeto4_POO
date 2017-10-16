/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.connection;

import java.util.ArrayList;

/**
 *
 * @author muril
 */
public class BancoUsers {

    private static ArrayList<User> Users;
    private static ArrayList<Quiz> QuizzesEfetuados;
    private static ArrayList<User> getClientes() {
        if (Users == null) {
            Users = new ArrayList<>();
        }
        return Users;
    }
    private static ArrayList<Quiz> getQuizzesEfetuados(){
        if (QuizzesEfetuados == null){
            QuizzesEfetuados = new ArrayList<>();
        }
        return QuizzesEfetuados;
    }
    public static boolean addUser(User user){
        for(User u: getClientes()){
            if(u.getNome().equals(user.getNome()))
                return false;
        }
        BancoUsers.getClientes().add(user);
        return true;
    }
    public static boolean atualizarMediaUser(String nomeUser, double acertosQuiz){
        int i = 0;
        for(User u: getClientes()){
            if(u.getNome().equals(nomeUser)){
                double mediaNota = 0;
                if(u.getMediaNota() == 0){
                    mediaNota = acertosQuiz;
                }else{
                    mediaNota = (u.getMediaNota() + acertosQuiz)/2;
                }
                u.setMediaNota(mediaNota);
                BancoUsers.getClientes().remove(i);
                BancoUsers.getClientes().add(i, u);
                return true;
            }
            i++;
        }
        return false;
    }
    public static double obterMediaUser(String nomeUser){
        for(User u : getClientes()){
            if(u.getNome().equals(nomeUser)){
                return u.getMediaNota();
            }
        }
        return -1;
    }
    public static boolean addQuizEfetuado(Quiz quiz){
        BancoUsers.getQuizzesEfetuados().add(quiz);
        return true;
    }
    public static User getUser(int i){
        return BancoUsers.getClientes().get(i);
    }
    public static int totalUsers(){
        return BancoUsers.getClientes().size();
    }
    public static Quiz getQuizEfetuado(int i){
        return BancoUsers.getQuizzesEfetuados().get(i);
    }
    public static int totalQuizzesEfetuados(){
        return BancoUsers.getQuizzesEfetuados().size();
    }
}
