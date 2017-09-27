//Specification JFlex
import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

intitule    = "FACTURE"
numero      = [A-Z][0-9]{3}
separateur  = ":"
article     = [A-Z][a-z]+
nombre      = [0-9]+
eol         = ","
total       = "TOTAL"


%%
{intitule}+ {return new Symbol(sym.INTITULE, new String(yytext()));}
{numero}+ {return new Symbol(sym.NUMERO, new String(yytext()));}
{separateur}+ {return new Symbol(sym.SEPARATEUR, new String(yytext()));}
{article}+ {return new Symbol(sym.ARTICLE, new String(yytext()));}
{nombre}+ {return new Symbol(sym.NOMBRE, new Integer(yytext()));}
{eol}+ {return new Symbol(sym.EOL, new String(yytext()));}
{total}+ {return new Symbol(sym.TOTAL, new String(yytext()));}
\n	{} // consommation d'un passage à la ligne
.	{} // ne rien faire
