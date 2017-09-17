%%
%class lexer
%unicode
%int
%standalone   //debug ou standalone
%line
%column

%%
(0|1)+ { System.out.println("Un nombre binaire : "+yytext());}
