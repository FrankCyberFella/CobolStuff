       identification division.
       program-id. Light-Saber-Tests.
       environment division.
       data division.
      
       working-storage section.
       COPY SABER.cpy. *> defines SABER data structure
      
       01  Test-Result             Pic x(5).
           88  Test-Passed      value 'True'.
           88  Test-Failed      value 'False'.

       01  show-values-switch         pic x(5).
           88  Show-Values      value 'Yes'.
           88  Not-Show-Values  value 'No'.    

       01  Float-Expected-4-byte  comp-1   value 10.
       01  Float-Actual-4-byte    comp-1   value 10.
       01  String-Expected-Value pic x(64)    value 'Frank'.
       01  String-Actual-Value   pic x(64)    value 'Frank'.
       01  String-length         pic s9(9) comp.
       01  Test-Description PIC X(100).
       01  input-float comp-1 value 10.
       01  input-string pic x(64) value spaces.
       01  input-int PIC 999.
       01  output-int PIC 999.
       
      *****************************************************************
       
       procedure division.

       main. 
           perform beforeAll.
           perform TEST-START THRU TEST-END.
           STOP RUN.


      *****************************************************************
      *    FIXTURES
      *****************************************************************
      
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
           exit.
           


       callTestNumeric.
           call 'AssertEquals-Numeric' using Float-Expected-4-byte
                                            Float-Actual-4-byte
                                            Test-Result
                                            show-values-switch,
           
           perform afterEach.
           exit.

       callTestString.
           move length of String-Expected-Value to String-length.
           
           call 'AssertEquals-String' using String-Expected-Value
                                            String-Actual-Value
                                            String-length
                                            Test-Result
                                            show-values-switch,

           perform afterEach.

                           

       afterEach.
           display '   AssertEquals result: ' Test-Result.
           exit.
      
       createSaber.
           move 'Mace Windu' to input-string.
           call 'new-saber' using input-string.
           call 'get-saber' using saber.
      

       0000-Initialize-Test-Fields.   
           Move ZERO to Float-Actual-4-byte.
           Move ZERO to Float-Expected-4-byte.
           Move 'Frank' to  String-Expected-Value.
           Move 'Frank' to  String-Actual-Value.

       0000-Initialize-Test-Fields-Exit.
           Exit.

      *****************************************************************
      *    TESTS
      *****************************************************************
      
       TEST-START.

       TEST-GET-SABER.
      *    Given we have not created a saber
      *    When get-saber is called
      *    Then we get an unitialized saber values
           move 'TEST-GET-SABER' to Test-Description.
           perform beforeEach.

           call 'get-saber' using saber.

      *    saber color 
           move SPACES to String-Expected-Value.
           move saber-color in saber to String-Actual-Value.
           perform callTestString.

      *    serial number
           move SPACES to String-Expected-Value.
           move serial-number in saber to String-Actual-Value.
           perform callTestString.

      *    registered jedi
           move SPACES to String-Expected-Value.
           move registered-jedi in saber to String-Actual-Value.
           perform callTestString.
 
      *    charge
           move low-values to Float-Expected-4-byte.
           move charge in saber to Float-Actual-4-byte.
           perform callTestNumeric. 

      *    efficiency
           move low-values to Float-Expected-4-byte.
           move efficiency in saber to Float-Actual-4-byte.
           perform callTestNumeric.   
           exit.


       TEST-CREATE-SABER.
           move 'TEST-CREATE-SABER' to Test-Description.
           perform beforeEach.
           move 'saber-123' to input-string.
           call 'new-saber' using input-string.
           call 'get-saber' using saber.
           move 'green' to String-Expected-Value.
           move saber-color in saber to String-Actual-Value.
           perform callTestString.
           exit.

       TEST-INITIAL-MINUTES-REMAINING.
           move 'should have 600 minutes remaining initially'
               to Test-Description
           perform beforeEach.
           perform createSaber.
           move 600 to Float-Expected-4-byte.
           call 'getMinutesRemaining' using saber, Float-Actual-4-byte.
           perform callTestNumeric.
           exit.

       TEST-USE-60-MINUTES.
           move 'Use 60 minutes should have 540 minutes remaining' 
               to Test-Description.
           perform beforeEach.
           perform createSaber.
           move 540 to Float-Expected-4-byte.
           move 60 to input-float.
           call 'use' using saber, input-float.
           call 'getMinutesRemaining' using saber, Float-Actual-4-byte.
           perform callTestNumeric.
           exit.

       TEST-RECHARGE.
           move 'Reharging should reset to 600 minutes remaining' 
               to Test-Description.
           perform beforeEach.
           perform createSaber.
           move 600 to Float-Expected-4-byte.
           move 60 to input-float.
           call 'use' using saber, input-float.
           call 'recharge' using saber.
           call 'getMinutesRemaining' using saber, Float-Actual-4-byte.
           perform callTestNumeric.
           exit.

       TEST-GET-INITIAL-CHARGE.
           move 'Initial charge should be 100'
               to Test-Description.
           perform beforeEach.
           perform createSaber.
           move 100 to Float-Expected-4-byte.
           call 'getCharge' using saber, Float-Actual-4-byte.
           perform callTestNumeric.
           exit.

       TEST-GET-LATER-CHARGE.
           move 'Later charge should be 90' 
               to Test-Description.
           perform beforeEach.
           perform createSaber.
           move 90 to Float-Expected-4-byte.
           move 90 to input-float.
           call 'setCharge' using saber, input-float.
           call 'getCharge' using saber, Float-Actual-4-byte.
           perform callTestNumeric.
           exit.

       TEST-GET-DEFAULT-COLOR.
           move 'Default color should be green'
               to Test-Description.
           perform beforeEach.
           perform createSaber.
           move 'green' to String-Expected-Value.
           call 'getColor' using saber, String-Actual-Value.
           perform callTestString.
           exit.

       TEST-SET-COLOR.
           move 'Should set color to red'
               to Test-Description.
           perform beforeEach.
           perform createSaber.
           move 'red' to String-Expected-Value.
           move 'red' to input-string.
           call 'setColor' using saber, input-string.
           call 'getColor' using saber, String-Actual-Value.
           perform callTestString.
           exit.
    
       TEST-GET-SERIAL-NUMBER.
           move 'Should get serial number'
               to Test-Description.
           perform beforeEach.
           move 123 to input-int.
           call 'set-random-int' using input-int.
           move 'sn-123' to String-Expected-Value.
           move 'unknown jedi' to input-string.
           call 'new-saber' using input-string.
           call 'get-saber' using saber.
           call 'getSerialNumber' using saber, String-Actual-Value.
           perform callTestString.
           exit.

       TEST-END.
