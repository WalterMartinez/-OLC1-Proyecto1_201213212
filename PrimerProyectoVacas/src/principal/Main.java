/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package principal;

import Interfaz.Principal;
import java.io.StringReader;

/**
 *
 * @author walte
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        //func.Funcion.mostrar("hola mundo");
        
        analizadores("src/analizadores/", "Lexer.jflex", "Parser.cup");
        
        Principal p = new Principal();
        p.setVisible(true);
        
        String entrada = """
                       {
                       // CONJUNTOS
                       CONJ: letra -> a~z;
                       CONJ: letraMayus -> A~Z;
                       CONJ: digito -> 0-9;
                       CONJ: bool -> 0,1;
                       CONJ: op -> *~/;
                       
                       //expresiones
                       nombre -> +..(letraMayus)*(letra)_;
                       int -> ..int;
                       float-> ...(digito)*(digito)".".(digito)*(digito);
                       entero->.(digito)*(digito);
                       binario-> .(bool)*(bool);
                       compi -> ....compi1;
                       binfloat ->...(bool)*(bool)".".(bool)*(bool);
                       or ->||.c1.c2.c3;
                       
                       }
                       """;
        
        //analizar(entrada);
        
        
    }
    
    public static void analizadores(String ruta, String jflexFile, String cupFile){
        try {
            String opcionesJflex[] =  {ruta+jflexFile,"-d",ruta};
            jflex.Main.generate(opcionesJflex);

            String opcionesCup[] =  {"-destdir", ruta,"-parser","Parser",ruta+cupFile};
            java_cup.Main.main(opcionesCup);
            
        } catch (Exception e) {
            System.out.println("No se ha podido generar los analizadores");
            System.out.println(e);
        }
    }
    
        // Realizar Analisis
    public static void analizar (String entrada){
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
