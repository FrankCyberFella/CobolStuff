       IDENTIFICATION DIVISION.
       PROGRAM-ID. Collectie-Manager.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY 'lib/Collecties-Table'.
       COPY 'lib/Dodud'. 
       COPY 'lib/Rextore'. 
       01  PROTECTOR-IDX PIC 99 VALUE ZERO.
       01  loop-idx PIC 99 value 1.
       01  table-idx PIC 99 value ZERO.
       01  source-idx PIC 99 value ZERO.
       01  concat-string PIC X(1024) value SPACES.
       01  new-line PIC X value X'0A'.
       01  random-int pic 999.
       
       
                 
       LINKAGE SECTION.
       01  input-string PIC X(100).
       01  output-string PIC X(1024).
       01  CLONE-ID PIC 99 VALUE ZERO.
       01  output-int comp-2.

       *> TODO: DRY Linked Collecties
       01  LINKED-COLLECTIE-A.
           05  collectie-id PIC 999.
           05  collectie-name PIC X(64).
           05  species PIC X(64).
           05  collectie-type PIC X(64).
           05  sound PIC X(64).
           05  preferred-biome PIC X(64).
           05  attack-power PIC 999.
           05  defend-floor pic 999.
           05  graphic PIC X(1024).
       01  LINKED-COLLECTIE-B.
           05  collectie-id PIC 999.
           05  collectie-name PIC X(64).
           05  species PIC X(64).
           05  collectie-type PIC X(64).
           05  sound PIC X(64).
           05  preferred-biome PIC X(64).
           05  attack-power PIC 999.
           05  defend-floor pic 999.
           05  graphic PIC X(1024).
      
       
       PROCEDURE DIVISION.
       
       entry 'INIT-COLLECTIES'.
           MOVE ZERO TO PROTECTOR-IDX.
           MOVE 1 TO loop-idx.
           MOVE ZERO TO table-idx.
           MOVE ZERO TO source-idx.
           goback.

       entry 'ADD-DODUD' USING LINKED-COLLECTIE-A.
           ADD 1 TO table-idx.
           MOVE Dodud TO collectie(table-idx).
           MOVE table-idx to collectie-id of collectie(table-idx).
           PERFORM ADD-RANDOM-NAME.
           IF PROTECTOR-IDX EQUALS ZERO THEN
               MOVE table-idx TO PROTECTOR-IDX.
           MOVE collectie(table-idx) TO LINKED-COLLECTIE-A.
           GOBACK.

       entry 'ADD-REXTORE' USING LINKED-COLLECTIE-A.
           ADD 1 TO table-idx.
           MOVE Rextore TO collectie(table-idx).
           MOVE table-idx to collectie-id of collectie(table-idx).
           PERFORM ADD-RANDOM-NAME.
           IF PROTECTOR-IDX EQUALS ZERO THEN
               MOVE table-idx TO PROTECTOR-IDX.
           MOVE collectie(table-idx) TO LINKED-COLLECTIE-A.
           GOBACK.

       ENTRY 'RENAME-COLLECTIE' USING LINKED-COLLECTIE-A, INPUT-STRING.
              MOVE INPUT-STRING 
                   TO collectie-name of 
                       collectie(collectie-id of LINKED-COLLECTIE-A).
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

       entry 'CLONE' using LINKED-COLLECTIE-A, LINKED-COLLECTIE-B.
           move LINKED-COLLECTIE-A to LINKED-COLLECTIE-B.
           goback. 

       entry 'DEFEND' using LINKED-COLLECTIE-A, output-int.

           call 'get-random-percent' using random-int.

           if random-int < defend-floor of LINKED-COLLECTIE-A then
               move 0 to output-int
           else
               move 1 to output-int
           end-if.

           goback.
         
           
       ADD-RANDOM-NAME.
           CALL 'get-random-percent' USING random-int.
           
           STRING
               FUNCTION TRIM(species OF collectie(table-idx)) 
               ' '
               random-int
               INTO collectie-name OF collectie(table-idx).  
       
           

       end program Collectie-Manager.

       
       