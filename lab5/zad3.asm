section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call convert
 ;przed wywolanie rozwiazania podaj argumentow na stos: push dword str/push dword len
 ;wypisanie rozwiazania: call printSol
 push dword str ; push str on stack
 push dword len ; push len on stack
 call convert

 add esp, 8

 call printSol

 mov eax, 1
 int 0x80
 
convert:
 push ebp
 mov ebp, esp
 xor eax, eax
 ;Twoje rozwiazanie, wynik umiesc w rejestrze EAX
 ;odniesienie sie argumentu ze stosu: [ebp+8] i [ebp+12]
 mov edx, [esp+12] ; edx has pointer to the first character
 mov ecx, [esp+8] ; ecx has len 

 xor ebx, ebx ; it will serve as an index so it need to be zero

convert_loop: ; loop serves as for
 cmp ebx, ecx ; compare ebx to ecx so index to len
 je end ; if equal jump to end
 mov al, [edx+ebx] ; read character to al
 cmp al, byte 97 ; ascii a
 jl to_lower
 jge to_upper

end: ; returns to main
 pop ebp
 mov eax, edx ; need an address | not value
 ret

to_lower:
 cmp al, byte 32 ; ascii space
 je skip_space
 add [edx+ebx], byte 32
 inc ebx
 jmp convert_loop

skip_space:
 inc ebx
 jmp convert_loop

to_upper:
 sub [edx+ebx], byte 32
 inc ebx
 jmp convert_loop

printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %s", 10, 0
 str:  db "Ala ma kota"
 len: equ $-str
