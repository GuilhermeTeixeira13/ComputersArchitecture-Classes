
org 100h

;Definir modo gr�fico
mov ah, 4fh
mov al, 02h
mov bx, 13 ;Modo Gr�fico 320*320 16 cores
int 10h

; Como j� estamos em modo gr�fico, j� podemos descrever a fun��o que desenha um pixel

mov ah, 0ch
mov al, 2 ;Porque o professor � Sportinguista logo a cor representada � o verde.
mov bh, 0 ; N�mero da p�gina, por defeni��o � sempre 0.
mov cx, 150 ; Coluna 150 (mais ou menos a meio do ecr�)
mov dx, 100 ; Linha 100
int 10h

;Aguarda tecla
mov ah, 3Fh
int 21h

;Terminar o programa
mov ah, 4ch
int 21h




