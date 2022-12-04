/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculadora;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Edvaldo
 */
public class rmi extends UnicastRemoteObject implements Calculadora{
    public rmi () throws RemoteException{
        int a,b;
        double r;
    }
    public int soma (int a, int b) throws RemoteException{
        return a+b;
    }
    public int sub(int a,int b) throws RemoteException{
        return a-b;
    }
    public int multi(int a,int b) throws RemoteException{
        return a*b;
    }
    public int div(int a,int b) throws RemoteException{
        return a/b;
    }
    public double raiz(double r) throws RemoteException{
        return Math.sqrt(r);
    }
    public String criptografar(String a) throws RemoteException{
        char charArray[]; char charAux=' ';
        String output = ": "+ a;
        int tam = a.length();
        charArray= new char[tam];
        output += "\n\nCriptografado: ";

        a.getChars(0, tam, charArray, 0);
        for (int count =0;count<charArray.length;count++){
            if(charArray[count]=='1') charAux='2';
            if(charArray[count]=='2') charAux='3';
            if(charArray[count]=='3') charAux='4';
            if(charArray[count]=='4') charAux='5';
            if(charArray[count]=='5') charAux='6';
            if(charArray[count]=='6') charAux='7';
            if(charArray[count]=='7') charAux='8';
            if(charArray[count]=='8') charAux='9';
            if(charArray[count]=='9') charAux='0';
            if(charArray[count]=='0') charAux='1';
       
            charArray[count] = charAux;
            output+=charArray[count];
        }
        return output;
    }
    public String descriptografar(String a) throws RemoteException{
        char charArray[]; char charAux=' ';
        String output = "Resultado: ";
        int tam = a.length();
        charArray= new char[tam];
        //output += "\n\nCriptografado: ";

        a.getChars(0, tam, charArray, 0);
        for (int count =0;count<charArray.length;count++){
            if(charArray[count]=='1') charAux='1';
            if(charArray[count]=='2') charAux='2';
            if(charArray[count]=='3') charAux='3';
            if(charArray[count]=='4') charAux='4';
            if(charArray[count]=='5') charAux='5';
            if(charArray[count]=='6') charAux='6';
            if(charArray[count]=='7') charAux='7';
            if(charArray[count]=='8') charAux='8';
            if(charArray[count]=='9') charAux='9';
            if(charArray[count]=='0') charAux='0';
       
            charArray[count] = charAux;
            output+=charArray[count];
        }
        return output;
    }

    
}

