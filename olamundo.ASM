org 100h

mov ah, 40h    ;ah ? 40h (fun��o de escrita)
mov bx, 1      ;bx ? 1 (1=ecr�)
mov cx, 10      ;cx ? 9 (n�mero de caracteres a escrever )
mov dx, msg1    ;dx ? endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
int 21h        ;provoca a execu��o da ac��o (escrita)

mov ah, 40h    ;ah ? 40h (fun��o de escrita)
mov bx, 1      ;bx ? 1 (1=ecr�)
mov cx, 9      ;cx ? 9 (n�mero de caracteres a escrever )
mov dx, msg2    ;dx ? endere�o da vari�vel "msg" (dx aponta para os dados a escrever)
int 21h        ;provoca a execu��o da ac��o (escrita)

mov ah, 3fh
int 21h

mov ah, 4Ch    ;ah ? 4Ch (fun��o para terminar a execu��o de um programa)
int 21h        ;provoca a execu��o da ac��o (termina o programa)

msg1 db 79,108,"a mundo",10   ;define a vari�vel "msg"
msg2 db "Ola mundo"   ;define a vari�vel "msg"
