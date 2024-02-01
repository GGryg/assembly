section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call stringNumbers
 ;wypisanie rozwiazania: call printSol
 call stringNumbers
 call printSol
 mov eax, 1
 int 0x80
 
stringNumbers:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX
 mov ebx, 1
 mov eax, 0

myLoop:
 add eax, ebx
 inc ebx
 cmp ebx, 126
 jne myLoop
 ret
 
printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
