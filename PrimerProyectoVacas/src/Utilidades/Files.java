/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utilidades;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;


/**
 *
 * @author walte
 */
public class Files {
    
    public Files(){
    }
    
    public String readFile(File archivo){
    try{
        Scanner obj = new Scanner(archivo);
        String entrada = "";
        while (obj.hasNextLine()){
            entrada+= obj.nextLine()+'\n';
        }
        return entrada;
    }
    catch(FileNotFoundException ex){
        return "Error al cargar el archivo";
    }
    }
}
