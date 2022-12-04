/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculadora;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Edvaldo
 */
public interface Calculadora extends Remote {
    public int soma (int a, int b) throws RemoteException;
    public int sub (int a, int b) throws RemoteException;
    public int multi (int a, int b) throws RemoteException;
    public int div(int a,int b) throws RemoteException;
    public double raiz(double a) throws RemoteException;  
    public String criptografar (String a) throws RemoteException;
    public String descriptografar (String a) throws RemoteException;
}

    

