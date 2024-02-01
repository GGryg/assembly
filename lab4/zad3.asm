section .text
 extern printf
 global main

main:
 ;tutaj sprawdz poprawnosc
 ;wywolanie rozwiazania: call checkTriangle
 ;wypisanie rozwiazania: call printSol
 call checkTriangle
 call printSol
 mov eax, 1
 int 0x80
 
checkTriangle:
 ;Twoje rozwiazanie, wynik nalezy umiescic w rejestrze EAX
 mov ebx, 1764
 mov ecx, 352
 call countTriangleArea
 cmp ebx, 300000
 jl isLess
 jg isGreater
 ;jmp koniec ; labs example
 ret
 
countTriangleArea:
 imul ebx, ecx
 shr ebx, 1 ; shift by 1, it's the same as division by 2 for POSITIVE numebers
 ret

isLess:
 mov eax, 1
 ret

isGreater:
 mov eax, 0
 ret

;skok:
; mov eax, 1

;koniec:
; mov ecx, 10
; ret

;petl:
; inc ecx
; cmp ecx, 0
 ;...
; jne petl
; ret

printSol:
 push eax
 push msg
 call printf
 add esp, 8
 ret
	
section .data
 msg:  db "Wynik: %d", 10, 0
