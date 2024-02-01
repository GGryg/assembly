section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call checkCircle
 ;przed wywolaniem rozwiazania podaj dwa argumenty na stos
 ;wypisanie rozwiazania: call printSol
 
 call checkCircle

 call printSol

 mov eax, 1
 int 0x80
 
checkCircle:
 push ebp
 mov ebp, esp
 ;odniesienie sie argumentu ze stosu: [ebp+8] [ebp+12]
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX

 finit
 fld dword[radius]
 fmul st0; r * r
 FLDPI ; push PI
 fmulp ; pi * (r*r)
 fld dword[radius2]
 fld dword[radius2]
 fmulp
 fldpi
 fmul
 fcompp

 pop ebp

 fstsw ax ; save flags to AX (fstsw save 16-bits)
 sahf ; copy flags from AH to processor's flags
 
 jae smaller
 mov eax, 1
 ret
 
smaller:
 xor eax, eax
 ret


printSol:
 push eax
 push sol
 call printf
 add esp, 8
 ret
	
section .data
 sol:  db "Wynik: %d", 10, 0
 radius: dd 5.0
 radius2: dd 2.0
