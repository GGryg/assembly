section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania np. sumowania: call sum
 ;wypisanie rozwiazania: call printSol
 call sum
 call printSol
 call diff
 call printSol
 call prod
 call printSol
 call quo
 call printSol
 call mod
 call printSol
 mov eax, 1
 int 0x80
 
sum:
 ;Twoje rozwiazanie, wynik (sume) umiesc w rejestrze EAX
 mov ebx, 13
 add ebx, 27
 mov eax, ebx
 ret
 
diff:
 ;Twoje rozwiazanie, wynik (roznice) umiesc w rejestrze EAX
 mov ebx, 27
 sub ebx, 13
 mov eax, ebx
 ret

prod:
 ;Twoje rozwiazanie, wynik (iloczyn) umiesc w rejestrze EAX
 mov ebx, 13
 mov ecx, 27
 imul ebx, ecx
 mov eax, ebx
 ret
 
quo:
 ;Twoje rozwiazanie, wynik (iloraz) umiesc w rejestrze EAX
 xor edx, edx
 mov eax, 27
 mov ecx, 13
 div ecx
 ret
 
mod:
 ;Twoje rozwiazanie, wynik (reszte z dzielenia) umiesc w EAX
 xor edx, edx
 mov eax, 27
 mov ecx, 13
 div ecx
 mov eax, edx
 ret
 
printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
