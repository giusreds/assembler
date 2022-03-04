# Altra variante di demo1 in cui e' previsto il ricorso a un sottoprogramma

.DATA
mess:     .BYTE   0x0A,0x0D
             .ASCII  "Tutto OK"

.TEXT
_main:    NOP
              MOV  $mess,%EBX  # Passaggio dei parametri
              MOV  $10,%CX       # necessari al sottoprogramma
              CALL visualizza

              RET

# sottoprogramma utente
visualizza:   PUSH %EBX
              PUSH %CX
to_monitor:   MOV  (%EBX),%AL
              CALL outchar
              INC  %EBX
              DEC  %CX
              JNZ  to_monitor
              POP  %CX
              POP  %EBX
              RET

.INCLUDE "./files/utility.s" 
