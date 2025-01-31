       IDENTIFICATION DIVISION.
       PROGRAM-ID. Consumable-Manager.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  CORE-CONSUMABLES-LENGTH PIC 999 VALUE 2.
       01  CORE-CONSUMABLES-TABLE.
           05 CORE-CONSUMABLE OCCURS 2 TIMES.
               10 CONSUMABLE-NAME PIC X(64).
               10 CONSUMABLE-COUNT PIC 9.

       01  FOUND-CONSUMABLES-TABLE.
           05 FOUND-CONSUMABLE OCCURS 20 TIMES.
               10 CONSUMABLE-NAME PIC X(64) VALUE SPACES.
               10 CONSUMABLE-COUNT PIC 9 VALUE 0.

       01  TABLE-IDX PIC 999 VALUE 1.
       01  LOOP-IDX PIC 99.
       01  DISPLAY-IDX PIC Z9.
       01  FOUND-IDX PIC 99 VALUE 0.
         
       LINKAGE SECTION.
       01  OUTPUT-STRING PIC X(1024) VALUE SPACES.
       
       PROCEDURE DIVISION.

       entry 'INIT-CONSUMABLES'.
           MOVE "Small Pizza with Dodud Sausage" 
               TO CONSUMABLE-NAME OF CORE-CONSUMABLE (1).
           MOVE 4 TO CONSUMABLE-COUNT OF CORE-CONSUMABLE (1).
           MOVE "Rextore Claws Energy Drink" 
               TO CONSUMABLE-NAME OF CORE-CONSUMABLE (2).
           MOVE 1 TO CONSUMABLE-COUNT OF CORE-CONSUMABLE (2).
           MOVE SPACES TO FOUND-CONSUMABLES-TABLE.
           MOVE 0 TO FOUND-IDX.

           GOBACK.


       ENTRY 'GET-RANDOM-CONSUMABLE' USING OUTPUT-STRING.

           CALL 'get-random-int' 
               USING TABLE-IDX, CORE-CONSUMABLES-LENGTH.
    
           ADD 1 TO FOUND-IDX.

           MOVE CORE-CONSUMABLE(TABLE-IDX) 
               TO FOUND-CONSUMABLE(FOUND-IDX).

           STRING
               FUNCTION TRIM(
                   CONSUMABLE-NAME OF FOUND-CONSUMABLE(FOUND-IDX)) 
               ' (' 
               FUNCTION TRIM(
                   CONSUMABLE-COUNT OF FOUND-CONSUMABLE(FOUND-IDX))
               ')'
               INTO output-string.

           GOBACK.

           ENTRY 'GET-CONSUMABLES' USING OUTPUT-STRING.
               MOVE SPACES TO OUTPUT-STRING.

               PERFORM VARYING LOOP-IDX FROM 1 BY 1 
                   UNTIL LOOP-IDX > FOUND-IDX

                   MOVE LOOP-IDX TO DISPLAY-IDX

                   STRING 
                       FUNCTION TRIM(OUTPUT-STRING)
                       '['
                       FUNCTION TRIM(DISPLAY-IDX)
                       '] '
                       FUNCTION TRIM(CONSUMABLE-NAME 
                           OF FOUND-CONSUMABLE(LOOP-IDX))
                       ' ('
                       FUNCTION TRIM(CONSUMABLE-COUNT 
                           OF FOUND-CONSUMABLE(LOOP-IDX))
                       ')'
                          X'0A'
                       INTO OUTPUT-STRING

               END-PERFORM. 
               GOBACK.

       end program Consumable-Manager.
               
