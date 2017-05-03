Ayessa Medrano - cssc0841
Elliot Watson - cssc1017
Oreoluwa Ogundipe - cssc0842
CS 570 Spring 2017
Assignment #3 Parser
README.txt

Files:...

Description: 
	This program will analyze the lines of a text file (in.txt) and determine if each line is a valid
	or invalid statement. Valid statements are assignments and expressions. Invalid statements are
	lines that do not follow the syntax of assignments or expressions. The line read from the file and
	its validity status will be written to an output file.

Compile Instructions:
	To compile lex file: lex parser.l
	To compile yacc file: yacc -d yacc.y
	To compile c file of lex file and y.tab.c: cc lex.yy.c y.tab.c -o parser

Operation instructions:
	To run: ./parser
	
Novel/Significant design decisions:
	Lex and Yacc Compilers

Extra Features:

Known Deficiencies or Bugs:
	Due to the language of lex and yacc, we were unable to produce the reason of an invalid statement.
	A blank line will produce an Invalid Statement.

Lessons Learned:
	Lexical Analysis
	Syntactic Analysis
	Semantic Analysis
	Code Optimization
	Code Generator
	


