       IDENTIFICATION DIVISION.
       PROGRAM-ID. Light-Saber.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * TODO: use copybook to handle DRY 
      * COPY SABER.cpy.

       01 saber-table.
           05 saber occurs 10 times.
               10  efficiency comp-1 VALUE 10.
               10  charge comp-1 VALUE 100.
               10  saber-color PIC X(64) VALUE 'green'.
               10  serial-number PIC X(64).
               10  registered-jedi PIC X(64).

       01  idx PIC 99 value 0.
       01  random-int PIC 999.
         
       linkage section.
       01  input-float comp-1 value 100. 
       01  output-float comp-1 value 100.
       01  output-string PIC X(64) value SPACES.
       01  input-string PIC X(64) value SPACES.
       01  linked-saber. 
               05  efficiency-linked comp-1.
               05  charge-linked comp-1.
               05  saber-color-linked PIC X(64).
               05  serial-number-linked PIC X(64).
               05  registered-jedi-linked PIC X(64).
      
       PROCEDURE DIVISION.

       entry 'get-saber' using linked-saber.
           if idx > 0 then
               move saber(idx) to linked-saber
           end-if.
           goback.

       entry 'new-saber' using input-string.
           add 1 to idx.
           move input-string to registered-jedi(idx).
           call 'get-random-int' using random-int.
           string 
               'sn-'
               random-int
               into serial-number(idx).
           goback.
           
       entry 'use' using linked-saber, input-float.
           compute charge-linked of linked-saber = 
                   charge-linked of linked-saber -
                   input-float / 60 * 
                   efficiency-linked of linked-saber.
           goback.

       entry 'getMinutesRemaining' using linked-saber, output-float.
           
           compute output-float = charge-linked of linked-saber 
               / efficiency-linked of linked-saber * 60.
           goback.

       entry 'recharge' using linked-saber.
           move 100 to charge-linked of linked-saber.
           goback.

       entry 'setCharge' using linked-saber, input-float.
           move input-float to charge-linked of linked-saber.
           goback.

       entry 'getCharge' using linked-saber, output-float.
           move charge-linked of linked-saber to output-float.
           goback.

       entry 'getColor' using linked-saber, output-string.
           move saber-color-linked of linked-saber to output-string.
           goback.

       entry 'setColor' using linked-saber, input-string.
           move input-string to saber-color-linked of linked-saber.
           goback.

       entry 'getSerialNumber' using linked-saber, output-string.
           move serial-number-linked of linked-saber to output-string.
           goback.
