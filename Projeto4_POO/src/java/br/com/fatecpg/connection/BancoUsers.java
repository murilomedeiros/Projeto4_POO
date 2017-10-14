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

    public static ArrayList<User> getClientes() {
        if (Users == null) {
            Users = new ArrayList<>();
        }
        return Users;
    }

}
