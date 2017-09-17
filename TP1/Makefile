build: genLex compilLex testLex
	
genLex:
	@echo $(LEX)
	java jflex.Main $(LEX)

compilLex: genLex
	javac lexer.java

testLex: genLex compilLex
	java lexer $(INPUT)
