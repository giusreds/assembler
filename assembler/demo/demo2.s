# Variante di demo1

.DATA
mess:      .BYTE   0x0A,0x0D
           .ASCII  "Tutto OK"

.TEXT
_main:      NOP
            MOV  $0,%ESI        # ESI e' utilizzato come registro indice
            MOV  $10,%CX         
visualizza: MOV  mess(%ESI),%AL  
            CALL outchar
            INC  %ESI
            DEC  %CX
            JNZ  visualizza

            RET

.INCLUDE "./files/utility.s" 
