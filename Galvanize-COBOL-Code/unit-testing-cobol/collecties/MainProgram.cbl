       IDENTIFICATION DIVISION.
       PROGRAM-ID. MainProgram.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  INPUT-STRING PIC X(1024).
       01  OUTPUT-STRING PIC X(1024).
       01  STATE PIC X(64) VALUE 'INIT'.
       01  NEW-LINE PIC X VALUE X'0A'.
       01  COLLECTIE-ID PIC 99 VALUE ZERO.
       01  PENDING-RENAME PIC X(64) VALUE SPACES.
       01  CURRENT-BIOME PIC X(64) VALUE SPACES.
       
       LINKAGE SECTION.
       
       PROCEDURE DIVISION.
       MAIN.
           PERFORM GAME-LOOP until STATE = 'DONE'.
           STOP RUN.

       GAME-LOOP.
           EVALUATE STATE
              WHEN 'INIT'
                   PERFORM INIT
              WHEN 'QUIT'
                     PERFORM QUIT
              WHEN 'WELCOME'
                     PERFORM WELCOME
              WHEN 'GIVE-INITIAL-COLLECTIE'
                     PERFORM GIVE-INITIAL-COLLECTIE
              WHEN 'PROMPT-TO-RENAME-NEW-COLLECTIE'
                     PERFORM PROMPT-TO-RENAME-NEW-COLLECTIE
              WHEN 'RENAME-NEW-COLLECTIE'
                     PERFORM RENAME-NEW-COLLECTIE
              WHEN 'ENTER-BIOME'
                     PERFORM ENTER-BIOME
              WHEN 'TRAVEL'
                     PERFORM TRAVEL
              WHEN 'EXPLORE'
                     PERFORM EXPLORE
              WHEN 'FIND-CONSUMABLE'
                     PERFORM FIND-CONSUMABLE
              WHEN 'MANAGE-COLLECTION'
                     PERFORM MANAGE-COLLECTION
              WHEN 'SHOW-COLLECTION'
                     PERFORM SHOW-COLLECTION
              WHEN 'SHOW-CONSUMABLES'
                     PERFORM SHOW-CONSUMABLES
              WHEN 'FEED-COLLECTIE'
                     PERFORM FEED-COLLECTIE
              WHEN 'RENAME-EXISTING-COLLECTIE'
                   PERFORM RENAME-EXISTING-COLLECTIE
              WHEN 'SET-PROTECTOR'
                     PERFORM SET-PROTECTOR
              WHEN OTHER
                     PERFORM UNRECOGNIZED-STATE
           END-EVALUATE.
           
           
       INIT.
           CALL 'INIT-BIOMES'.
           CALL 'INIT-CONSUMABLES'.
           CALL 'GET-RANDOM-BIOME' USING CURRENT-BIOME.
           MOVE 'WELCOME' TO STATE.
           

       WELCOME.
           STRING '*------------------------------------------*'
               NEW-LINE
               '| Welcome to the wild world of Collecties! |'
               NEW-LINE
               '*------------------------------------------*'
               into output-string.

           PERFORM PRINT.
           MOVE 'GIVE-INITIAL-COLLECTIE' TO STATE.

       UNRECOGNIZED-STATE.
           STRING 'unrecognized state ' state '!!!' 
                       INTO output-string.
           PERFORM PRINT.
           MOVE 'QUIT' TO state. 

       QUIT.
           MOVE 'Thank you for playing!' TO output-string.
           PERFORM PRINT.
           MOVE 'DONE' TO STATE.
      

       GIVE-INITIAL-COLLECTIE.
              CALL 'ADD-REXTORE' USING COLLECTIE-ID.
              CALL 'GET-SPECIES' USING COLLECTIE-ID, INPUT-STRING.
              
           STRING 
               'To start your collection you were given a '
               FUNCTION TRIM(INPUT-STRING)
               '!'
               INTO output-string.
           PERFORM PRINT.
           MOVE 'PROMPT-TO-RENAME-NEW-COLLECTIE' TO STATE.
           

       PROMPT-TO-RENAME-NEW-COLLECTIE.
              CALL 'GET-SPECIES' USING COLLECTIE-ID, INPUT-STRING.
              
           STRING 'Would you like to rename your new '
               FUNCTION TRIM(input-string)
               '?'
               NEW-LINE
               '[y/n]?: ' 
               INTO output-string.
           
              PERFORM PRINT-INLINE.

              PERFORM ACCEPT-INPUT.

              IF  FUNCTION LOWER-CASE(input-string) = 'y' THEN
                  MOVE 'RENAME-NEW-COLLECTIE' TO STATE
              ELSE
                  MOVE 'ENTER-BIOME' TO STATE
              END-IF.

       RENAME-NEW-COLLECTIE.

           CALL 'GET-SPECIES' USING COLLECTIE-ID, INPUT-STRING.
              
              STRING 
                   'Renaming '
                   FUNCTION TRIM(input-string) 
                   ' named '
                   INTO output-string.

                 PERFORM PRINT-INLINE.

                 CALL 'GET-NAME' USING COLLECTIE-ID, OUTPUT-STRING.

                 STRING
                         FUNCTION TRIM(output-string)
                         '...' 
                         NEW-LINE
                         '?: '
                         INTO output-string.
                 
                 PERFORM PRINT-INLINE.


              PERFORM ACCEPT-INPUT.

              MOVE input-string TO PENDING-RENAME.
              STRING 
                     'You have chosen the name: ' 
                     input-string
                  INTO output-string

              PERFORM PRINT.

              STRING 
                  'Confirm rename?' 
                  new-line 
                  '[y/n]?: '
                  INTO output-string.
              
              PERFORM PRINT-INLINE.
              PERFORM ACCEPT-INPUT.

           IF FUNCTION LOWER-CASE(input-string) = 'y' 
               CALL 'RENAME-COLLECTIE' 
                     USING COLLECTIE-ID, PENDING-RENAME
      *    TODO: show rename confirmation?    
               MOVE 'ENTER-BIOME' TO STATE
           ELSE 
               MOVE 'RENAME-NEW-COLLECTIE' TO STATE        
           END-IF.

       ENTER-BIOME.
           STRING 
              'You find yourself in a '
               FUNCTION TRIM(current-biome) 
               ' biome.' NEW-LINE
               'What would you like to do?' NEW-LINE
               '[1] Travel to the next Biome' NEW-LINE
               '[2] Explore' NEW-LINE
               '[3] Manage Collection' NEW-LINE
               '[4] Exit' NEW-LINE
               '?: '
               INTO output-string.

           PERFORM PRINT-INLINE.

           PERFORM ACCEPT-INPUT.

           EVALUATE input-string
               WHEN '1'
                   MOVE 'TRAVEL' TO STATE
               WHEN '2'
                   MOVE 'EXPLORE' TO state
               WHEN '3'
                   MOVE 'MANAGE-COLLECTION' TO state
               WHEN '4'
                   MOVE 'QUIT' TO state
               WHEN OTHER
                   STRING 'unrecognized choice ' input-string 
                       INTO output-string
                   PERFORM PRINT
           END-EVALUATE.
           

       TRAVEL.
           CALL 'GET-RANDOM-BIOME' USING CURRENT-BIOME.
           MOVE 'traveling...' TO output-string.
           PERFORM PRINT.
           MOVE 'ENTER-BIOME' TO STATE.

       EXPLORE.
              STRING 
               'Exploring the '
               FUNCTION TRIM(CURRENT-BIOME) 
               ' biome around you......' 
               INTO output-string.
           
           PERFORM PRINT.

           MOVE 'FIND-CONSUMABLE' TO STATE.

       FIND-CONSUMABLE.
              CALL 'GET-RANDOM-CONSUMABLE' USING INPUT-STRING.
              STRING 
                'You found a '
                FUNCTION TRIM(INPUT-STRING)
                ' while exploring.'
                NEW-LINE
                'It has been added to your consumables.'
                INTO OUTPUT-STRING.
              PERFORM PRINT.
              MOVE 'ENTER-BIOME' TO STATE.


       MANAGE-COLLECTION.
           STRING
               'What would you like to do?' NEW-LINE
               '[1] Show Collection' NEW-LINE
               '[2] Show Consumables' NEW-LINE
               '[3] Feed Collectie' NEW-LINE
               '[4] Rename Collectie' NEW-LINE
               '[5] Set Protector' NEW-LINE
               '[6] Exit' NEW-LINE
               '?: '
               into output-string.
               
               PERFORM PRINT-INLINE.
               PERFORM ACCEPT-INPUT.

               EVALUATE input-string
                   WHEN '1'
                       MOVE 'SHOW-COLLECTION' TO STATE
                   WHEN '2'
                       MOVE 'SHOW-CONSUMABLES' TO STATE
                   WHEN '3'
                       MOVE 'FEED-COLLECTIE' TO STATE
                   WHEN '4'
                       MOVE 'RENAME-EXISTING-COLLECTIE' TO STATE
                   WHEN '5'
                       MOVE 'SET-PROTECTOR' TO STATE
                   WHEN '6'
                       MOVE 'ENTER-BIOME' TO STATE
                   WHEN OTHER
                       MOVE 'unrecognized choice' to OUTPUT-STRING
                       PERFORM PRINT
                       MOVE 'MANAGE-COLLECTION' TO STATE
               END-EVALUATE.

       SHOW-COLLECTION.
           CALL 'GET-COLLECTION' USING OUTPUT-STRING.
           PERFORM PRINT.
           MOVE 'MANAGE-COLLECTION' TO STATE. 

       SHOW-CONSUMABLES.
              CALL 'GET-CONSUMABLES' USING OUTPUT-STRING.
              PERFORM PRINT.
              MOVE 'MANAGE-COLLECTION' TO STATE.

       FEED-COLLECTIE.

           STRING 'Select one of your collecties:'
               NEW-LINE
               'Collectie Collection'
               INTO OUTPUT-STRING.
               PERFORM PRINT.
               CALL 'GET-COLLECTION' USING OUTPUT-STRING.
               PERFORM PRINT.
                MOVE '?: ' TO OUTPUT-STRING.
                PERFORM PRINT-INLINE.
                PERFORM ACCEPT-INPUT.
                   MOVE 'Choose a consumable to give to Jojo:' 
                       TO OUTPUT-STRING.
                   PERFORM PRINT.
                   CALL 'GET-CONSUMABLES' USING OUTPUT-STRING.
                   PERFORM PRINT.
                   MOVE '?: ' TO OUTPUT-STRING.
                   PERFORM PRINT-INLINE.
                   PERFORM ACCEPT-INPUT.
      *             CALL 'FEED-COLLECTIE' 
      *                 USING COLLECTIE-ID, INPUT-STRING.
      *         [1] Small Pizza with Dodud Sausage (4)
      *         ?: 1
      *         You give Jojo the Small Pizza with Dodud Sausage (4)
      *         Jojo could not finish all of the Small Pizza with Dodud Sausage (3).
      *         There is some left over for later.
             MOVE 'MANAGE-COLLECTION' TO STATE.

       RENAME-EXISTING-COLLECTIE.
              display 'TODO rename collectie'.
              MOVE 'MANAGE-COLLECTION' TO STATE.

       SET-PROTECTOR.
              display 'TODO set protector'.
              MOVE 'MANAGE-COLLECTION' TO STATE.
              
       PRINT.
           CALL 'output' USING OUTPUT-STRING.

       PRINT-INLINE.
           CALL 'output-inline' USING OUTPUT-STRING.

       ACCEPT-INPUT.
              CALL 'input' USING INPUT-STRING.

