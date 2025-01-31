       IDENTIFICATION DIVISION.
       PROGRAM-ID. Randomizer.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  Random-Number         USAGE FLOAT VALUE 0.
       01  Scaled-Random-Number  PIC 999.
       
       LINKAGE SECTION.
       01  output-int pic 999.
       01  ceil PIC 999 VALUE 99.
       
       PROCEDURE DIVISION.
            
       entry 'get-random-int' using output-int, ceil.
            display 'get-random-int ceil ' ceil.
           *>COMPUTE Random-Number = FUNCTION RANDOM
    
      *>    Scale it to an integer range 1 to ceil
           *>COMPUTE Scaled-Random-Number = (Random-Number * ceil) + 1 
           *>move Scaled-Random-Number to output-int.
           goback.
           
       entry 'get-random-percent' using output-int.
            
      *>    Get a random floating-point number between 0 and 1
           COMPUTE Random-Number = FUNCTION RANDOM
    
      *>    Scale it to an integer range 1 to 100
           COMPUTE Scaled-Random-Number = (Random-Number * 100) + 1 
           move Scaled-Random-Number to output-int.
           goback.
           
       end program Randomizer.
       