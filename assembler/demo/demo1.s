# Visualizza sul monitor piu' caratteri ASCII.
# Utilizza i sottoprogrammi outchar e exit (e dentro di esso, inchar)

.DATA
mess:      .BYTE   0x0A,0x0D
           .ASCII  "Tutto OK"
.TEXT
_main:      NOP

            MOV  $mess,%EBX   # EBX e' utilizzato come registro puntatore
            MOV  $10,%CX      # CX  e' utilizzato come registro contatore

visualizza: MOV  (%EBX),%AL  
            CALL outchar
            INC  %EBX
            DEC  %CX
            JNZ  visualizza

            RET

.INCLUDE "./files/utility.s" 
