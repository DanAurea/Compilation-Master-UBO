import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

// Should be refactored if needed - Need pointer op (*)  and ternary operators (?:)
// TODO: Clean this messy code


EXPONENT	    =	[eE] [\+\-]? [0-9]+
FLOAT 		    =	([0-9]+ \. [0-9]+ {EXPONENT}? | \. [0-9]+ {EXPONENT}? | [0-9]+ \. {EXPONENT}? | [0-9]+ {EXPONENT}) [fFdD]? | [0-9]+ [fFdD]
INTEGER		    =	[0-9]+
ARITH_OP	    =	[\+\-\*\/\%]
ASSIGN_OP	    =	("+" | "-" | "*" | "/" | "%" | "<<" | ">>" | "&" | "^" | "|")"="
REL_OP		    =	"!=" | "<=" | ">=" | "==" | "<" | ">"
BIT_OP		    =	"<<" | ">>" | "&" | "|" | "^" | "~"
TYPE		    =	(("unsigned" | "signed") \ )?  (("short" | "long" ) \  )? ("short" | long  |long\  | int | double | float | char )+ | ("unsigned" | "signed") 	
KEYWORD		    =	"auto" | "break" | "case" | "const" | "continue" | "default" | "do" | "enum" | "extern" | "goto" | "register" | "restrict" | "return"  | "sizeof" | "static" | "struct" | "switch" | "typedef" | "union" | "void" | "volatile" | "while" | "..."
DELIMITER	    =	"{" | "}" | "(" | ")" | "," | ";" | "[" | "]"
ID		        =	([a-zA-Z0-9_][a-zA-Z0-9_]*)
COMMENT		    =	"//".* | "/*" ~ "*/"
STRING		    =	"\"" [^\"]* "\""
CHAR 		    =	"'" ([^\']| \\(n|0)) "'"
WHITESPACE	    =	[ \t]

%%

{FLOAT}			  {return new Symbol(sym.FLOAT, new Float(yytext())); }
{INTEGER} 		{return new Symbol(sym.INTEGER, new Integer(yytext()));}
{ARITH_OP} 		{return new Symbol(sym.ARITH_OP, new String(yytext()));}
{ASSIGN_OP}		{return new Symbol(sym.ASSIGN_OP, new String(yytext()));}
{REL_OP} 		  {return new Symbol(sym.REL_OP, new String(yytext()));}
{BIT_OP} 		  {return new Symbol(sym.BIT_OP, new String(yytext()));}
{TYPE} 			  {return new Symbol(sym.TYPE, new String(yytext()));}
{KEYWORD} 		{return new Symbol(sym.KEYWORD, new String(yytext()));}
"="           {return new Symbol(sym.ASSIGN);}     
"if"          {return new Symbol(sym.IF);}
"else"        {return new Symbol(sym.ELSE);}
"for"         {return new Symbol(sym.FOR);}
"&&"          {return new Symbol(sym.LOG_AND);}
"||"          {return new Symbol(sym.LOG_OR);}
"!"           {return new Symbol(sym.NOT);}           
"("           {return new Symbol(sym.LBRACKET);}
")"           {return new Symbol(sym.RBRACKET);}
"{"           {return new Symbol(sym.LBRACE);}
"}"		        {return new Symbol(sym.RBRACE);}
","		        {return new Symbol(sym.COMMA);}
"["		        {return new Symbol(sym.LSQUARE);}
"]"		        {return new Symbol(sym.RSQUARE);}
";"		        {return new Symbol(sym.SEMI);}
"++"          {return new Symbol(sym.INCREMENT);}
"--"          {return new Symbol(sym.DECREMENT);}
{STRING}		  {return new Symbol(sym.STRING, new String(yytext()));}
{CHAR}			  {return new Symbol(sym.CHAR, new String(yytext()));}
{ID} 			    {return new Symbol(sym.ID, new String(yytext()));}
{COMMENT} 		{}
{WHITESPACE}	{}
\n			      {return new Symbol(sym.NL);}
. 			      {System.err.println("invalid token : " + yytext() + " line : " + yyline + " column: " + yycolumn);}
