# Visualizza sul monitor ?, preleva dalla tastiera un long (cioe'
# 8 cifre esadecimai) e quindi conta e visualizza sul monitor
# il numero (decimale) delle  coppie di bit 01 presenti nel long 
# prelevato. Utilizza i sottoprogrammi inlong e outdecimal_byte.

.TEXT
_main: NOP
       MOV  $'?',%AL
       CALL outchar

       CALL newline
       CALL inlong

       MOV  $0,%CX        # CX = Contatore delle coppie
ciclo: MOV  %EAX,%EDX
       AND  $0xC0000000,%EDX
       CMP  $0x40000000,%EDX
       JNE  step
       INC  %CX
step:  SHL  $1,%EAX
       JNZ  ciclo

fine:  MOV  %CX,%AX
       CALL newline
       CALL outdecimal_byte

       RET

.INCLUDE "./files/utility.s" 

