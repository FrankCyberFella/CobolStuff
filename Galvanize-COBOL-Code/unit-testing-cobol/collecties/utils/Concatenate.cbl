       IDENTIFICATION DIVISION.
       PROGRAM-ID. Concatenate.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  concat-idx PIC s99 comp value 1.
       01  concat-length PIC s99 comp.
       01  combined-length PIC s99 comp.

       LINKAGE SECTION.
       01  concat-string PIC X(128) value SPACES.
       01  combined-string PIC X(1024) value SPACES.
       
       PROCEDURE DIVISION.
       entry 'concatenate' using concat-string combined-string.
           move 1 to concat-idx.
           compute concat-length = 
               length of function trim(concat-string).

           compute combined-length = 
               length of function trim(combined-string).

           compute concat-idx = concat-idx + combined-length.
           

           string
               concat-string
               into combined-string(concat-idx:concat-length).

           compute concat-idx = concat-idx + concat-length.
           goback.
      