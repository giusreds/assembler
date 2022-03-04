# Visualizza sul monitor ? e quindi preleva dalla tastiera le
# cifre (al piu' 10) di un numero naturale decimale. Converte
# in binario il numero prelevato e lo immette nel registro EAX.
# Lo riconverte poi in decimale e lo visualizza sul monitor.
# Utilizza i sottoprogrammi indecimal_long e outdecimal_long.

.TEXT
_main: NOP
       MOV  $'?',%AL
       CALL outchar

       CALL newline
       CALL indecimal_long
       CALL newline
       CALL outdecimal_long

       RET


.INCLUDE "./files/utility.s" 
