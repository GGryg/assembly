section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call primeNumber
 ;wypisanie rozwiazania: call printSol
 call primeNumber
 call printSol
 mov eax, 1
 int 0x80
 
primeNumber:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX
 mov eax, 3729583
 cmp eax, 2
 jl notPrime
 je end
 mov ebx, 2
 mov ecx, eax
 jg keepDividing
 ret

keepDividing:
 cmp ebx, ecx
 jge end
 xor edx, edx
 div ebx
 cmp edx, 0
 je notPrime
 mov eax, ecx
 inc ebx
 jmp keepDividing


notPrime:
 mov eax, 0
 ret

end:
 mov eax, 1
 ret
 
printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
