#****************************************************************
# This makefile performs the compilation process for the
# lex and yacc files, and the generated C files.                
# Authors: Elliott Watson, Oreolewa Ogundipe, Ayessa Medrano      
# CS530 2017 Spring Assignment3                                 
#****************************************************************
LEX = lex
YACC = yacc -d

CC = cc
CFLAGS = -c 

parser: y.tab.o lex.yy.o
	$(CC) lex.yy.o y.tab.o -o parser

lex.yy.o: lex.yy.c y.tab.h

y.tab.c y.tab.h: myParser.y
	$(YACC) myParser.y

lex.yy.c: myParser.l
	$(LEX) myParser.l

clean:
	-rm -f *.o lex.yy.c *.tab.* out.txt


