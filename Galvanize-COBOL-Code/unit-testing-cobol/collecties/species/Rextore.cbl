       IDENTIFICATION DIVISION.
       PROGRAM-ID. Rextore.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY './utils/String-Utils.cpy'.  
       01  random-int PIC 999.
       
       LINKAGE SECTION.
       REPLACE ==collectie== BY ==collectie-a==.
       COPY 'species/Collectie.cpy'.
       REPLACE ==collectie== BY ==collectie-b==.
       COPY "species/Collectie.cpy".
       01  output-string PIC X(1024).
       01  output-int comp-1.
       01  input-int comp-1.

       01 Bool-Flag PIC X VALUE "F".
           88 Is-True VALUE "T".
           88 Is-False VALUE "F".

       PROCEDURE DIVISION.
       
       entry 'create' using collectie-a.
           perform create.
           goback.

       entry 'speak' using collectie-a, output-string.
           string 
             function trim(function upper-case(sound of collectie-a)) 
             '!'
             into output-string.
           goback.

       entry 'performAttack' using collectie-a, output-int.
           move 10 to output-int.
           goback.

       entry 'defend'using collectie-a, Bool-Flag.
      *    should fail 50* of time. 
           call 'get-random-percent' using random-int.
           if random-int >= 50 then
             set Is-True to True
           else 
             set Is-False to True
           end-if
           goback.
       
       entry 'clone' using collectie-a, collectie-b.
         goback.

       create.
           
           call 'get-random-percent' using random-int.
           move 'rextore' to species of collectie-a.

           string 
             'Rextore '
             random-int
             into collectie-name of collectie-a.

           
           move 'rarwar' to sound of collectie-a.
           move 'DINOSAUR' to collectie-type of collectie-a.
           move 'VOLCANIC' to preferred-biome of collectie-a.

           string
       "        ," new-line 
       "       /|" new-line 
       "      / |" new-line 
       "     /  /" new-line 
       "    |   |" new-line 
       "   /    |" new-line 
       "   |    \\_" new-line 
       "   |      \\__" new-line 
       "   \\       __\\_______" new-line 
       "    \\                 \\_" new-line 
       "    | /                 \\" new-line 
       "    \\/                   \\" new-line 
       "     |                    |" new-line 
       "     \\                   \\|" new-line 
       "     |                    \\" new-line 
       "     \\                     |" new-line 
       "     /\\    \\_               \\" new-line 
       "    / |      \\__ (   )       \\" new-line 
       "   /  \\      / |\\\\  /       __\\____" new-line 
       "snd|  ,     |  /\\ \\ \\__    |       \\_" new-line 
       "   \\_/|\\___/   \\   \\}}}\\__|  (@)     )" new-line 
       "    \\)\\)\\)      \\_\\---\\   \\|       \\ \\" new-line 
       "                  \\>\\>\\>   \\   /\\__o_o)" new-line 
       "                            | /  VVVVV" new-line 
       "                            \\ \\    \\" new-line 
       "                             \\ \\MMMMM  " new-line 
       "                              \\______/" new-line

             into graphic of collectie-a. 
                 
      