%%
%class lexer
%unicode
%int
%standalone
%line
%column

%{
int nb = 0;
%}

%eof{
System.out.println("Nbre de caracteres ignores: "+nb);
System.out.println("Fin de l'analyse lexicale.");
%eof}

pairpair = (aa|bb)*((ab|ba)(aa|bb)*(ab|ba)(aa|bb)*)*

%%
{pairpair} {System.out.println("Nbre pair de a et de b: "+yytext());}
a*b* {System.out.println("Que des a, ou que des b, ou des a d'abord et des b ensuite : "+yytext());}
[\n] {} // ne rien faire
. { nb++;}
