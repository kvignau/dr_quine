# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kvignau <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/02 10:04:06 by kvignau           #+#    #+#              #
#    Updated: 2018/07/12 11:04:45 by kvignau          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FLAG= -Wall -Werror -Wall
NASM = nasm -f macho64

SRC_C = Colleen/Colleen.s
SRC_G = Grace/Grace.s
SRC_S = Sully/Sully.s

OBJ_C = $(SRC_C:.s=.o)
OBJ_G = $(SRC_G:.s=.o)
OBJ_S = $(SRC_S:.s=.o)

all: Colleen Grace Sully

Colleen: $(OBJ_C)
	gcc $(FLAG) $(OBJ_C) -o Colleen/Colleen

Grace: $(OBJ_G)
	gcc $(FLAG) $(OBJ_G) -o Grace/Grace

Sully: $(OBJ_S)
	gcc $(FLAG) $(OBJ_S) -o Sully/Sully

%.o: %.s
	@$(NASM) $< -o $@

clean:
	@/bin/rm -rf $(OBJ_C)
	@/bin/rm -rf $(OBJ_G)
	@/bin/rm -rf $(OBJ_S)

fclean: clean
	@/bin/rm -rf Colleen/Colleen
	@/bin/rm -rf Grace/Grace Grace/Grace_kid.s
	@/bin/rm -rf Sully/Sully Sully/Sully_*.s

re: fclean all

.PHONY: all clean fclean re
