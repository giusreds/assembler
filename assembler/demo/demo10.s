# Visualizza sul monitor ? e quindi preleva dalla tastiera le
# cifre (al piu' 5) di un numero naturale decimale. Converte
# in binario il numero prelevato e lo immette nel registro AX.
# Lo riconverte poi in decimale e lo visualizza sul monitor.
# Utilizza i sottoprogrammi indecimal_word e outdecimal_word.

.TEXT
_main: NOP
       MOV  $'?',%AL
       CALL outchar

       CALL newline
       CALL indecimal_word
       CALL newline
       CALL outdecimal_word
       
       RET

.INCLUDE "./files/utility.s" 
