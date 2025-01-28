       IDENTIFICATION DIVISION.
       PROGRAM-ID. Dodud.
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
           move 0 to output-int.
           goback.

       entry 'defend'using collectie-a, Bool-Flag.
           set Is-False to True.
           goback.

       
       entry 'clone' using collectie-a, collectie-b.
         goback.

       create.
           call 'get-random-percent' using random-int.

           string 
             'Dodud '
             random-int
             into collectie-name of collectie-a.
           string
             '\|/          (__)' new-line
             '     `\------(oo)' new-line
             '       ||    (__)' new-line
             '       ||w--||     \|/' new-line
             '   \|/'
             into graphic of collectie-a. 


           move 'PLAINS' to preferred-biome of collectie-a.
           move 'Dodud' to species of collectie-a.
           move 'doooooo-up' to sound of collectie-a.
           move 'SPECIAL' to collectie-type of collectie-a.


           