       IDENTIFICATION DIVISION.
       PROGRAM-ID. Consumable.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  consumables.
           02 consumable occurs 10 times.
               03 consumable-name PIC X(64) value SPACES.
       
       LINKAGE SECTION.
       01  output-string PIC X(1024) value SPACES.

       PROCEDURE DIVISION.
           entry 'get-consumables' using output-string.
               move 'No consumables available' to output-string.
               goback.
               