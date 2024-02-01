section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call prodEven
 ;przed wywolanie rozwiazania podaj argumenty na stos: push dword str/push dword len
 ;wypisanie rozwiazania: call printSol

 push dword arr ; push address of the first element of array on stack
 push dword len ; push address of length of array

 call prodEven

 add esp, 8 ; move the stack pointer ESP
 
 call printSol

 mov eax, 1 ; Specify exit call to the kernel
 xor ebx, ebx ; set EBX to 0 as exit code
 int 0x80 ; Syscall to terminate program
 
prodEven:
 push ebp
 mov ebp, esp
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentow ze stosu: [ebp+8] i [ebp+12]
 mov edx, [ebp+12] ; address of the first element
 mov ecx, [ebp+8] ; length
 mov eax, 1 ; keeps result
 xor ebx, ebx ; index
 
count:
 cmp ebx, ecx ; compare index to length
 jge end ; if equal jump to end

 push ecx
 xor ecx, ecx
 mov cl, byte [edx+ebx] ; array of bytes so copy the value to 8-bit number
 imul eax, ecx ; multiply EAX by ECX, result is saved in EAX
 pop ecx
 add ebx, 2 ; increase index
 jmp count
 
end:
 xor esi, esi ; clear ESI
 pop ebp ; pop EBP from stack
 ret ; return to call prodEven - line 14

printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
 arr:  db 64, 35, 12, 34, 31, 75
 len: equ $-arr
