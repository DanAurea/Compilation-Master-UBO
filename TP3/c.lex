%%
%class lexer
%unicode
%int
%line
%column
%standalone

// Should be refactored if needed - Need pointer op (*)  and ternary operators (?:)

EXPONENT	=	[eE] [\+\-]? [0-9]+
FLOAT 		=	([0-9]+ \. [0-9]+ {EXPONENT}? | \. [0-9]+ {EXPONENT}? | [0-9]+ \. {EXPONENT}? | [0-9]+ {EXPONENT}) [fFdD]? | [0-9]+ [fFdD]
INTEGER		=	[0-9]+
ARITH_OP	=	[\+\-\*\/\%] | "++" | "--" 
LOG_OP		=	"||" | "&&" | "!"
ASSIGN_OP	=	("+" | "-" | "*" | "/" | "%" | "<<" | ">>" | "&" | "^" | "|")?"="
REL_OP		=	("!" | "<" | ">" | "=" )"="?
BIT_OP		=	"<<" | ">>" | "&" | "|" | "^" | "~"
TYPE		=	(("unsigned" | "signed") \ )?  (("short" | "long" ) \  )? ("short" | long  |long\  | int | double | float | char )+ | ("unsigned" | "signed") 	
KEYWORD		=	"auto" | "break" | "case" | "const" | "continue" | "default" | "do" | "else" | "enum" | "extern" | "for" | "goto" | "if" | "register" | "restrict" | "return"  | "sizeof" | "static" | "struct" | "switch" | "typedef" | "union" | "void" | "volatile" | "while" | "..."
DELIMITER	=	"{" | "}" | "(" | ")" | "," | ";" | "[" | "]"
ID			=	([a-zA-Z0-9_][a-zA-Z0-9_]*)
COMMENT		=	"//".* | "/*" .* "*/"
STRING		=	"\"" .* "\""
CHAR 		=	"'" . "'" // Currently not recognizing "\0" / "\n" and other escaped chars.

%%

{FLOAT}			{System.out.println("float " + yytext());}
{INTEGER} 		{System.out.println("integer " + yytext());}
{ARITH_OP} 		{System.out.println("arith " + yytext());}
{LOG_OP} 		{System.out.println("log " + yytext());}
{ASSIGN_OP} 	{System.out.println("assign " + yytext());}
{REL_OP} 		{System.out.println("rel " + yytext());}
{BIT_OP} 		{System.out.println("bit " + yytext());}
{TYPE} 			{System.out.println("type " + yytext());}
{KEYWORD} 		{System.out.println("keyword " + yytext());}
{DELIMITER}		{System.out.println("delimiter " + yytext());}
{STRING}		{System.out.println("string " + yytext());}
{CHAR}			{System.out.println("char " + yytext());}
{ID} 			{System.out.println("id " + yytext());}
{COMMENT} 		{System.out.println("comment " + yytext());}
\n				{}
. 				{System.err.println("invalid token : " + yytext() + " line : " + yyline + " column: " + yycolumn);}