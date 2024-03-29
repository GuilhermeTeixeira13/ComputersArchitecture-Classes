org 100h

escrever equ 40h
ecran equ 1
terminar equ 4ch
ESC equ 1bh

; MODO GR�FICO
mov ah, 4fh
mov al, 02h
mov bx, 10h ; 640colx350lin
int 10h

; DEFINI��O DE VARI�VEIS
mov [cor], 3
mov [tam], 150
mov [lin], 150
mov [col], 100

;Op��es --> ESC: Terminar
;           h: Horizontal
;           v: Vertical



; L� INPUT DO UTILIZADOR
lertecla:
mov ah, 07h
int 21h
mov [tecla], al

cmp [tecla], ESC
je fim ; Se tecla=ESC, ent�o ele faz o jump, caso contr�rio n�o jumpa (condicional)!!!

;call retaHV
;jmp fim

; DIFERENTES OP��ES DE CAMINHOS POSS�VEIS
cmp [tecla], 'h'
je retaH
cmp [tecla], 'v'
je retaV
cmp [tecla], 'o'
je retaO

; MENSAGEM DE ERRO
mov ah, escrever
mov bx, ecran
mov cx, 5
mov dx, msgE
int 21h

jmp lertecla; -->  jump incondicional!!!

retaH:
call rHorizontal

jmp fim ; Depois de desenhas a reta horizontal, salta para o fim, ao inv�s de desenhar a vertical etc

retaV:
call rVertical

jmp fim

retaO:
call rObliqua

fim:
mov ah, terminar
int 21h




; SUBROTINAS
; Fun��o que desenha um pixel
pixel:
mov ah, 0ch
mov al, [cor]
mov bh, 0
int 10h
ret

rObliqua:
mov cx, [col] ; Como cx s�o 16 bits, temos de reservar 2 byte para col
mov dx, [lin] ; Como dx s�o 16 bits, temos de reservar 2 byte para lin
cicloO:
call pixel
inc dx ; incrementa linha
inc cx ; incrementa coluna
dec [tam] ; decrementa tamanho da reta
jnz cicloO
ret

rVertical:
mov cx, [col] ; Como cx s�o 16 bits, temos de reservar 2 byte para col
mov dx, [lin] ; Como dx s�o 16 bits, temos de reservar 2 byte para lin
cicloV:
call pixel
inc dx ; incrementa linha
dec [tam]
jnz cicloV
ret

rHorizontal:
mov cx, [col] ; Como cx s�o 16 bits, temos de reservar 2 byte para col
mov dx, [lin] ; Como dx s�o 16 bits, temos de reservar 2 byte para lin
cicloH:
call pixel
inc cx ; incrementa coluna
dec [tam]
jnz cicloH
ret

;retaHV:
;mov cx, [col]
;mov dx, [lin]
;cicloHV:
;call pixel
;cmp [tecla], 'h'
;je incol
;cmp [tecla], 'v'
;je inlin
;incol:
;inc cx
;jmp segue
;inlin:
;inc dx
;segue:
;dec[tam]
;jnz cicloHV
;ret

; Mensagens
msgH db "Reta H"
msgV db "Reta V"
msgE db "ERRO!"

;Reservar espa�o para vari�veis
cor rb 1 ;cor da reta
tam rb 1 ; tamanho da reta
lin rw 1 ; linha inicial
col rw 1 ; coluna inicial
tecla rb 1 ; tecla marcada pelo user

; DESAFIO --> Para al�m das op��es H e V, ele consegue desenhar tamb�m uma reta �bl�qua [DONE]
