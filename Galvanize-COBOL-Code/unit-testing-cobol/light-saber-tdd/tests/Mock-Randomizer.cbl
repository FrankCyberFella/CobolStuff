      * Mock Randomizer to enable Unit Testing
       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Mock-Randomizer.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  random-int PIC 999.
       
       LINKAGE SECTION.
       01  output-int PIC 999.
       01  input-int PIC 999.
       
       PROCEDURE DIVISION.

       entry 'set-random-int' using input-int.
           move input-int to random-int.
           goback.
            
       entry 'get-random-int' using output-int.
           move random-int to output-int.
           goback.
           