section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call quadEqu
 ;przed wywolaniem rozwiazania podaj trzy argumenty na stos
 ;wypisanie rozwiazania: call checkSol
 ;przed wywolaniem rozwiazania ST0 powinno miec wartosc
 ;wypisanie informacji o braku rozwiazania: call printErr

 push dword na
 push dword nb
 push dword nc

 call quadEqu

 mov eax, 1
 int 0x80
 
quadEqu:
 push ebp
 mov ebp, esp
 finit
 ;odniesienie sie argumentu ze stosu: [ebp+8] [ebp+12] [ebp+16]
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze ST0
 fild dword[minusFour]  ; stack: -4
 fld dword[na]          ; stack: a, -4
 fld dword[nc]          ; stack: c, a, -4
 fmulp st1              ; stack: a*c, -4
 fmulp st1              ; stack: -4*a*c
 fld dword[nb]          ; stack: b, -4*a*c
 fld dword[nb]          ; stack: b, b, -4*a*c
 fmulp st1              ; stack: b*b, -4*a*c
 faddp st1              ; stack: b*b-4*a*c
 ;fsqrt
 call checkSol
 cmp eax, 0
 jne countX
 
 call printErr
 jmp End

countX:
 fld dword[nb]      ; stack: b, -4*a*c
 fchs               ; stack: -b, -4*a*c
 faddp st1          ; stack: -b+-4*a*c
 fld1
 fld dword[na]      ; stack: a, 1, -b+4*a*c
 fld dword[na]      ; stack: a, a, 1, -b+4*a*c
 faddp st1          ; stack: a+a, 1, -b+4*a*c
 fdivp st1          ; stack: 1/(a+a), -b+4*a*c
 fmulp st1          ; stack 1/(a+a)*(-b+4*a*c)
 call printSol

End:
 pop ebp
 ret
 
checkSol:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX
 fst st0
 fsqrt
 fxam
 fstsw ax
 sahf
 jp not_nan

 mov eax, 0
 ret

not_nan:
 mov eax, 1
 ret
 
printSol:
 sub esp, 8
 fst qword [esp]
 push msg
 call printf
 add esp, 12
 ret
 
printErr:
 push err
 call printf
 add esp, 4
 ret

section .data
 msg: db "Wynik: %f", 10, 0
 err: db "Brak rozwiazan", 10, 0
 na: dd 1.0
 nb: dd 4.0
 nc: dd 3.0
 minusFour: dd -4

