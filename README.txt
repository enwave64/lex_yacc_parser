Ayessa Medrano - cssc0841
Elliot Watson - cssc1017 *files will be in this account*
Oreoluwa Ogundipe - cssc0842
CS 570 Spring 2017
Assignment #3 Parser
README.txt

Files:...

Description: 
	This program will analyze the lines of a text file (in.txt) and determine if each line is a valid
	or invalid statement. The program will keep reading the text file until each reaches the end of 
	the file/ 'end of file' marker.
	Valid statements are assignments and expressions. 
	Invalid statements are lines that do not follow the syntax of assignments or expressions. The line
	read from the file and its validity status will be written to an output file(out.txt). 
	The output file will have the line taken from the text file and a statement right after it 
	indicating if its valid or invalid.
	
BNF:	Assignments and Expressions are composed of identifiers and operations. 
	An Identifier is composed of a combination of chars, digits, and the underscore symbol, but the
	first position must be either a char or underscore value. 
	Operations are mathmatical symbols [-+*/%]. 
	Assignments are strictly in the form: identifer = expression ;
	Expressions are in the form: id op id {op id}*  

Compile Instructions:
	Enter 'make'
	The make file contains the following compilation instructions: 
		To compile lex file: lex parser.l
		To compile yacc file: yacc -d yacc.y
		To compile c file of lex file and y.tab.c: cc lex.yy.c y.tab.c -o parser

Operation instructions:
	To run: ./parser
	Note: make sure in.txt is in the directory or this will cause an error message to appear
	
Novel/Significant design decisions:
	Lex and Yacc Compilers

Known Deficiencies or Bugs:
	Due to the language of lex and yacc, we were unable to produce the reason for an invalid statement.
	Only one error message could be added to the rules in the Yacc file.
	A blank line will also produce an Invalid Statement.

Lessons Learned:
	Lex and Yacc Programming and programming style
	Lexical Analysis - we learned the importance of explicitly classifying the kinds of characters 
		we wanted for our tokens.
	Syntactic Analysis - The order in how rules are stated are important and must be looked at 
		carefully
	Error handling in Lex and Yacc
	


