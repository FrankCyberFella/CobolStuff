       IDENTIFICATION DIVISION.
       PROGRAM-ID. Collectie-Manager.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY 'copybooks/Collecties-Table.cpy'.
       COPY 'copybooks/Dodud.cpy'. 
       COPY 'copybooks/Rextore.cpy'. 
       01  PROTECTOR-IDX PIC 99 VALUE ZERO.
       01  loop-idx PIC 99 value 1.
       01  table-idx PIC 99 value ZERO.
       01  concat-string PIC X(1024) value SPACES.
       01  new-line PIC X value X'0A'.
       01  random-int PIC 999.
                 
       LINKAGE SECTION.
       01  input-string PIC X(100).
       01  output-string PIC X(1024).
       01  COLLECTIE-ID PIC 99 VALUE ZERO.
      
       
       PROCEDURE DIVISION.

       entry 'ADD-DODUD'.
           ADD 1 TO table-idx.
           MOVE Dodud TO collectie(table-idx).
           PERFORM ADD-RANDOM-NAME.
           IF PROTECTOR-IDX EQUALS ZERO THEN
               MOVE table-idx TO PROTECTOR-IDX.
           GOBACK.

       entry 'ADD-REXTORE' USING COLLECTIE-ID.
           ADD 1 TO table-idx.
           
           MOVE Rextore TO collectie(table-idx).
           PERFORM ADD-RANDOM-NAME.
           IF PROTECTOR-IDX EQUALS ZERO THEN
               MOVE table-idx TO PROTECTOR-IDX.

           MOVE table-idx TO COLLECTIE-ID.
           GOBACK.

       ENTRY 'GET-SPECIES' USING COLLECTIE-ID, OUTPUT-STRING.
           MOVE species of collectie(COLLECTIE-ID) TO output-string.
           GOBACK.

       ENTRY 'RENAME-COLLECTIE' USING COLLECTIE-ID, INPUT-STRING.
              MOVE INPUT-STRING 
                   TO collectie-name of collectie(COLLECTIE-ID).
              GOBACK.
       
       ENTRY 'GET-NAME' USING COLLECTIE-ID, OUTPUT-STRING.
           MOVE collectie-name of collectie(COLLECTIE-ID) 
               TO output-string.
           GOBACK.

       entry 'SHOW-GRAPHIC' using output-string.    
           MOVE graphic of collectie(PROTECTOR-IDX) TO output-string.
           GOBACK.
       
       entry 'GET-COLLECTION' using output-string.
           string 
               'Collectie Collection'
               X'0A'
               into concat-string
           end-string.

           PERFORM VARYING loop-idx FROM 1 BY 1 
               UNTIL loop-idx > table-idx

               STRING
                   '[' loop-idx '] '
                   FUNCTION trim(collectie-name 
                       of collectie(loop-idx))
                   ' (' 
                   FUNCTION trim(species of collectie(loop-idx))
                   ')'
                   X'0A'
                   into concat-string
               END-STRING

               STRING 
                   FUNCTION trim(output-string)
                   FUNCTION trim(concat-string) 
                   INTO output-string
               END-STRING

           END-PERFORM.
           GOBACK.
           
           
       ADD-RANDOM-NAME.
           CALL 'get-random-percent' USING random-int.
           STRING
               FUNCTION TRIM(species OF collectie(table-idx)) 
               ' '
               random-int
               INTO collectie-name OF collectie(table-idx).
