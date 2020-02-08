CC=gcc
CFLAGS=-Wall -g -std=c11 -static
SRC_DIR=./
OBJ_DIR=./out/
SRCS=$(shell ls $(SRC_DIR)*.c)
OBJS=$(subst $(SRC_DIR),$(OBJ_DIR), $(SRCS:.c=.o))
TARGET=9cc

$(TARGET): $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

$(OBJ_DIR)%.o: $(SRC_DIR)/%.c
	@if [ ! -d $(OBJ_DIR) ]; \
	then echo "mkdir -p $(OBJ_DIR)"; mkdir -p $(OBJ_DIR); \
	fi
	$(CC) $(CFLAGS) -o $@ -c $< 

# $(OBJS): 9cc.h

test: 9cc
	./test.sh

clean:
	rm -f 9cc ./out/*.o ./out/*~ ./out/tmp*

.PHONY: 9cc clean