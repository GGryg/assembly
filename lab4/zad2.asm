section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call rpn
 ;wypisanie rozwiazania: call printSol
 call rpn
 call printSol
 mov eax, 1
 int 0x80
 
rpn:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX
 mov ecx, 6
 push ecx
 mov ecx, 2
 push ecx
 pop edx
 pop ecx
 sub ecx, edx
 push ecx
 mov ecx, 3
 push ecx
 mov ecx, 7
 push ecx
 pop edx
 pop ecx
 add ecx, edx
 push ecx
 pop ecx
 pop edx
 add ecx, edx
 mov eax, ecx
 ret
 
printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
