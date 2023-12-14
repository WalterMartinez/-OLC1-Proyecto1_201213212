/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package func;

import Utilidades.rtokens;
import java.awt.List;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author walte
 */
public class Funcion {
    public static LinkedList lista = new LinkedList();

    /**
     *
     */
   

    public static void mostrar(String mensaje){
        System.out.println(mensaje);
    }
     public static void imprimirlista(){
        for (Object elemento : lista) {
            System.out.println("---- "+elemento+" ------");
            System.out.println("");
                    }
     }        
    
    public static void analizar1 (String entrada){
        try {
            analizadores.Lexer lexer = new analizadores.Lexer(new StringReader(entrada)); 
            analizadores.Parser parser = new analizadores.Parser(lexer);
            parser.parse();
        } catch (Exception e) {
            System.out.println("Error fatal en compilación de entrada.");
            System.out.println(e);
        } 
    } 
 
}
