# Visualizza sul monitor ? e quindi preleva dalla tastiera le
# cifre (al piu' 3) di un numero naturale decimale. Converte
# in binario il numero prelevato e lo immette nel registro AL.
# Lo riconverte poi in decimale e lo visualizza sul monitor.
# Utilizza i sottoprogrammi indecimal_byte e outdecimal_byte.

.TEXT
_main: NOP
       MOV  $'?',%AL
       CALL outchar

       CALL newline
       CALL indecimal_byte
       CALL newline
       CALL outdecimal_byte
       
       RET

.INCLUDE "./files/utility.s" 
