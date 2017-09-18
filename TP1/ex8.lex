%%
%class lexer
%unicode
%int
%standalone
%char


%{
	char c = 'a';
%}

alphabet = ([a-zA-Z0-9])

%%

{alphabet} {	c = yycharat(0);
		
		if(c > 'v' | c <'a' && c > 'V'){
			c = (char) (c - 22);
		}else{
			c = (char) (c + 4);				
		}

		System.out.print(c);
		}
. {}
