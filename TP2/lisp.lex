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
whitespace = [ \t\f]

%%

{lpar}     		{return new Symbol(sym.LPAR, new String(yytext()));}
{rpar}   		{return new Symbol(sym.RPAR, new String(yytext()));}
{integer}  		{return new Symbol(sym.INTEGER, new Integer(yytext()));}
{id}	   		{return new Symbol(sym.ID, new String(yytext()));}
{whitespace}	{return new Symbol(sym.WHITESPACE, new String(yytext()));}
\n				{return new Symbol(sym.NL, new String(yytext()));} 
.				{System.out.println("Char '" + yytext() + "' is not recognized.");} // Display unrecognized chars