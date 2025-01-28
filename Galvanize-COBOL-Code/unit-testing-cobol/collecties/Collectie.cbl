       IDENTIFICATION DIVISION.
       PROGRAM-ID. Collectie.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  collecties.
           05 collectie occurs 10 times.
               10  collectie-name PIC X(64).
               10  species PIC X(64).
               10  collectie-type PIC X(64).
               10  sound PIC X(64).
               10  preferred-biome PIC X(64).
               10  graphic PIC X(1024).
       01  table-idx PIC 99 value 1.
       01  protector-idx PIC s99 comp value 1.
       01  loop-idx PIC 99 value 1.
       01  concat-string PIC X(128) value SPACES.
       01  pending-rename PIC X(64) value SPACES.
       01  new-line PIC X value X'0A'.
       
       REPLACE ==collectie== BY ==collectie-a==.
       copy "species/Collectie.cpy".
      


       LINKAGE SECTION.
       01  input-string PIC X(1024) value SPACES.
       01  output-string PIC X(1024) value SPACES.

       PROCEDURE DIVISION.

      *    TODO: copybook helps here with DRY
      
           entry 'add-starter'.
               
               move 'Rextore' to species of collectie(table-idx).
               string
                   function trim(species(table-idx))
                   ' '
                   '1234' *> TODO: randomize
                   table-idx
                   into collectie-name of collectie(table-idx). 

               add 1 to table-idx.        
               goback.

           entry 'speak'.
               goback.

           entry 'get-protector-species' using output-string.
               move collectie(protector-idx) to output-string.
               goback.
           

           entry 'attack' using input-string, output-string.
               string
                   function trim(collectie-name(protector-idx)) 
                   ' attacks the '
                   function trim(input-string) 
                   new-line
                   '...' 
                   new-line new-line
                   'The '
                  function trim(input-string)
                   ' manages to survive the blow!' 
                   new-line
                   'It counter-attacks!' 
                   new-line 
                   new-line
                   function trim(collectie-name(protector-idx))
                   ' has fallen!'
                   into output-string.

               goback.

           entry 'defend'.
               goback.

           entry 'get-collection' using output-string.
               move SPACES to output-string.
               string 
                   'Collectie Collection'
                   X'0A'
                   into concat-string.

               call 'concatenate' using concat-string output-string

               perform varying loop-idx from 1 by 1 
                   until loop-idx = table-idx

                   move SPACE to concat-string
                   string
                       '[' 
                      loop-idx
                       '] '
                       function trim(collectie-name(loop-idx))
                       ' (' 
                       function trim(species(loop-idx))
                       ')'
                       X'0A'
                       into concat-string
                   
                   call 'concatenate' using concat-string output-string
               end-perform.

               goback.

           entry 'rename-collectie' using output-string.
               string 
                   'Renaming '
                   function trim(species(protector-idx)) 
                   ' named '
                   function trim(collectie-name(protector-idx))
                   '...' 
                   X'0A'
                   '?: '
               into output-string.
               goback.

           entry 'set-pending-name' using input-string.
               move SPACES to pending-rename.
               move input-string to pending-rename.
               goback.

           entry 'confirm-rename'.
               move pending-rename to 
                   collectie-name(protector-idx).
               goback.

           entry 'set-protector'.
               goback.

           

           
               


      

               
               

           
