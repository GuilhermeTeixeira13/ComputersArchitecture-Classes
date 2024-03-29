;;;; DESAFIO --> Fazer para 3 d�gitos
;;;; Subject Aula 3 !!!!!!!

org 100h

escrever equ 40h ; escrever � equivalente a 4h
ecran equ 1      ; ecran � equivalente a 1
ler equ 3fh      ; ler � equivalente a 3fh
terminar equ 21h ; terminar � equivalente a 21h


mov [cont], 15 ; --> colocar 15 no conte�do da vari�vel [OS PARENTISES S�O IMPORTANTES]

ciclo: ; � uma label (etiqueta) --> n�o escrever com letra mai�scula e n�o esquecer os dois pontos

; DIVIS�O
mov ah, 0
mov al, [cont]     ; -- > valor que queremos dividir
mov bl, 10         ; --> bl ou qualquer outro registo de 8 bit
div bl             ; --> divide AX (cont) por bl --> divis�o inteira --> coloca quociente no regisot AL e o resto no registo AH
mov [dezenas], al  ; --> Cria uma vari�vel "dezenas" com o conte�do de al
mov [unidades], ah ; --> Cria uma vari�vel "unidades" com o conte�do de al

add [dezenas], 48 ; --> sem isto iria escrever os s�mbolos que cont�m os caracteres dos 15 primeiros n�meros da tabela ascii
mov ah, escrever ;ah ? 40h (fun��o de escrita)
mov bx, ecran    ;bx ? 1 (1=ecr�)
mov cx, 1        ;cx ? 10 (n�mero de caracteres a escrever )
mov dx, dezenas  ;dx ? endere�o da vari�vel "dezenas" (dx aponta para os dados a escrever)
int terminar     ;provoca a execu��o da ac��o (escrita)

add [unidades], 48 ; --> sem isto iria escrever os s�mbolos que cont�m os caracteres dos 15 primeiros n�meros da tabela ascii
mov ah, escrever ;ah ? 40h (fun��o de escrita)
mov bx, ecran    ;bx ? 1 (1=ecr�)
mov cx, 1        ;cx ? 10 (n�mero de caracteres a escrever )
mov dx, unidades ;dx ? endere�o da vari�vel "unidades" (dx aponta para os dados a escrever)
int terminar     ;provoca a execu��o da ac��o (escrita)

; ESCRITA PARA PASSAR DE LINHA
mov ah, escrever
mov bx, ecran
mov cx, 1
mov dx, novalinha
int terminar

sub [cont], 1; cont = cont - 1

jnz ciclo ; jump, if not zero, to ciclo --> termina o ciclo se o contador for zero

; FICA H� ESPERA QUE SEJA INTRODUZIDO UM CARACTER
mov ah, ler
int 21h

mov ah, 4Ch      ;ah , 4Ch (fun��o para terminar a execu��o de um programa)
int terminar     ;provoca a execu��o da ac��o (termina o programa)


novalinha db 10 ; --> novalinha contem o '\n', ou seja, 10 em decimal a partir da tabela ascii
cont rb 1       ; reserva um byte --> com um byte pode contar-se de 0 a 255
dezenas rb 1    ; reserva um byte
unidades rb 1   ; reserva um byte
