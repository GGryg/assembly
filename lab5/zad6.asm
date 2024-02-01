section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call prodEven
 ;przed wywolaniem rozwiazania podaj argumenty na stos: push dword str/push dword len
 ;wypisanie rozwiazania (pojedynczej komorki): call printSol
 push dword arr
 push dword len

 call prodEven

 add esp, 8
 
 call printSol

 mov eax, 1
 int 0x80
 
prodEven:
 push ebp
 mov ebp, esp
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentow ze stosu: [ebp+8] i [ebp+12]
 mov edx, [ebp+12] ; array
 mov ecx, [ebp+8] ; length
 xor ebx, ebx

Change:
 cmp ebx, ecx
 je End
 test word [edx+ebx*2], 1
 jz Next

 mov word [edx+ebx*2], 0

Next:
 inc ebx
 jmp Change

End:
; uncomment to check specific elements
 ;mov ebx, 1
 ;xor eax, eax
 ;mov ax, word [edx+ebx*2]
; comment if checking
 mov eax, edx ; unclear what should be returned
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
