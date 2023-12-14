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
{CADENACOMILLASDOBLES}  {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Cadena",yyline,yycolumn));
                        return new Symbol(sym.CADENA,yycolumn,yyline, yytext());}

"CONJ"  {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Palabra res CONJ",yyline,yycolumn));    
        return new Symbol(sym.RCONJ,yycolumn,yyline, yytext());}
":"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo :",yyline,yycolumn));
        return new Symbol(sym.DOSPUNTOS,yycolumn,yyline, yytext());}
"->"    {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo ->",yyline,yycolumn));
        return new Symbol(sym.FLECHA,yycolumn,yyline, yytext());}
";"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo ;",yyline,yycolumn));
        return new Symbol(sym.PTOCOMA,yycolumn,yyline, yytext());}
","     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo ,",yyline,yycolumn));
        return new Symbol(sym.COMA,yycolumn,yyline, yytext());}


"~"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo ~",yyline,yycolumn));
        return new Symbol(sym.TILDE,yycolumn,yyline, yytext());}
"."     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo .",yyline,yycolumn));
        return new Symbol(sym.CONCA,yycolumn,yyline, yytext());}
"|"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo |",yyline,yycolumn));
        return new Symbol(sym.DISYUNCION,yycolumn,yyline, yytext());}
"*"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo *",yyline,yycolumn));
        return new Symbol(sym.CEROOMAS,yycolumn,yyline, yytext());}
"+"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo +",yyline,yycolumn));
        return new Symbol(sym.UNOOMAS,yycolumn,yyline, yytext());}
"?"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo ?",yyline,yycolumn));
        return new Symbol(sym.CEROOUNA,yycolumn,yyline, yytext());}

"("     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo (",yyline,yycolumn));
        return new Symbol(sym.PARIZQ,yycolumn,yyline, yytext());}
")"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo )",yyline,yycolumn));
        return new Symbol(sym.PARDER,yycolumn,yyline, yytext());}
"{"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo {",yyline,yycolumn));
        return new Symbol(sym.LLAVEIZQ,yycolumn,yyline, yytext());}
"}"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo }",yyline,yycolumn));
        return new Symbol(sym.LLAVEDER,yycolumn,yyline, yytext());}

"-"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo -",yyline,yycolumn));
        return new Symbol(sym.GUION,yycolumn,yyline, yytext());}

"/"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo /",yyline,yycolumn));
        return new Symbol(sym.BARRA,yycolumn,yyline, yytext());}

"!"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo !",yyline,yycolumn));
        return new Symbol(sym.DISTINTO,yycolumn,yyline, yytext());}

"\""     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo \"",yyline,yycolumn));
        return new Symbol(sym.COMILLAD,yycolumn,yyline, yytext());}

"#"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo #",yyline,yycolumn));
        return new Symbol(sym.NUMERAL,yycolumn,yyline, yytext());}

"$"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo $",yyline,yycolumn));
        return new Symbol(sym.DOLAR,yycolumn,yyline, yytext());}

"%"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo %",yyline,yycolumn));
        return new Symbol(sym.PORCENTAJE,yycolumn,yyline, yytext());}

"&"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo &",yyline,yycolumn));
        return new Symbol(sym.AMPERSAND,yycolumn,yyline, yytext());}

"'"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo '",yyline,yycolumn));
        return new Symbol(sym.COMILLAS,yycolumn,yyline, yytext());}



"<"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo <",yyline,yycolumn));
        return new Symbol(sym.MENOR,yycolumn,yyline, yytext());}

">"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo >",yyline,yycolumn));
        return new Symbol(sym.MAYOR,yycolumn,yyline, yytext());}

"="     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo =",yyline,yycolumn));
        return new Symbol(sym.IGUAL,yycolumn,yyline, yytext());}

"@"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo @",yyline,yycolumn));
        return new Symbol(sym.ARROBA,yycolumn,yyline, yytext());}

"["     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo [",yyline,yycolumn));
        return new Symbol(sym.CORIZQ,yycolumn,yyline, yytext());}

"]"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo ]",yyline,yycolumn));
        return new Symbol(sym.CORDER,yycolumn,yyline, yytext());}




"^"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo ^",yyline,yycolumn));
        return new Symbol(sym.ELEVADO,yycolumn,yyline, yytext());}

"_"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo _",yyline,yycolumn));
        return new Symbol(sym.GUIONBAJO,yycolumn,yyline, yytext());}

"`"     {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo `",yyline,yycolumn));
        return new Symbol(sym.ACENTO,yycolumn,yyline, yytext());}

"\\"    {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Simbolo \\",yyline,yycolumn));
        return new Symbol(sym.BARRAINV,yycolumn,yyline, yytext());}


{IDENTI}    {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Identificador",yyline,yycolumn));
            return new Symbol(sym.IDENTI,yycolumn,yyline, yytext());
            }
{D}         {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Digito",yyline,yycolumn));
            return new Symbol(sym.ENTERO, yycolumn, yyline, yytext()); 
            }
{DD}        {Utilidades.Itokens.listatokens.add(new Utilidades.rtokens(yytext(),"Decimal",yyline,yycolumn));
            return new Symbol(sym.DECIMAL,yycolumn,yyline, yytext());
            }




//------> Ingorados 
[ \t\r\n\f]     {/* Espacios en blanco se ignoran */}

//------> Errores Léxicos 
.           	{ System.out.println("Error Lexico: " + yytext() + " | Fila:" + yyline + " | Columna: " + yycolumn); }


