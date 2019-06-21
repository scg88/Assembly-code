;Spencer Green
;csc35
;Spring 2018
;Dr. Ghansah
;3/07/2018
;Lab section
;
;This progroam displays output from User Input Data

.model small
.stack 100h
.data
inputX db 13,10,"Input X=", '$'
inputY db 13,10,"Input Y=", '$'
output db 13,10,"Output W=",'$'
;VARIABLES
   X dw 0
   Y dw 0
   W dw 0
   SUM dw 0
   LOC dw 0

.code
Main Proc

;------ FROM LAB 3
   call Xmain
   call Ymain

   Mov ax, 160;Moves 160 to ax reg
   Mul Y;	Multiply Y to the ax reg
   Mov loc,ax; Moves value of ax to loc
   Mov ax,2;
   Mul X;	Multiplies X to the AX reg
   Add loc,ax;	Adds ax to loc
   Mov Y,2000;	moves value of 2000 to y
   Sub Y,1;	Subs one from Y (2000)
   Mov ax,loc;	moves loc to the Ax reg

   Mov cx,16;	Moves 4 to Cx reg
   Div cx;	Divide ax by cx (ax/cx) (loc/16)


   Add ax, Y; adds Y to LOC in ax
   Mov loc, ax; Store value of ax in loc. (Loc=245+Y)


   Mov dx,0
   Mov ax, Y ; move Y into Ax reg
   Mov cx, 4 ; put 4 in Cx reg
   Div cx    ; Div Y by 4
   add loc, ax; add result to Loc
   mov ax, loc ;move result to ax reg
   mov sum, ax ; moves ax into sum

   Mov dx,0
   Mov ax,Sum;	moves sum to ax
   Mov cx,7;	moves 7 to cx
   Div cx;	Div Ax/Cx = dx
   Add W,dx;	Add dx to W
   Add W,5;	add 5 to W

   Add W, 30h;Convert to ascii
   mov ax, w ;Store in AX

   mov ah, 06h
   mov dl,al
   Int 21h

;ASM Exit commands
   mov ax, 4C00H
   INT 21h
Main endp
Ymain Proc
  ;Display message for user to input Y

   mov ax, @data
   mov ds, ax
   mov ah, 09h
   mov dx,offset inputY
   int 21h

;Assign Y from user input
   mov cx,4
   mov bx,0
L2:
   mov ax,10
   mul Y
   mov Y, ax
   Mov ah, 01h;
   Int 21h
   sub al, 30h;130
   mov ah,0
   add Y, ax
   loop L2
     ret
Ymain endp

Xmain Proc
  ;display message for a user to input X
   mov ax, @data
   mov ds, ax
   mov ah, 09h
   mov dx,offset inputX
   int 21h

;Assign X from user input
   mov cx,4
   mov bx,0
L1:
   mov ax,10
   mul X
   mov X, ax
   Mov ah, 01h;01h (orginaly)
   Int 21h
   sub al, 30h;130 Convert to ascii
   mov ah,0
   add X, ax
   loop L1
  ret
Xmain endp
     End Main
