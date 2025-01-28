       IDENTIFICATION DIVISION.
       PROGRAM-ID. Collecties.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  output-string PIC X(1024) value SPACES.
       01  input-string PIC X(1024) value SPACES.
       01  new-line PIC X value X'0A'.
       01  state PIC X(64) value 'INIT'.
       01  current-biome PIC X(64) value SPACES.
       01 current-collectie.
           02 collectie-name PIC X(64) value SPACES.
       
          
       LINKAGE SECTION.
       
       PROCEDURE DIVISION.
       main.
           perform gameLoop until state = 'DONE'.
           goback.
    
       gameLoop.
           evaluate state
               when 'INIT'
                   perform init
               when 'WELCOME'
                   perform welcome
               when 'QUIT'
                   perform quit
               when 'GIVE-INITIAL-COLLECTIE'
                   perform giveInitialCollectie
               when 'PROMPT-TO-RENAME-COLLECTIE'
                   perform promptToRenameCollectie
               when 'RENAME-COLLECTIE'
                   perform renameCollectie
               when 'ENTER-BIOME'
                   perform enterBiome
               when 'TRAVEL'
                   perform travel
               when 'EXPLORE'
                   perform explore
               when 'MANAGE-COLLECTION'
                   perform manageCollection
               when 'SHOW-COLLECTION'
                   perform showCollection
               when 'SHOW-CONSUMABLES'
                   perform showConsumables
               when 'FEED-COLLECTIE'
                   perform feedCollectie
               when 'SET-PROTECTOR'
                   perform setProtector
               when 'RUN-FROM-ENCOUNTER'
                   perform runFromEncounter
               when 'ATTACK'
                   perform attack
               when other
                   perform unrecognizedState
               
           end-evaluate.

       init.
           move 'WELCOME' to state.
           call 'init-biomes'.
           call 'get-random-biome' using current-biome.
           exit.

       travel.
           call 'get-random-biome' using current-biome.
           move 'traveling...' to output-string.
           call 'output' using output-string.
           move 'ENTER-BIOME' to state.

       explore. 
           string 
               'Exploring the '
               function trim(current-biome) 
               ' biome around you......' 
               into output-string.
           call 'output' using output-string.

           perform showDodudd.
           perform attackRunChoice.

       manageCollection.
           string
               'What would you like to do?' new-line
               '[1] Show Collection' new-line
               '[2] Show Consumables' new-line
               '[3] Feed Collectie' new-line
               '[4] Rename Collectie' new-line
               '[5] Set Protector' new-line
               '[6] Exit' new-line
               '?: '
               into output-string.

               call 'output-inline' using output-string.
               call 'input' using input-string.

               evaluate input-string
                   when '1'
                       move 'SHOW-COLLECTION' to state
                   when '2'
                       move 'SHOW-CONSUMABLES' to state
                   when '3'
                       move 'FEED-COLLECTIE' to state
                   when '4'
                       move 'RENAME-COLLECTIE' to state
                   when '5'
                       move 'SET-PROTECTOR' to state
                   when '6'
                       move 'ENTER-BIOME' to state
                   when other
                       move 'unrecognized choice' to output-string
                       call 'output' using output-string
               end-evaluate.

       
       showCollection.
           call 'get-collection' using output-string
           call 'output' using output-string.
           move 'ENTER-BIOME' to state.
           exit.

       showConsumables.
           call 'get-consumables' using output-string.
           call 'output' using output-string.
           move 'ENTER-BIOME' to state.
           exit.

       feedCollectie.
           move 'feedCollectie coming soon' to output-string.
           call 'output' using output-string.
           move 'ENTER-BIOME' to state.
           exit.

       setProtector.
           move 'setProtector coming soon' to output-string.
           call 'output' using output-string.
           move 'ENTER-BIOME' to state.
           exit.
           
       welcome.
           string '*------------------------------------------*'
               new-line
               '| Welcome to the wild world of Collecties! |'
               new-line
               '*------------------------------------------*'
               into output-string.

           call 'output' using output-string.
           move 'GIVE-INITIAL-COLLECTIE' to state.

       giveInitialCollectie.
           call 'add-starter'.
           call 'get-protector-species' using input-string.
           string 
               'To start your collection you were given a '
               function trim(input-string)
               '!'
               into output-string.
           call 'output' using output-string.
           move 'PROMPT-TO-RENAME-COLLECTIE' to state.

       promptToRenameCollectie.
           call 'get-protector-species' using input-string.
           string 'Would you like to rename your new '
               function trim(input-string)
               '?'
               new-line
               '[y/n]?: ' 
               into output-string.
           
           call 'output-inline' using output-string.
           call 'input' using input-string.

           if input-string = 'y'
               move 'RENAME-COLLECTIE' to state
           else
               move 'ENTER-BIOME' to state
           end-if.


       renameCollectie.
           call 'rename-collectie' using output-string.    
           call 'output-inline' using output-string.
           call 'input' using input-string.

           string 'You have chosen the name: ' input-string new-line
               into output-string
           call 'output' using output-string.

           call 'set-pending-name' using input-string.

           string 
               'Confirm rename?' new-line 
               '[y/n]?: '
               into output-string.
           call 'output-inline' using output-string.

           call 'input' using input-string.

           if input-string = 'y' 
               call 'confirm-rename'
               move 'ENTER-BIOME' to state
           else 
               move 'RENAME-COLLECTIE' to state        
           end-if.

           exit.
               
            

       enterBiome.
           string 'You find yourself in a '
               function  trim(current-biome) 
               ' biome.'
               new-line
               'What would you like to do?'
               new-line
               '[1] Travel to the next Biome'
               new-line
               '[2] Explore'
               new-line
               '[3] Manage Collection'
               new-line
               '[4] Exit'
               new-line
               '?: '
               into output-string.
           call 'output-inline' using output-string.

           call 'input' using input-string.

           evaluate input-string
               when '1'
                   move 'TRAVEL' to state
               when '2'
                   move 'EXPLORE' to state
               when '3'
                   move 'MANAGE-COLLECTION' to state
               when '4'
                   move 'QUIT' to state
               when other
                   string 'unrecognized choice ' input-string 
                       into output-string
                   call 'output' using output-string
           end-evaluate.
           

       showDodudd.
           string 
               '\|/      (__)' new-line   
               '` \------(oo)' new-line
               '   ||    (__)' new-line
               '   ||w--||     \|/' new-line
               '\|/'
           into output-string.
           call 'output' using output-string.

       attackRunChoice.
           string
               'What would you like to do?' new-line
               '[1] Attack' new-line
               '[2] Run' new-line
               '?: '
               into output-string.
               call 'output-inline' using output-string.
               call 'input' using input-string
               if input-string = '1'
                   move 'ATTACK' to state
               else if input-string = '2'
                   move 'RUN-FROM-ENCOUNTER' to state
               else
                   move "No bueno" to output-string
                   call 'output' using output-string
                   move 'QUIT' to state
               end-if

           exit.

       attack.
           move SPACES to input-string.
           move 'wild Dodud' to input-string.
           call 'attack' using input-string, output-string.
           call 'output' using output-string.
           move 'ENTER-BIOME' to state.

       runFromEncounter.
           move "You cheese it the heckin' out of there."
               to output-string.
           call 'output' using output-string.
           move 'ENTER-BIOME' to state.

       quit.
           move 'Thank you for playing!' to output-string.
           call 'output' using output-string.
           move 'DONE' to state.
      *     call 'showTranscript'.

       unrecognizedState.
           string 'unrecognized state ' state '!!!' 
                       into output-string.
           call 'output' using output-string.
           move 'QUIT' to state. 
