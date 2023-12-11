/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package func;

import java.util.LinkedList;

/**
 *
 * @author walte
 */
public class Funcion {
    public static LinkedList lista = new LinkedList();
    public static void mostrar(String mensaje){
        System.out.println(mensaje);
    }
     public void imprimirlista(){
        for (Object lista1 : lista) {
            System.out.println(lista1);
                    }
     }        
            
    
}
