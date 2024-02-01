section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call length
 ;przed wywolanie rozwiazania podaj argument na stos: push dword str
 push dword str ; push on stack
 ; another version
 ; mov eax, str
 ; push eax
 call length
 ;mov eax, 1
 ;push msg
 ;mov [eax], dword 4
 ;call length
 ;wypisanie rozwiazania: call printSol
 call printSol
 add esp, 4
 mov eax, 1
 int 0x80
 
length:
 push ebp ; push on heap so it won't be lost
 mov ebp, esp ; move pointer to ebp because esp will be changed
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentu ze stosu: [ebp+8] 
 ;cmp dword[eax], 0 ;err
 ; jne count
 ;push eax ; esp -> 17 -> esp 13
 ;push eax ; esp 13 -> esp 9
 ;pop eax ; esp 9 -> esp 13
 ;add esp, 8 ; esp 17 ->

 mov edx, [ebp+8] ; take memory address from ebp+8
 xor eax, eax ; zeroing
 ; push ecx -> it would be equal to [ebp+12]
looping:
 cmp [edx], byte 0 ; check the end of string (null character/terminator) from memory's value (the '[]')
 je end

 inc eax ; increase counter
 inc edx ; move to the next memory address

 jmp looping
 
end:
 pop ebp
 ret

count:
 inc eax
 call length
 
printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
 str:  db "Ala ma kota", 0


; esp poczatek stosu
; ebp ogolne