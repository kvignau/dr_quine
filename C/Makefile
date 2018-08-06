# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kvignau <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/02 10:04:06 by kvignau           #+#    #+#              #
#    Updated: 2018/05/17 13:44:54 by kvignau          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FLAG= -Wall -Werror -Wall

SRC_C = Colleen/Colleen.c
SRC_G = Grace/Grace.c
SRC_S = Sully/Sully.c

OBJ_C = $(SRC_C:.c=.o)
OBJ_G = $(SRC_G:.c=.o)
OBJ_S = $(SRC_S:.c=.o)

all: Colleen Grace Sully

Colleen: $(OBJ_C)
	gcc $(FLAG) $(OBJ_C) -o Colleen/Colleen

Grace: $(OBJ_G)
	gcc $(FLAG) $(OBJ_G) -o Grace/Grace

Sully: $(OBJ_S)
	gcc $(FLAG) $(OBJ_S) -o Sully/Sully

%.o: %.c
	@gcc $(FLAG) -c $< -o $@

clean:
	@/bin/rm -rf $(OBJ_C)
	@/bin/rm -rf $(OBJ_G)
	@/bin/rm -rf $(OBJ_S)

fclean: clean
	@/bin/rm -rf Colleen/Colleen
	@/bin/rm -rf Grace/Grace Grace/Grace_kid.c
	@/bin/rm -rf Sully/Sully Sully/Sully_*

re: fclean $(OBJ_C) $(OBJ_G) $(OBJ_S)
	gcc $(FLAG) $(OBJ_C) -o Colleen/Colleen
	gcc $(FLAG) $(OBJ_G) -o Grace/Grace
	gcc $(FLAG) $(OBJ_S) -o Sully/Sully

.PHONY: all clean fclean re
