%%
%class lexer
%unicode
%int
%standalone

%{
	int nbKept = 0;
	int nbDeleted = 0;
%}

%eof{
	System.out.println("\nNbres de caractères gardés: "+nbKept);
	System.out.println("Nbres de caractères supprimés: "+nbDeleted);
%eof}

filter = ([a-zA-Z])

%%

{filter} {System.out.print(yytext());
	  nbKept++;}
[\n] {nbDeleted++;}
. {nbDeleted++;}
