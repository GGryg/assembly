section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call countAtLeastTen
 ;wypisanie rozwiazania: call printSol
 mov eax, 3729583
 xor ebx, ebx
 call countAtLeastTen

 call printSol
 mov eax, 1
 int 0x80
 
countAtLeastTen:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX
 cmp eax, 0
 je end
 
 mov ecx, eax
 and ecx, 0xF
 cmp ecx, 9
 jbe not_letter
 inc ebx

not_letter:
 shr eax, 4
 jmp countAtLeastTen

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
