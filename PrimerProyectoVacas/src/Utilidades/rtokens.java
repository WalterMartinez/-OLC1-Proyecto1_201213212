/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utilidades;

/**
 *
 * @author walte
 */
public class rtokens {
    public String lexema;
    public String token;
    public int linea;
    public int columna;
    
    public rtokens(String lexema, String token, int linea, int columna){
        this.lexema = lexema;
        this.token = token;
        this.linea = linea;
        this.columna = columna;
    }
    @Override
    public String toString(){
    return this.lexema + " - " + this.token + " - " + this.linea + " - "+ this.columna;
        }
}
