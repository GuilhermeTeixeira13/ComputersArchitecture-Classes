; LEITOR DE FICHEIROS SEM ESPECIFICAR O N�MERO DE CARATERES----------- ERROS----------

org 100h

terminar equ 4ch
fechar equ 3eh
criar equ 3ch
escrever equ 40h
abrir equ  3dh
ler equ 3fh
teclado equ 00

;Abrir Ficheiro
mov ah, abrir
mov al, 0 ; Abrir s� para leitura (1 para abrir para escrita)
mov dx, path ; nome do ficheiro
int 21h

mov [handle], ax  ; Porque que quando se cria um ficheiro esquecese-se o nome e cria-se um n�mero (handle)

mov [contmin], 0
mov [contmas], 0

ciclo:
; Ler no ficheiro      ; SAIDA : AX = n�mero de bytes lidos
mov ah, ler
mov bx, [handle]  ; N�o � no ecr�, � no handle (ler)
mov cx, 1        ; n�mero de caracteres a serem lidos
mov dx, msg      ; Vari�vel em que ser� guardado o que foi lido
int 21h

cmp ax, 0   ; Se for 0 n�o conseguiu ler
je sair     ; Se for 0, ou seja, se n conseguir ler, sai

cmp [msg], 64
jl salto

cmp [msg], 97
jl maiusculas

add [contmin], 1
jmp salto

maiusculas:
add [contmas], 1

salto:
; Escrever o car�ter lido
mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, msg
int 21h

jmp ciclo ; Voltar para o ciclo

; Fun��o Fecho
sair:
add [contmas], 48
add [contmin], 48


; Escrever o car�ter lido
mov ah, escrever
mov bx, 1
mov cx, 16
mov dx, frasem
int 21h
; Escrever o car�ter lido
mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, contmin
int 21h

; Escrever o car�ter lido
mov ah, escrever
mov bx, 1
mov cx, 16
mov dx, fraseM
int 21h
; Escrever o car�ter lido
mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, contmas
int 21h
mov ah, fechar
mov bx, [handle]
int 21h

; Terminar
mov ah, terminar
int 21h

handle rw 1 ; Handle do ficheiro
path db "exemplo.txt", 0 ; formato ASCIIZ --> o 0 final � muito importante!
msg rb 1
fraseM db 10,"MAIUSCULAS --> "
frasem db 10,"MINUSCULAS --> "
contmin rb 1
contmas rb 1
