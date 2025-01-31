       IDENTIFICATION DIVISION.
       PROGRAM-ID. IO.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  idx PIC 999 VALUE 1.
       01  transcript PIC X(100000) VALUE SPACES.
       01  toAdd PIC X(1000) VALUE SPACES.
       01  REPLACE-WITH-SPACE PIC X VALUE '~'.
       
       LINKAGE SECTION.
       01  input-string PIC X(1000).
       01  output-string PIC X(1000).
      
       
       PROCEDURE DIVISION.

       entry 'input' using input-string.
           accept input-string.

           string 
               function trim(input-string) 
               X'0A'
               into toAdd.
           perform addToTranscript.
           goback.

       entry 'output' using output-string.
           display function trim(output-string).

           string 
               function trim(output-string)
               X'0A'
               into toAdd.  

           perform addToTranscript.  

           move SPACES to output-string.

           goback.

       entry 'output-inline' using output-string.
           display function trim(output-string) ' ' with no advancing.
           
           string 
               function trim(output-string) 
               REPLACE-WITH-SPACE
               into toAdd.        

           perform addToTranscript.
           move SPACES to output-string.
           goback.

       entry 'showTranscript'.
           display '------------- TRANSCRIPT START ----------'
           display function trim(transcript) with no advancing.
           display '------------- TRANSCRIPT END ----------'
           goback.

       addToTranscript.
           move function trim(toAdd) to transcript(idx:length of toAdd)
           add length of function trim(toAdd) to idx.
           inspect transcript replacing ALL REPLACE-WITH-SPACE BY ' '.
           move SPACES to toAdd.
           


       end program IO.
       
