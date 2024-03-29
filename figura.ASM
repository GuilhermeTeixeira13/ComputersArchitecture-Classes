org 100h

;Definir modo gr�fico
mov ah, 4fh
mov al, 02h
mov bx, 13h ;Modo Gr�fico 320*320 16 cores  ;Caso fossem 10h ficava com uma res melhor!.
int 10h

; Como j� estamos em modo gr�fico, j� podemos descrever a fun��o que desenha um pixel.

; Como fazer um ciclo, de forma a obter uma reta:
; - se for uma reta na horizontal, muda a coluna (cx)
; - se for uma reta na vertical , muda a linha (dx)
; - se for uma reta oblicua, muda-se o (cx) e (dx)

;Horizontal cima Coluna 170-225 Linha 100
mov [tamanho], 170

ciclo:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2 ;Porque o professor � Sportinguista logo a cor representada � o verde.
mov bh, 0 ; N�mero da p�gina, por defeni��o � sempre 0.
mov cx, [tamanho] ; Coluna
mov dx, 100 ; Linha
int 10h

add [tamanho], 1
cmp [tamanho], 225
jl ciclo


; Vertical esquerda Pixel Linha 100-155 Coluna 170
mov [tamanho1], 100

ciclo1:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2 ;Porque o professor � Sportinguista logo a cor representada � o verde.
mov bh, 0 ; N�mero da p�gina, por defeni��o � sempre 0.
mov cx, 170 ; Coluna
mov dx, [tamanho1] ; Linha
int 10h

add [tamanho1], 1
cmp [tamanho1], 155
jl ciclo1

;Horizontal baixo Coluna 170-225 Linha 155
mov [tamanho2], 170

ciclo2:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2 ;Porque o professor � Sportinguista logo a cor representada � o verde.
mov bh, 0 ; N�mero da p�gina, por defeni��o � sempre 0.
mov cx, [tamanho2] ; Coluna
mov dx, 155 ; Linha
int 10h

add [tamanho2], 1
cmp [tamanho2], 225
jl ciclo2

; Vertical direita Pixel Linha 100-155 Coluna 225
mov [tamanho3], 100

ciclo3:

mov ah, 0ch ; Func�o que escreve um pixel no ecr�.
mov al, 2 ;Porque o professor � Sportinguista logo a cor representada � o verde.
mov bh, 0 ; N�mero da p�gina, por defeni��o � sempre 0.
mov cx, 225 ; Coluna
mov dx, [tamanho3] ; Linha
int 10h

add [tamanho3], 1
cmp [tamanho3], 155
jl ciclo3

;Redefeni��o da cor.
mov ah, 10h
mov al, 10h
mov bx, 2  ; Cor a definir
mov dh, 20 ; Valor de vermelho
mov ch, 12 ; Valor de verde
mov cl, 50 ; Valor de azul;
;int 10h

;Terminar o programa
mov ah, 4ch
int 21h


tamanho rw 1 ; tamanho da reta, como queremos uma reta que n�o ocupeo tamanho da tela gr�fica, por isso 1 bite chega
             ; rb - reserve byte 8 bit rw - reserve word 16 bit

tamanho1 rw 1
tamanho2 rw 1
tamanho3 rw 1



; Desafios :
; - Fazer linhas que comecem sem ser no 0 ou seja, na extremidade da imagem.
; - Fazer figuras geom�tricas como por exemplo, quadrados, ret�ngulos...
; - Fazer uma circunfer�ncia.
