build: genLex compilLex testLex
	
genLex:
	@echo $(LEX)
	java JFlex.Main $(LEX)

compilLex: genLex
	javac lexer.java

testLex: genLex compilLex
	java lexer $(INPUT)
