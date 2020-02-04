TARGET = mycompiler
PARSER = myparser
SCANNER = myscanner

# build target called mycompiler
all: $(TARGET)

# build compiler
# compiler depends on scanner and parser
$(TARGET): $(SCANNER) ${PARSER} main.c
	gcc lex.yy.c y.tab.c y.tab.h main.c -o ${TARGET} -lfl

# build parser
# generates y.tab.h/c
$(PARSER): $(PARSER).y
	bison --yacc -d ${PARSER}.y

# build scanner
# generates lex.yy.c file
$(SCANNER): ${SCANNER}.l
	flex $(SCANNER).l

clean:
	$(RM) ${TARGET} ${PARSER} $(SCANNER) lex.yy.c y.tab.h y.tab.c
