all: zad1.o zad2.o zad3.o zad4.o zad5.o zad6.o zad7.o
	gcc -m32 zad1.o -o zad1 -no-pie
	gcc -m32 zad2.o -o zad2 -no-pie
	gcc -m32 zad3.o -o zad3 -no-pie
	gcc -m32 zad4.o -o zad4 -no-pie
	gcc -m32 zad5.o -o zad5 -no-pie
	gcc -m32 zad6.o -o zad6 -no-pie
	gcc -m32 zad7.o -o zad7 -no-pie
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
	
zad4: zad4.o
	gcc -m32 zad4.o -o zad4 -no-pie
	make clean > /dev/null
	
zad5: zad5.o
	gcc -m32 zad5.o -o zad5 -no-pie
	make clean > /dev/null
	
zad6: zad6.o
	gcc -m32 zad6.o -o zad6 -no-pie
	make clean > /dev/null
	
zad7: zad7.o
	gcc -m32 zad7.o -o zad7 -no-pie
	make clean > /dev/null
	
zad1.o: zad1.asm
	nasm -f elf32 -g zad1.asm
	
zad2.o: zad2.asm
	nasm -f elf32 -g zad2.asm
	
zad3.o: zad3.asm
	nasm -f elf32 -g zad3.asm
	
zad4.o: zad4.asm
	nasm -f elf32 -g zad4.asm
	
zad5.o: zad5.asm
	nasm -f elf32 -g zad5.asm
	
zad6.o: zad6.asm
	nasm -f elf32 -g zad6.asm
	
zad7.o: zad7.asm
	nasm -f elf32 -g zad7.asm
	
clean:
	rm -f *.o
	
