%%
%class lexer
%unicode
%int
%standalone

parasite = (pr[s]+[t]+|PR[S]+[T]+)

%%

{parasite} {}
. {System.out.print(yytext());}
