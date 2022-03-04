# Visualizza sul monitor ?, preleva dalla tastiera piu' caratteri,
# li visualizza  sul monitor e li immette in una variabile vettoriale. 
# Poi visualizza sul monitor il valore delle componenti della variabile
# vettoriale. Utilizza i sottoprogrammi inline e outline


.DATA
vett:  .FILL 10,1   # Variabile a 10 componenti di tipo byte

.TEXT
_main: NOP
       MOV  $'?',%AL
       CALL outchar
       CALL newline

       MOV $vett,%EBX
       MOV $10, %CX

       CALL inline
       CALL newline
       CALL outline

       RET

.INCLUDE "./files/utility.s" 
