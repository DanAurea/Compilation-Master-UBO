%%
%class lexer
%unicode
%int
%standalone

// Should be refactored if needed - Need pointer op (*)  and ternary operators (?:)

INTEGER		=	[0-9]+
ARITH_OP	=	[\+\-\*\/\%] | "++" | "--" 
LOG_OP		=	"||" | "&&" | "!"
ASSIGN_OP	=	("+" | "-" | "*" | "/" | "%" | "<<" | ">>" | "&" | "^" | "|")?"="
REL_OP		=	("!" | "<" | ">" | "=" )"="?
BIT_OP		=	"<<" | ">>" | "&" | "|" | "^" | "~"
TYPE		=	("unsigned" | "signed")? \ ? ( ("short"\ ?){0,1} | ("long"\ ?) {0,2}) (int | double | float | char)? 	// There is an issue with blank types at the moment
KEYWORD		=	"auto" | "break" | "case" | "const" | "continue" | "default" | "do" | "else" | "enum" | "extern" | "for" | "goto" | "if" | "register" | "return" | "sizeof" | "static" | "struct" | "switch" | "typedef" | "union" | "void" | "volatile" | "while" | "..."
DELIMITER	=	"{" | "}" | "(" | ")" | "," | ";"
ID			=	([a-zA-Z0-9_][a-zA-Z0-9_]*)
COMMENT		=	"//".* | "/*" .* "*/"

%%

{INTEGER} 		{System.out.println("integer " + yytext());}
{ARITH_OP} 		{System.out.println("arith " + yytext());}
{LOG_OP} 		{System.out.println("log " + yytext());}
{ASSIGN_OP} 	{System.out.println("assign " + yytext());}
{REL_OP} 		{System.out.println("rel " + yytext());}
{BIT_OP} 		{System.out.println("bit " + yytext());}
{TYPE} 			{System.out.println("type " + yytext());}
{KEYWORD} 		{System.out.println("keyword " + yytext());}
{DELIMITER}		{System.out.println("delimiter " + yytext());}
{ID} 			{System.out.println("id " + yytext());}
{COMMENT} 		{System.out.println("comment " + yytext());}
\n				{}
. 				{}