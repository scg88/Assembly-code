
; Spencer Green
; CSC 35
; Spring 2018
; Dr. Ghansah 
; Wednsday, 4/11/18
; Lab section 06
; Lab 06
;
;


.model small 
.stack 100h

main proc

.data


TestString01	BYTE  	"***********************************",0dh,0ah,

			"*    PROGRAM 5 TESTING PROCEDURE  *",0dh,0ah,

			"***********************************",0dh,0ah,0


TestString02	BYTE	"WriteBin: Printing a binary number....: ",0

TestString03	BYTE	"ReadChar: Type an ASCII character.....: ",0

TestString04	BYTE	"Writechar: That character was.........: ",0

TestString05	BYTE	"ReadString: Type an ASCII String......: " ,0

TestString06	BYTE	"WriteString...........................: ",0

TestString07	BYTE	"ReadDec: Type a 16bit Decimal number..: ",0

TestString08	BYTE	"WriteDec: The Number was..............: ",0

TestString09	BYTE	"ReadHex: Type a 16bit Hex number......: ",0

TestString10	BYTE	"WriteHex:The Number was...............: ",0

TestString11	BYTE	"WriteDec: Number of Characters Typed..: ",0

Buffer		BYTE	10 DUP ('!')

.code

    mov ax ,@data

    mov ds,ax


    call clrscr				;Clear the Screen


    	

    mov dx, offset TestString01		;First Large Prompt/Header

    call writestring

    call crlf


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    call crlf

    mov dx, offset TestString03		;Prompt to Test ReadChar

    call WriteString;

    call Readchar			; Reads Filtered Char into AL

    call crlf


    mov dx, offset TestString04		;Prompt for WriteChar

    call WriteString

    call Writechar			; Writes ASCII char in AL to Screen

    call crlf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    call crlf

    mov dx, offset TestString05		;Prompt for ReadString

    call WriteString;

    mov dx, offset buffer		; Where to store the read-in-String

    mov cx, 9

    call ReadString			;Stores typed string to where DX points

    call crlf

    mov dx, offset TestString11		; Prompt for WriteDec, which will

    call WriteString			; print out the number of characters typed

    Call WriteDec

    Call Crlf

    mov dx, offset TestString06		; Print out the string that was entered

    call WriteString;			; uses DX register for source

    mov dx, offset buffer

    call writeString

    call crlf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    call crlf

    mov dx, offset TestString07		;Prompt for ReadDec Test

    call WriteString;

    call ReadDec			; puts value in AX

    call crlf

    mov dx, offset TestString08		; Prompt for WriteDec Test

    call WriteString;

    call WriteDec			; Print AX register in Decimal

    call crlf


    mov dx, offset TestString02		; Prompt for WriteBin test

    call WriteString;

    call writebin			; Prints AX register in Binary

    call crlf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    call crlf

    mov dx, offset TestString09		; Prompt for READHEX

    call WriteString;

    call ReadHex

    call crlf

    mov dx, offset TestString10		; Prompt for WRITEHEX

    call WriteString;

    call WriteHex			; Prints AX register in Hexidecimal


    mov ax, 4c00h

    int 21h

main endp

crlf PROC
   mov ah, 06h
   
crlf endp
clrscr PROC
;clear screen = scroll the whole screen window.
;use coordinates 0,0 to 24,79 
;BIOS INT 10h function 06h

	mov ah, 06h	; scroll up
	mov al, 0	; entire window
	mov ch, 0	; upper left row
	mov cl, 0	; upper left col
	mov dh, 24	; lower right row
	mov dl, 79	; lower right col
	mov bh, 7	; attribute for blanked area
	int 10h		; white: RGB=111=7
	ret
clrscr ENDP
