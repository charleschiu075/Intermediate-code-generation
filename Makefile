LEX=flex
BISON=bison
CC=gcc
CFLAGS=-Wall -Wextra -O2 -Wno-sign-compare -Wno-unused-function -Wno-unneeded-internal-declaration

TARGET=calc

all: $(TARGET)

$(TARGET): parser.tab.c lex.yy.c
	$(CC) $(CFLAGS) -o $@ parser.tab.c lex.yy.c

parser.tab.c parser.tab.h: parser.y
	$(BISON) -d parser.y

lex.yy.c: lexer.l parser.tab.h
	$(LEX) lexer.l

.PHONY: clean
clean:
	rm -f $(TARGET) parser.tab.c parser.tab.h lex.yy.c
