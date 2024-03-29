; LEITOR DE FICHEIROS SEM ESPECIFICAR O N�MERO DE CARATERES----------- ERROS----------

org 100h

terminar equ 4ch
fechar equ 3eh
criar equ 3ch
escrever equ 40h
abrir equ  3dh
ler equ 3fh

;Abrir Ficheiro
mov ah, abrir
mov al, 0 ; Abrir s� para leitura (1 para abrir para escrita)
mov dx, path ; nome do ficheiro
int 21h

jc erro ; Tratar o erro se houver
mov [handle], ax  ; Porque que quando se cria um ficheiro esquecese-se o nome e cria-se um n�mero (handle).


ciclo:
; Ler no ficheiro      ; SAIDA : AX = n�mero de bytes lidos

mov ah, ler
mov bx, [handle]  ; N�o � no ecr�, � no handle (ler)
mov cx, 1         ; n�mero de caracteres a serem lidos
mov dx, msg       ; Vari�vel em que ser� guardado o que foi lido
int 21h

cmp ax, 0   ; Se for 0 n�o conseguiu ler
je sair     ; Se for 0, ou seja, se n conseguir ler, sai

; Escrever o car�ter lido
mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, msg
int 21h

jmp ciclo ; Voltar para o ciclo

; Fun��o Fecho
sair:
mov ah, fechar
mov bx, [handle]
int 21h

; Escrever o conte�do do ficheiro

mov ah, escrever
mov bx, 1
mov cx, 1
mov dx, msg
int 21h

jmp fim

; Tratar erro

erro:
mov ah, escrever
mov bx, 1
mov cx, 28
mov dx, msgerr
int 21h

; terminar
fim:
mov ah, terminar
int 21h



handle rw 1 ; Handle do ficheiro
path db "exemplo2.txt", 0 ; formato ASCIIZ --> o 0 final � muito importante!
msg rb 1
msgerr db  "Erro na abertura do ficheiro"