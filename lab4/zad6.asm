section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call countOnes
 ;wypisanie rozwiazania: call printSol
 xor ebx, ebx
 clc
 mov eax, 3729583
 mov ecx, 32 ; number of bits
 
 call countOnes

 call printSol
 mov eax, 1
 int 0x80
 
countOnes:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX
 cmp ecx, 0
 jl end
 rol eax, 1
 jc increment
 dec ecx
 jmp countOnes

increment:
 inc ebx
 dec ecx
 jmp countOnes

end:
 mov eax, ebx
 ret
 
printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
