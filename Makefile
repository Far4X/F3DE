#SFML makefile

CXX = g++
EXEC = SFML_Test
DEBUG = $(EXEC)_DEBUG

SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)

DEBUG_ARGS = -Wall -Wextra -Werror -ggdb

all : $(EXEC)

debug : $(DEBUG)

*.o : *.cpp
	$(CXX) -o $@ -c $< 

$(EXEC) : $(OBJ)
	$(CXX) -o $@ $^ -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -lsfml-network

$(DEBUG) : $(OBJ)
	$(CXX) -o $@ $^  $(DEBUG_ARGS) -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio -lsfml-network 

clean :
	rm *.o

mrproper : clean
	rm $(EXEC)

run :
	./$(EXEC)

run_debug :
	./$(DEBUG)

gdb_debug :
	gdb $(DEBUG)
