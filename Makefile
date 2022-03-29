##
## EPITECH PROJECT, 2021
## projectname
## File description:
## Makefile
##

SRC =	src/project.c

MAIN = 	src/main.c

OBJ = 	$(SRC:.c=.o) \
		$(MAIN:.c=.o)

NAME = project
INC = include/

TEST = unit_tests
TESTS = tests/test_project.c

CC = gcc
CFLAGS = -Wall -Wextra -Wpedantic
CPPFLAGS = -I include/
TESTFLAGS = --coverage -lcriterion

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)
	$(RM) *.gcda
	$(RM) *.gcno

fclean:	clean
	$(RM) $(NAME)
	$(RM) $(TEST)

re:	fclean all

tests_run:
	$(RM) *.gcda
	$(RM) *.gcno
	$(CC) -o $(TEST) $(SRC) $(TESTS) -I $(INC) $(TESTFLAGS)
	./$(TEST)
