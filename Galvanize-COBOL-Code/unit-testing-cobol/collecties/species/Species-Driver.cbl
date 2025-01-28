       IDENTIFICATION DIVISION.
       PROGRAM-ID. Species-Driver.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
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
       call 'create' using collectie-a.
       
           

                 