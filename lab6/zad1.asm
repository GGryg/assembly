section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call rpn
 ;wypisanie rozwiazania: call printSol
 ; 3.8 * ((4.4 + 5.2)/(1.2 - 6.5))
 ; 4.4 5.2 + 1.2 6.5 - / 3.8
 finit

 call rpn

 call printSol

 mov eax, 1
 int 0x80
 
rpn:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze ST0
 fld dword[na]
 fld dword[nb]
 fadd 
 fld dword[nc]
 fld dword[nd]
 fsub 
 fdiv 
 fld dword[ne]
 fmulp
 ret
 
printSol:
 sub esp, 8
 fst qword [esp]
 push sol
 call printf
 add esp, 12
 ret

section .data
 sol: db "Wynik: %f", 10, 0
 na: dd 4.4
 nb: dd 5.2
 nc: dd 1.2
 nd: dd 6.5
 ne: dd 3.8


