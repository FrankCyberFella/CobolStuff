       identification division.
       program-id. Consumable-Manager-Tests.
       environment division.
       data division.
       working-storage section.

       01  Test-Result             Pic x(5).
           88  Test-Passed      value 'True'.
           88  Test-Failed      value 'False'.

       01  show-values-switch         pic x(5).
           88  Show-Values      value 'Yes'.
           88  Not-Show-Values  value 'No'.    


       01  String-Expected-Value pic x(1024)    value 'Frank'.
       01  String-Actual-Value   pic x(1024)    value 'Frank'.
       01  String-length         pic s9(9) comp.
       01  Test-Description PIC X(100).
       01  Entry-Name PIC X(100).
       01  input-string PIC X(1024).
       01  output-string PIC X(1024).
       01  random-int PIC s99.
       
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
           call 'CLEAR-CONSUMABLES'.
           exit.
           


       callTest.
           move length of String-Expected-Value to String-length.
           
           call 'AssertEquals-String' using String-Expected-Value
                                            String-Actual-Value
                                            String-length
                                            Test-Result
                                            show-values-switch,

           display '   AssertEquals result: ' Test-Result.
           exit.


      ***************************************************************** 
       TEST-START.

       TEST-GET-RANDOM-CONSUMABLE-PIZZA.
           move 'GET-RANDOM-CONSUMABLE-PIZZA' to Test-Description.
           perform beforeEach.
           call 'INIT-CONSUMABLES'.
           set random-int to 1.
           call 'set-random-int' using random-int.
           MOVE 'Small Pizza with Dodud Sausage (4)' 
               TO String-Expected-Value.
           call 'GET-RANDOM-CONSUMABLE' using String-Actual-Value.
           perform callTest.
           exit.

       TEST-GET-RANDOM-CONSUMABLE-ENERGY-DRINK.
           perform beforeEach.
           move 'GET-RANDOM-CONSUMABLE-ENERGY-DRINK' to Test-Description.
           call 'INIT-CONSUMABLES'.
           set random-int to 2.
           call 'set-random-int' using random-int.
           MOVE 'Rextore Claws Energy Drink' 
               TO String-Expected-Value.
           call 'GET-RANDOM-CONSUMABLE' using String-Actual-Value.
           perform callTest.
           exit.

       TEST-GET-CONSUMABLES-NONE.
           MOVE 'GET-CONSUMABLES-NONE' to Test-Description.
              perform beforeEach.
                call 'INIT-CONSUMABLES'.
                call 'GET-CONSUMABLES' using String-Actual-Value.
                MOVE SPACES to String-Expected-Value.
                perform callTest.
                exit.

       TEST-GET-CONSUMABLES-ONE.
           MOVE 'GET-CONSUMABLES-ONE' to Test-Description.
               perform beforeEach.
               call 'INIT-CONSUMABLES'.
               call 'GET-CONSUMABLES' using String-Actual-Value.
               set random-int to 1.
               call 'set-random-int' using random-int.
               call 'GET-RANDOM-CONSUMABLE' using input-string.
               call 'GET-CONSUMABLES' using String-Actual-Value.
               STRING 
                   '[1] Small Pizza with Dodud Sausage (4)' 
                     X'0A'
                   INTO String-Expected-Value.
               perform callTest.

       TEST-GET-CONSUMABLES-TWO.
           MOVE 'GET-CONSUMABLES-TWO' to Test-Description.
           perform beforeEach.
           call 'INIT-CONSUMABLES'.
           call 'GET-CONSUMABLES' using String-Actual-Value.
           set random-int to 1.
           call 'set-random-int' using random-int.
           call 'GET-RANDOM-CONSUMABLE' using input-string.
           set random-int to 2.
           call 'set-random-int' using random-int.
           call 'GET-RANDOM-CONSUMABLE' using input-string.
           call 'GET-CONSUMABLES' using String-Actual-Value.
           STRING 
               '[1] Small Pizza with Dodud Sausage (4)' 
               X'0A'
               '[2] Rextore Claws Energy Drink (1)'
               X'0A' 
               INTO String-Expected-Value.
           perform callTest.


       TEST-GET-RANDOM-CONSUMABLE-PIZZA.
           MOVE 'TEST-GET-RANDOM-CONSUMABLE-PIZZA' to Test-Description.
           PERFORM beforeEach.
           call 'INIT-CONSUMABLES'.
           set random-int to 1.
           call 'set-random-int' using random-int.
           call 'GET-RANDOM-CONSUMABLE' using String-Actual-Value.
           STRING 'Small Pizza with Dodud Sausage (4)' 
                INTO String-Expected-Value.
           PERFORM callTest.

       TEST-GET-RANDOM-CONSUMABLE-ENERGY-DRINK.
           MOVE 'TEST-GET-RANDOM-CONSUMABLE-ENERGY-DRINK' 
               TO Test-Description.
           PERFORM beforeEach.
           CALL 'INIT-CONSUMABLES'.
           SET random-int TO 2.
           CALL 'set-random-int' USING random-int.
           CALL 'GET-RANDOM-CONSUMABLE' USING String-Actual-Value.
           STRING 'Rextore Claws Energy Drink' 
                INTO String-Expected-Value.
           PERFORM callTest.


       TEST-END.
      ***************************************************************** 
       0000-Initialize-Test-Fields.   

           Move 'concatenate' to Entry-Name
           Move 'Frank' to String-Actual-Value.
           Move 'Frank' to String-Expected-Value.



       0000-Initialize-Test-Fields-Exit.
           Exit. 
