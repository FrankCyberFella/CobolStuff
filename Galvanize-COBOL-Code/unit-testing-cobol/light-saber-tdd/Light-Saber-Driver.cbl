       IDENTIFICATION DIVISION.
       PROGRAM-ID. Light-Saber-Driver.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY SABER.cpy. *> defines SABER data structure
       01  input-string PIC X(64) value SPACES.
       01  output-string PIC X(1024) value SPACES.
      
       PROCEDURE DIVISION.

       move 'Mace Windu' to input-string.
       call 'new-saber' using input-string.
       call 'get-saber' using saber.
       
       string 
              'The jedi '
              function trim(registered-jedi of saber)
              ' wields a '
              function trim(saber-color of saber)
              ' saber with serial number '
              function trim(serial-number of saber)
              into output-string.

       display function trim(output-string).

       stop run.
