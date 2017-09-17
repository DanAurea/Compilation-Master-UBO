%%
%class lexer
%unicode
%int
%standalone
%char

alphabet = ([a-zA-Z0-9])

%%

{alphabet} {System.out.print((char) (yycharat(0)+4));}
. {}
