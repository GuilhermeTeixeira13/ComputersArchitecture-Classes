org 100h

ler      equ 3fh
teclado  equ 0
escrever equ 40h
ecran    equ 1
terminar equ 4ch

; ESCRITA DA MENSAGEM NO ECR�
mov ah, escrever
mov bx, ecran
mov cx, 74
mov dx, msg1
int 21h

; !!!! Para as fun��es de escrita e leitura n�o precisamos de colocar [] nas vari�veis!!! !!!!

; MULTIPLICAR
; AX = AL * registo(8bit)
; Exemplo: 5*4
; AL=5   BL=4
; mul bl
; ax = 20

mov [valor], 25 ; <--------- MUDAR AQUI!

mov al, [valor]
mul al ; multiplica al por bl
mov [quadrado], ax

mov ah, 0
mov ax, [quadrado]     ; -- > valor que queremos dividir
mov bl, 10             ; --> bl ou qualquer outro registo de 8 bit
div bl                 ; --> divide AX (cont) por bl --> divis�o inteira --> coloca quociente no registo em AL e o resto no registo em AH
mov [ajudante], al     ; --> Cria uma vari�vel "ajudante" com o conte�do de al
mov [unidades], ah     ; --> Cria uma vari�vel "unidades" com o conte�do de al

mov ah, 0
mov al, [ajudante]     ; -- > valor que queremos dividir
mov bl, 10             ; --> bl ou qualquer outro registo de 8 bit
div bl                 ; --> divide AX (cont) por bl --> divis�o inteira --> coloca quociente no registo em AL e o resto no registo em AH
mov [centenas], al     ; --> Cria uma vari�vel "ajudante" com o conte�do de al
mov [dezenas], ah      ; --> Cria uma vari�vel "unidades" com o conte�do de al

add [dezenas], 48
add [unidades], 48
add [centenas], 48


; ESCRITA DA MENSAGEM DO RESULTADO, NO ECR�
mov ah, escrever
mov bx, ecran
mov cx, 18
mov dx, msg2
int 21h

; ESCRITA DAS Centenas, NO ECR�
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, centenas
int 21h

; ESCRITA DAS Dezenas, NO ECR�
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, dezenas
int 21h

; ESCRITA DAS Unidades, NO ECR�
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, unidades
int 21h

;TERMINAR
mov ah, terminar
int 21h

valor rb 1; vari�vel de leitura
temp rb 2 ; vari�vel tempor�ria/auxiliar
quadrado rw 1 ; reseva 2byte -> 1 word
ajudante rb 1
unidades rb 1
dezenas rb 1
centenas rb 1

msg1 db "Para alterar o numero cujo quadrado sera calculado ler indicacao no codigo."
msg2 db 10,"Quadrado igual a  "

; SUBJECT AULA 4 --> DESAFIO: O PROGRAMA ACEITAR VALORES DE 0 A 30