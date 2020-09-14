SRC=blink_led.c

CC=sdcc
FAMILY=pic16
PROC=18f14k22
PK2=pk2cmd -B/home/pi/source/github/pk2cmd/pk2cmd -Ppic$(PROC)

all: $(SRC:.c=.hex)

$(SRC:.c=.hex): $(SRC)
	$(CC) --use-non-free -m$(FAMILY) -p$(PROC) $^

clean:
	rm -f $(SRC:.c=.asm) $(SRC:.c=.cod) $(SRC:.c=.hex) $(SRC:.c=.lst) $(SRC:.c=.o)

write: $(SRC:.c=.hex)
	$(PK2) -M -F$(SRC:.c=.hex)

on:
	$(PK2) -T

off:
	$(PK2) -W

erase:
	$(PK2) -E


.PHONY: all clean
