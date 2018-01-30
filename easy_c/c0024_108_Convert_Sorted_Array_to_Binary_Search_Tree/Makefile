#------------------------------------------------------------------------------
# Top Makefile
# Tue Jan 16 12:51:33 HKT 2018
# drunk water
#------------------------------------------------------------------------------

INC=
LIB= -lm -lpthread

CC=gcc
CC_FLAG=-Wall

PRG=app_elf
OBJ=00_leetcode_0024.o

$(PRG):$(OBJ)
	$(CC) -o $@ $(OBJ) $(INC) $(LIB)

.SUFFIXES: .c .o .cpp
.cpp.o:
	$(CC) $(CC_FLAG) -c $*.cpp -o $*.o $(INC) $(LIB)

.PRONY:clean
clean:
	@echo "start to make clean"
	rm -f $(OBJ) $(PRG)
