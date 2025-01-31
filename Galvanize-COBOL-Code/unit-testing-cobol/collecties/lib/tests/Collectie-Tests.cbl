       identification division.
       program-id. Collectie-Tests.
       environment division.
       data division.
       working-storage section.

       01  Test-Result             Pic x(5).
           88  Test-Passed      value 'True'.
           88  Test-Failed      value 'False'.

       01  show-values-switch         pic x(5).
           88  Show-Values      value 'Yes'.
           88  Not-Show-Values  value 'No'.    


       01  Float-Expected-4-byte  comp-1   value 10.
       01  Float-Actual-4-byte    comp-1   value 10.
       01  String-Expected-Value pic x(1024)    value 'Frank'.
       01  String-Actual-Value   pic x(1024)    value 'Frank'.
       01  String-length         pic s9(9) comp.
       01  Test-Description PIC X(100).
       01  Entry-Name PIC X(100).
       01  input-string PIC X(1024).
       01  output-string PIC X(1024).
       
      *****************************************************************
       procedure division.

       MAIN-PROCEDURE.
           
           perform beforeAll.
           perform TEST-START THRU TEST-END.

           STOP RUN.


       beforeAll.
           perform 0000-Initialize-Test-Fields
              thru 0000-Initialize-Test-Fields-Exit.
           display '---- Starting call tests       ----'.
           exit.

       beforeEach.
           display ' '.
           display '-- Testing ' Test-Description
           perform 0000-Initialize-Test-Fields. 
           set Not-Show-Values to true.
           move SPACES to input-string.
           move SPACES to output-string.
           exit.
           


       afterEach.
           move length of String-Expected-Value to String-length.
           
           call 'AssertEquals-String' using String-Expected-Value
                                            String-Actual-Value
                                            String-length
                                            Test-Result
                                            show-values-switch,

           display '   AssertEquals result: ' Test-Result.
           exit.

       callTest.
           move output-string to String-Actual-Value.
           perform afterEach.
           exit.

       callTestNumeric.
           call 'AssertEquals-Numeric' using Float-Expected-4-byte
                                            Float-Actual-4-byte
                                            Test-Result
                                            show-values-switch,
           
           perform afterEach.
           exit.



      ***************************************************************** 
       TEST-START.

      *****************************************************************
       TEST-ATTACK.
           move 'Jojo attacks Dodud' to Test-Description.
           perform beforeEach.
           move 'Jojo' to output-string.
           call 'set-pending-name' using output-string.
           call 'confirm-rename'.
           move 'Wild Dodud' to input-string.
           call 'attack' using input-string, String-Actual-Value.
           string 
               'Jojo attacks the Wild Dodud'
               X'0A'
               '...'
               X'0A'
               'The Wild Dodud manages to survive the blow!'
               X'0A'
               'It counter-attacks!'
               X'0A'
               X'0A'
               'Jojo has fallen!' 
           into String-Expected-Value.
           perform afterEach.
           exit.
      *****************************************************************
       
      ***************************************************************** 
       TEST-END.

      *****************************************************************
       
       0000-Initialize-Test-Fields.   

           Move 'concatenate' to Entry-Name
           Move 'Frank' to String-Actual-Value.
           Move 'Frank' to String-Expected-Value.



       0000-Initialize-Test-Fields-Exit.
           Exit.     
    