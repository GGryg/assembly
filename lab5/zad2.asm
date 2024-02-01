section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call countWords
 ;przed wywolanie rozwiazania podaj argumentow na stos: push dword str/push dword len
 ;wypisanie rozwiazania: call printSol
 push dword str
 ; push dword len
 call countWords
 call printSol
 add esp, 4

 mov eax, 1
 int 0x80
 
countWords:
 push ebp
 mov ebp, esp
 xor eax, eax
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentu ze stosu: [ebp+8] i [ebp+12]
 mov edx, [esp+8]
 cmp [edx], byte 0
 je end
 inc eax
looping:
 cmp [edx], byte 0
 je end
 cmp [edx], byte 32 ; ascii space
 je increase
 inc edx
 jmp looping
 
end:
 pop ebp
 ret
 
increase:
 inc eax
 inc edx
 jmp looping

printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
 str:  db "Ala ma kota"
 len: equ $-str
