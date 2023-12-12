// ------------  Paquete e importaciones ------------
package analizadores; 

import java_cup.runtime.*;

%%	
//-------> Directivas (No tocar)

%public 
%class Lexer
%cup
%char
%column
%line
%unicode
%ignorecase

%{ 
%} 

// ------> Expresiones Regulares 

D=[0-9]+
DD=[0-9]+("."[  |0-9]+)?

IDENTI = [A-Za-z]["_"0-9A-Za-z]*

COMENTARIO          =   ("//".*\r\n)|("//".*\n)|("//".*\r)
COMENTMULTILINEA    =   "<!"">"*([^!>]|[^!]">"|"!"[^>])*"!"*"!>"

CADENACOMILLASDOBLES = [\"]([^\"\n]|(\\\"))*[\"]
%%
// ------------  Reglas Lexicas -------------------
{COMENTARIO}            {System.out.println(yytext());}
{COMENTMULTILINEA}      {System.out.println(yytext());}
{CADENACOMILLASDOBLES}  {func.Funcion.lista.add(new Symbol(sym.CADENA,yycolumn,yyline, yytext()));
                        return new Symbol(sym.CADENA,yycolumn,yyline, yytext());}

"CONJ"  {func.Funcion.lista.add(new Symbol(sym.RCONJ,yycolumn,yyline, yytext()));
        
        return new Symbol(sym.RCONJ,yycolumn,yyline, yytext());}
":"     {func.Funcion.lista.add(new Symbol(sym.DOSPUNTOS,yycolumn,yyline, yytext()));
        return new Symbol(sym.DOSPUNTOS,yycolumn,yyline, yytext());}
"->"    {func.Funcion.lista.add(new Symbol(sym.FLECHA,yycolumn,yyline, yytext()));
        return new Symbol(sym.FLECHA,yycolumn,yyline, yytext());}
";"     {func.Funcion.lista.add(new Symbol(sym.PTOCOMA,yycolumn,yyline, yytext()));
        return new Symbol(sym.PTOCOMA,yycolumn,yyline, yytext());}
","     {func.Funcion.lista.add(new Symbol(sym.COMA,yycolumn,yyline, yytext()));
        return new Symbol(sym.COMA,yycolumn,yyline, yytext());}


"~"     {func.Funcion.lista.add(new Symbol(sym.TILDE,yycolumn,yyline, yytext()));
        return new Symbol(sym.TILDE,yycolumn,yyline, yytext());}
"."     {func.Funcion.lista.add(new Symbol(sym.CONCA,yycolumn,yyline, yytext()));
        return new Symbol(sym.CONCA,yycolumn,yyline, yytext());}
"|"     {func.Funcion.lista.add(new Symbol(sym.DISYUNCION,yycolumn,yyline, yytext()));
        return new Symbol(sym.DISYUNCION,yycolumn,yyline, yytext());}
"*"     {func.Funcion.lista.add(new Symbol(sym.CEROOMAS,yycolumn,yyline, yytext()));
        return new Symbol(sym.CEROOMAS,yycolumn,yyline, yytext());}
"+"     {func.Funcion.lista.add(new Symbol(sym.UNOOMAS,yycolumn,yyline, yytext()));
        return new Symbol(sym.UNOOMAS,yycolumn,yyline, yytext());}
"?"     {func.Funcion.lista.add(new Symbol(sym.CEROOUNA,yycolumn,yyline, yytext()));
        return new Symbol(sym.CEROOUNA,yycolumn,yyline, yytext());}

"("     {func.Funcion.lista.add(new Symbol(sym.PARIZQ,yycolumn,yyline, yytext()));
        return new Symbol(sym.PARIZQ,yycolumn,yyline, yytext());}
")"     {func.Funcion.lista.add(new Symbol(sym.PARDER,yycolumn,yyline, yytext()));
        return new Symbol(sym.PARDER,yycolumn,yyline, yytext());}
"{"     {func.Funcion.lista.add(new Symbol(sym.LLAVEIZQ,yycolumn,yyline, yytext()));
        return new Symbol(sym.LLAVEIZQ,yycolumn,yyline, yytext());}
"}"     {func.Funcion.lista.add(new Symbol(sym.LLAVEDER,yycolumn,yyline, yytext()));
        return new Symbol(sym.LLAVEDER,yycolumn,yyline, yytext());}

"-"     {func.Funcion.lista.add(new Symbol(sym.GUION,yycolumn,yyline, yytext()));
        return new Symbol(sym.GUION,yycolumn,yyline, yytext());}

"/"     {func.Funcion.lista.add(new Symbol(sym.BARRA,yycolumn,yyline, yytext()));
        return new Symbol(sym.BARRA,yycolumn,yyline, yytext());}




{IDENTI}    {func.Funcion.lista.add(new Symbol(sym.IDENTI,yycolumn,yyline, yytext()));
            return new Symbol(sym.IDENTI,yycolumn,yyline, yytext());
            }
{D}         {func.Funcion.lista.add(new Symbol(sym.ENTERO,yycolumn,yyline, yytext()));
            return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); 
            }
{DD}        {func.Funcion.lista.add(new Symbol(sym.DECIMAL,yycolumn,yyline, yytext()));
            return new Symbol(sym.DECIMAL,yycolumn,yyline, yytext());
            }




//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }


