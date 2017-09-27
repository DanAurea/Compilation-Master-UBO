//Specification JFlex
import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

lpar    = "("
rpar    = ")"
integer = [0-9]+
id      = [a-z][a-z0-9]*

%%

{lpar}+     {return new Symbol(sym.LPAR, new String(yytext()));}
{rpar}+     {return new Symbol(sym.RPAR, new String(yytext()));}
{integer}+  {return new Symbol(sym.INTEGER, new Integer(yytext()));}
{id}+       {return new Symbol(sym.ID, new String(yytext()));}
\n	{} 
.	{System.out.println("Caractères : " + yytext() + "non reconnu.");} // Display unrecognized chars
