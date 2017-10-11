import java_cup.runtime.Symbol;

%%
%unicode
%cup
%int
%line
%column

FLOAT 		  =	([0-9]+ \. [0-9]+) 
INTEGER		  =	[0-9]+
WHITESPACE  = [ \t\r]

%%

{FLOAT}       {return new Symbol(sym.FLOAT, new Integer(yytext()));}
{INTEGER} 		{return new Symbol(sym.INTEGER, new Integer(yytext()));}
"+"           {return new Symbol(sym.PLUS);}
"-"           {return new Symbol(sym.MINUS);}
"*"           {return new Symbol(sym.MULT);}
"/"           {return new Symbol(sym.DIV);}
"("           {return new Symbol(sym.LPAR);}
")"           {return new Symbol(sym.RPAR);}
{WHITESPACE}  {}
\n			      {}
. 			      {System.err.println("invalid token : " + yytext() + " line : " + yyline + " column: " + yycolumn);}
