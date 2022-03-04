# Visualizza sul monitor gli asterischi come in figura. 

# <- N ->
# ******   
#     *
#    *
#   *
#  *
# *

# NOTA: Introdurre il numero N, che deve essere 
# maggiore di 1, con la direttiva .EQU N,...

.EQU N,8

.TEXT
_main:                 NOP

prima_riga:            MOV  $N,%CX
                       CALL newline
asterischi_prima_riga: MOV  $'*',%AL
                       CALL outchar
                       DEC  %CX
                       JNZ  asterischi_prima_riga

                       MOV  $(N-1),%CX
altre_righe:           CALL newline
                       DEC  %CX
                       JZ   asterisco_ultima_riga
                       MOV  %CX,%BX
spazi:                 MOV  $' ',%AL
                       CALL outchar
                       DEC  %BX
                       JNZ  spazi
asterisco_fine_riga:   MOV  $'*',%AL
                       CALL outchar
                       JMP  altre_righe

asterisco_ultima_riga: MOV  $'*',%AL
                       CALL outchar
                       
                       CALL newline
                       RET

.INCLUDE "./files/utility.s" 
