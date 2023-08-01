COMMON_OBJECTS  = 
CPU             = msp430g2553
CFLAGS          = -mmcu=${CPU} -I../h -L/opt/ti/msp430_gcc/include

# Switch the compiler (for the internal make rules)
CC              = msp430-elf-gcc
AS              = msp430-elf-as

all: main.elf 

# Additional rules for files
main.elf: ${COMMON_OBJECTS} main.o ../lib/libTimer.a
	${CC} ${CFLAGS} -o $@ $^

main.o: main.c notes.h
	${CC} ${CFLAGS} -c $<

clean:
	rm -f *.o *.elf
