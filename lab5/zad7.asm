section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call strToNum
 ;przed wywolaniem rozwiazania podaj argumentow na stos: push dword str/push dword len
 ;wypisanie rozwiazania: call printSol
 push dword str
 push dword len

 call strToNum

 add esp, 8

 call printSol

 mov eax, 1
 int 0x80
 
strToNum:
 push ebp
 mov ebp, esp
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentu ze stosu: [ebp+8] i [ebp+12]
 mov edx, [ebp+12]
 xor eax, eax
 xor ebx, ebx

Convert:
 cmp byte [edx+ebx], '0'
 jb End
 cmp byte [edx+ebx], '9'
 ja End

 xor ecx, ecx
 mov cl, byte [edx+ebx]
 sub cl, '0'
 imul eax, 10
 add eax, ecx

 inc ebx
 jmp Convert

End:
 pop ebp
 ret
 
printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
 str:  db "1352"
 len: equ $-str
