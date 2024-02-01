all: zad1.o zad2.o zad3.o zad4.o zad5.o zad6.o zad7.o
	gcc -m32 zad1.o -o zad1 -no-pie
	gcc -m32 zad2.o -o zad2 -no-pie
	gcc -m32 zad3.o -o zad3 -no-pie
	make clean > /dev/null
	
zad1: zad1.o
	gcc -m32 zad1.o -o zad1 -no-pie
	make clean > /dev/null
	
zad2: zad2.o
	gcc -m32 zad2.o -o zad2 -no-pie
	make clean > /dev/null
	
zad3: zad3.o
	gcc -m32 zad3.o -o zad3 -no-pie
	make clean > /dev/null
	
zad1.o: zad1.asm
	nasm -f elf32 -g zad1.asm
	
zad2.o: zad2.asm
	nasm -f elf32 -g zad2.asm
	
zad3.o: zad3.asm
	nasm -f elf32 -g zad3.asm
	
clean:
	rm -f *.o
	
