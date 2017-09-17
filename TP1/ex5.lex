%%
%class lexer
%unicode
%int
%standalone
%char
%line

%{
	int nbWord = 0;
%}

%eof{
System.out.println("Nbres de caractères dans le texte: "+yychar);
System.out.println("Nbres de mots dans le texte: "+nbWord);
System.out.println("Nbres de lignes dans le texte: "+yyline);
System.out.println("Fin de l'analyse lexicale.");
%eof}

word = ([a-zA-Z0-9]+) 

%%

{word} { nbWord++;}
