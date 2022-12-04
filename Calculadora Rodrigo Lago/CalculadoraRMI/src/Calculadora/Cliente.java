/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculadora;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Edvaldo
 */
public class Cliente {
    public static void main (String[] args){
        Scanner sc = new Scanner(System.in);
        int a;
        int op = JOptionPane.showConfirmDialog(null,"sim = criptrografia"+"\nnao = descriptografado","escolha uma op",0);
        try {
            Registry meuRegistro = LocateRegistry.getRegistry("localhost",1099);
            Calculadora c = null;
            try {
                c = (Calculadora) Naming.lookup("//localhost/Calculadora");
            } catch (NotBoundException ex) {
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MalformedURLException ex) {
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            while(true){
                String menu = JOptionPane.showInputDialog
                (" 1 - Somar \n 2- Subtrair \n 3 - Multiplicação \n 4 - Divisão \n 5 - Raiz");
                switch(menu){
                    case "1":
                        int x = Integer.parseInt(JOptionPane.showInputDialog("A: "));
                        int y = Integer.parseInt(JOptionPane.showInputDialog("B: "));
                        if(op==0){
                            a=c.soma(x,y);
                            JOptionPane.showMessageDialog(null, "Soma = "+c.criptografar(Integer.toString(a)));
                            break;
                        }else{
                            a=c.soma(x,y);
                            JOptionPane.showMessageDialog(null, "Soma = "+c.descriptografar(Integer.toString(a)));
                            break;
                        }
                        
                    case "2":
                        int z = Integer.parseInt(JOptionPane.showInputDialog("A: "));
                        int w = Integer.parseInt(JOptionPane.showInputDialog("B: "));
                        if(op==0){
                            a=c.sub(z,w);
                            JOptionPane.showMessageDialog(null, "Subtração = "+c.criptografar(Integer.toString(a)));
                            break;
                        }else{
                            a=c.sub(z,w);
                            JOptionPane.showMessageDialog(null, "Subtração = "+c.descriptografar(Integer.toString(a)));
                            break;
                        }
                    case "3":
                        int d = Integer.parseInt(JOptionPane.showInputDialog("A: "));
                        int e = Integer.parseInt(JOptionPane.showInputDialog("B: "));
                        if(op==0){
                            a=c.multi(d,e);
                            JOptionPane.showMessageDialog(null, "Multiplicação = "+c.criptografar(Integer.toString(a)));
                            break;
                        }else{
                            a=c.multi(d,e);
                            JOptionPane.showMessageDialog(null, "Multiplicação = "+c.descriptografar(Integer.toString(a)));
                            break;
                        }
                    case "4":
                        int f = Integer.parseInt(JOptionPane.showInputDialog("A: "));
                        int g = Integer.parseInt(JOptionPane.showInputDialog("B: "));
                        if(op==0){
                            a=c.div(f,g);
                            JOptionPane.showMessageDialog(null, "Divisão = "+c.criptografar(Integer.toString(a)));
                            break;
                        }else{
                            a=c.div(f,g);
                            JOptionPane.showMessageDialog(null, "Divisão = "+c.descriptografar(Integer.toString(a)));
                            break;
                        }
                    case "5":
                        double h = Integer.parseInt(JOptionPane.showInputDialog("A: "));
                        //int i = Integer.parseInt(JOptionPane.showInputDialog("B: "));
                        if(op==0){
                            JOptionPane.showMessageDialog(null, "Raiz = "+c.criptografar(Double.toString(h)));
                            break;
                        }else{
                            JOptionPane.showMessageDialog(null, "Raíz = "+c.descriptografar(Double.toString(h)));
                            break;
                        }
                    }
            }
        } catch (RemoteException ex) {
            System.out.println("Erro "+ex.getMessage());
        }       
        
    }
    
}
