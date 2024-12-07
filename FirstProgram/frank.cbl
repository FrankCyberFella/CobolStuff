IDENTIFICATION DIVISION.
PROGRAM-ID. HELLOWORLD.
 DATA DIVISION.
 WORKING-STORAGE Section.
 01 ws-Result pic x(50).

PROCEDURE DIVISION.
move "Franks code" to ws-Result.
DISPLAY "HELLO WORLD".
display ws-Result.
goback.
