org 100h

escrita equ 40h
ecran equ 1

; Chamada das subrotinas
call primeiroCiclo
call escreverSep
call segundoCiclo

; Fica � espera de input
mov ah, 07h
int 21h

;Termina
mov ah, 4ch
int 21h

; Definimos as mensagens
msg db "UBI ", 10
msgSep db "---", 10



; Escreve a mensagem "UBI \n" no ecram
escrever: ; --> Subrotina --> Tem de estar depois do corpo do programa
mov ah, escrita
mov bx, ecran
mov cx, 5
mov dx, msg
int 21h
ret ; --> N�o esquecer o ret

; Escreve a separa��o no ecram
escreverSep: ; --> Subrotina --> Tem de estar depois do corpo do programa
mov ah, escrita
mov bx, ecran
mov cx, 4
mov dx, msgSep
int 21h
ret ; --> N�o esquecer o ret

;Cria o primeiro ciclo que imprime a mesma mensagem 3 vezes
primeiroCiclo:
mov cx, 3 ; -> Para repetir 3x
primeirociclo:
push cx; --> Importante - Rever te�rica (A subrotina escrever utiliza o cx)
call escrever ; --> Chamar a subrotina escrever
pop cx; --> Importante - Rever te�rica (A subrotina escrever utiliza o cx)
loop primeirociclo ; Volta ao in�cio sempre que cx != 0
ret ;--> N�o esquecer o ret

; Cria o segundo ciclo que imprime a mesma mensagem 5 vezes
segundoCiclo:
mov cx, 5 ; -> Para repetir 35x
segundociclo:
push cx; --> Importante - Rever te�rica (A subrotina escrever utiliza o cx)
call escrever ; --> Chamar a subrotina escrever
pop cx; --> Importante - Rever te�rica (A subrotina escrever utiliza o cx)
loop segundociclo ; Volta ao in�cio sempre que cx != 0
ret ;--> N�o esquecer o ret


;mov cx, valor inicial
;label:
; instru.A
; ...
; loop label

;executa o ciclo a partir de label, enquanto o cx n�o for zero
