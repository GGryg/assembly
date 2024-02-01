section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call prodEven
 ;przed wywolaniem rozwiazania podaj argumenty na stos: push dword str/push dword len
 ;wypisanie rozwiazania: call printSol

 push dword arr
 push dword len

 call min

 call printSol

 call max

 call printSol

 mov eax, 1
 int 0x80
 
min:
 push ebp
 mov ebp, esp
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentow ze stosu: [ebp+8] i [ebp+12]
 mov edx, [ebp+12] ; array address
 mov ecx, [ebp+8] ; array
 xor eax, eax
 mov ax, word [edx] ; assume first is the smallest element
 mov ebx, 1 ; index

FindMin:
 cmp ebx, ecx
 je EndMin
 cmp ax, word [edx+ebx*2]
 jle NextMin

 mov ax, word [edx+ebx*2]

NextMin:
 inc ebx
 jmp FindMin

EndMin:
 pop ebp
 ret
 
max:
 push ebp
 mov ebp, esp
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentow ze stosu: [ebp+4] i [ebp+8]
 mov edx, [ebp+12]
 mov ecx, [ebp+8]
 xor eax, eax
 mov ax, word [edx] ; assume first is the smallest element
 mov ebx, 1 ; index

FindMax:
 cmp ebx, ecx
 je EndMax
 cmp ax, word [edx+ebx*2]
 jge NextMax

 mov ax, word [edx+ebx*2]

NextMax:
 inc ebx
 jmp FindMax

EndMax:
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
 arr:  dw 133, 35, 12, 34, 154, 123
 len: equ ($-arr)/2
