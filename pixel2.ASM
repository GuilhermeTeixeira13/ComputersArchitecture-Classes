
; 2 � Exemplo - Mostrar um pixel no meio do ecr� mas utilizando a mistura de cores.
; Nota : Meu puto, quando o ecr� tiver com uma res tipo a do cs, 800x600, fazes "cls" na consola.
org 100h

;Definir modo gr�fico
mov ah, 4fh
mov al, 02h
mov bx, 13 ;Modo Gr�fico 320*320 16 cores
int 10h

; Como j� estamos em modo gr�fico, j� podemos descrever a fun��o que desenha um pixel.

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2 ;Porque o professor � Sportinguista logo a cor representada � o verde.
mov bh, 0 ; N�mero da p�gina, por defeni��o � sempre 0.
mov cx, 10 ; Coluna 10 (mais ou menos a meio do ecr�)
mov dx, 50 ; linha 50
int 10h


;Controla opera�oes nos registos de cor
mov ah, 10h
mov al, 10h
mov bx, 2  ; Cor a definir
mov dh, 20 ; Valor de vermelho
mov ch, 35 ; Valor de verde
mov cl, 50 ; Valor de azul
int 10h

;Terminar o programa
mov ah, 4ch
int 21h


