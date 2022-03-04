# Visualizza sul monitor un quadrato di asterischi come in figura.

# <- N ->
# ******
# *    *
# *    *
# *    *
# *    *
# ******
 
# NOTA: Introdurre il numero N, che deve essere maggiore di 1,
# con la direttiva  .EQU N,.... Attualmente N e' fissato a 6


.EQU N,6

.TEXT
_main:    NOP
          CALL newline
          MOV  $N,%CL
          CALL base
continua: CALL newline
          CMP  $2,%CL
          JE   finale
          CALL altre
          DEC  %CL
          JMP  continua
finale:   CALL base
          CALL newline
          RET


# Sottoprogrammi utente
base:     PUSH %CX
          PUSH %AX
          MOV  $N,%CL
          MOV  $0x2A,%AL
vai_0:    CALL outchar
          DEC  %CL
          JNZ  vai_0
          POP  %AX
          POP  %CX
          RET

altre:    PUSH %CX
          PUSH %AX
          MOV  $N,%CL
          MOV  $0x2A,%AL
          CALL outchar
          MOV  $0x20,%AL
vai_1:    CALL outchar
          DEC  %CL
          CMP  $2,%CL
          JNE  vai_1
          MOV  $0x2A,%AL
          CALL outchar
          POP  %AX
          POP  %CX
          RET

.INCLUDE "./files/utility.s" 
