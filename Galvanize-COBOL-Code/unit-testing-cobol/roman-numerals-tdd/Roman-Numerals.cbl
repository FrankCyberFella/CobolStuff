       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROMAN-NUMERALS.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMBER PIC 9999.
       01 WS-RESULT PIC X(20). 
       01 thousands PIC A(4).
       01 hundreds PIC A(4).
       01 tens PIC A(4).
       01 ones PIC A(4).
       01 digit PIC 9.
       01 lowChar PIC A.
       01 midChar PIC A.
       01 highChar PIC A.
       01 chars PIC A(4).
       01 place PIC 9.

       linkage section.
       01  input-number PIC 9999.
       01  output-string PIC X(20).
      
       PROCEDURE DIVISION.

       entry 'to-roman' using input-number output-string.
           move input-number to WS-NUMBER.
           perform ROMAN-NUMERALS.
           move WS-RESULT to output-string
           goback.


       ROMAN-NUMERALS.
         move SPACES to WS-RESULT
         perform handleThousands
         perform handleHundreds
         perform handleTens
         perform handleOnes
      
         STRING FUNCTION TRIM(thousands) DELIMITED BY SIZE 
               FUNCTION TRIM(hundreds) DELIMITED BY SIZE 
               FUNCTION TRIM(tens) DELIMITED BY SIZE
               FUNCTION TRIM(ones) DELIMITED BY SIZE 
               INTO WS-RESULT(1:20)
         exit.
       handleThousands.
         move spaces to thousands
         move 1 to place
         move 'M' to lowChar
         move ' ' to midChar
         move ' ' to highChar
         move spaces to chars
         perform convert
         move chars to thousands
         exit.
       handleHundreds.
         move spaces to hundreds
         move 2 to place
         move 'C' to lowChar
         move 'D' to midChar
         move 'M' to highChar
         move spaces to chars
         perform convert
         move chars to hundreds
         exit.
       handleTens.
         move spaces to tens
         move 3 to place
         move 'X' to lowChar
         move 'L' to midChar
         move 'C' to highChar
         move spaces to chars
         perform convert
         move chars to tens
         exit.
       handleOnes.
         move spaces to ones
         move 4 to place
         move 'I' to lowChar
         move 'V' to midChar
         move 'X' to highChar
         move spaces to chars
         perform convert
         move chars to ones
         exit.
       convert.
         move WS-NUMBER(place:1) to digit
         
         evaluate digit
            when 1
               move lowChar to chars
            when 2 
               STRING 
                  lowChar delimited by size 
                  lowChar delimited by size
                  into chars
            when 3
               STRING 
                  lowChar delimited by size 
                  lowChar delimited by size
                  lowChar delimited by size
                  into chars
            when 4
               STRING 
                  lowChar delimited by size 
                  midChar delimited by size
                  into chars
            when 5
               move midChar to chars
            when 6 
               STRING 
                  midChar delimited by size 
                  lowChar delimited by size
                  into chars
            when 7 
               STRING 
                  midChar delimited by size 
                  lowChar delimited by size
                  lowChar delimited by size
                  into chars
            when 8
               STRING 
                  midChar delimited by size 
                  lowChar delimited by size
                  lowChar delimited by size
                  lowChar delimited by size
                  into chars
            when 9
               STRING 
                  lowChar delimited by size 
                  highChar delimited by size
                  into chars
         end-evaluate
         exit.
            
      
       EXIT-ROMAN-NUMERALS.
