       identification division.
       program-id. Dodud-Tests.
       environment division.
       data division.
       working-storage section.
       

       01  Test-Result             Pic x(5).
           88  Test-Passed      value 'True'.
           88  Test-Failed      value 'False'.

       01  show-values-switch         pic x(5).
           88  Show-Values      value 'Yes'.
           88  Not-Show-Values  value 'No'. 

       01  Expected-Bool-Flag PIC X VALUE "F".
               88 Is-True VALUE "T".
               88 Is-False VALUE "F". 

       01  Actual-Bool-Flag PIC X VALUE "F".
               88 Is-True VALUE "T".
               88 Is-False VALUE "F".  

       01  Float-Expected-4-byte  comp-1   value 10.
       01  Float-Actual-4-byte    comp-1   value 10.
       01  String-Expected-Value pic x(1024)    value 'Frank'.
       01  String-Actual-Value   pic x(1024)    value 'Frank'.
       01  String-length         pic s9(9) comp.
       01  Test-Description PIC X(100).
       01  Entry-Name PIC X(100).
       01  input-string PIC X(1024).
       01  output-string PIC X(1024).
       01  mock-random-int PIC 999.
       01  output-int comp-1.
       01  Table-Address USAGE POINTER.
       
       REPLACE ==collectie== BY ==collectie-a==.
       copy "species/Collectie.cpy".
       REPLACE ==collectie== BY ==collectie-b==.
       COPY "species/Collectie.cpy".
       
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
           exit.
           


       afterEach.
           Move ZERO to Float-Actual-4-byte.
           Move ZERO to Float-Expected-4-byte.

           

       callTest.
           move length of String-Expected-Value to String-length.
           
           call 'AssertEquals-String' using String-Expected-Value
                                            String-Actual-Value
                                            String-length
                                            Test-Result
                                            show-values-switch,

           display '   AssertEquals result: ' Test-Result.
           exit.


       callTestNumeric.
           call 'AssertEquals-Numeric' using Float-Expected-4-byte
                                            Float-Actual-4-byte
                                            Test-Result
                                            show-values-switch,

           display '   AssertNumeric result: ' Test-Result.
           
           perform afterEach.
           exit.

      ***************************************************************** 
       TEST-START.

      *****************************************************************
       
       TEST-CREATE-NAME.
           move 'Create a Dodud' to Test-Description.
           perform beforeEach.
           move 123 to mock-random-int.
           call 'set-random-int' using mock-random-int.
           move 'Dodud 123' to String-Expected-Value.
           call 'create' using collectie-a.
           move collectie-name of collectie-a to String-Actual-Value.
           perform callTest.
           perform afterEach.
           exit.

       TEST-CREATE-PREFERRED-BIOME.
           move 'Check preferred biome at creation' to Test-Description.
           perform beforeEach.
           move 'PLAINS' to String-Expected-Value.
           call 'create' using collectie-a.
           move preferred-biome of collectie-a to String-Actual-Value.
           perform callTest.
           perform afterEach.
           exit.

       TEST-CREATE-SPECIES.
           move 'Check species at creation' to Test-Description.
           Move 'create' to Entry-Name.
           perform beforeEach.
           move 'Dodud' to String-Expected-Value.
           call 'create' using collectie-a.
           move species of collectie-a to String-Actual-Value.
           perform callTest.
           perform afterEach.
           exit.

       TEST-CREATE-TYPE.
           move 'Check type at creation' to Test-Description.
           perform beforeEach.
           move 'SPECIAL' to String-Expected-Value.
           call 'create' using collectie-a.
           move collectie-type of collectie-a to String-Actual-Value.
           perform callTest.
           perform afterEach.
           exit.

       TEST-CREATE-SOUND.
           move 'Create a Dodud' to Test-Description.
           perform beforeEach.
           call 'create' using collectie-a.
           move 'doooooo-up' to String-Expected-Value.
           move sound of collectie-a to String-Actual-Value.
           perform callTest.
           perform afterEach.
           exit.

       

       TEST-CREATE-MULTIPLE.
           move 'Create 2 Doduds' to Test-Description.
           perform beforeEach.
           
           move 123 to mock-random-int.
           call 'set-random-int' using mock-random-int.
           call 'create' using collectie-a.

           move 456 to mock-random-int.
           call 'set-random-int' using mock-random-int.
           call 'create' using collectie-b.

           move 'Dodud 123 & Dodud 456' to String-Expected-Value.
           string 
               function trim(collectie-name of collectie-a)
               ' & '
               function trim(collectie-name of collectie-b)
               into String-Actual-Value.
               
           perform callTest.
           perform afterEach.
           exit.

       TEST-SPEAK.
           move 'Dodud should speak according to their species' 
               to Test-Description.
           perform beforeEach.
           move 123 to mock-random-int.
           call 'set-random-int' using mock-random-int.
           call 'create' using collectie-a.
           move 'DOOOOOO-UP!' to String-Expected-Value.
           call 'speak' using collectie-a, String-Actual-Value.
           perform callTest.
           perform afterEach. 
           exit.

       TEST-ATTACK.
           move 'Should have 0 attack power' to Test-Description.
           perform beforeEach.
           call 'create' using collectie-a.
           move 0 to Float-Expected-4-byte.
           call 'performAttack' using collectie-a, Float-Actual-4-byte.
           perform callTestNumeric.
           perform afterEach.

       TEST-DEFEND.
           move 'Should always fail to defend' to Test-Description.
           perform beforeEach.
           call 'create' using collectie-a.

           set Is-False of Expected-Bool-Flag to True.
           call 'defend' using collectie-a, Actual-Bool-Flag.
           
           move Actual-Bool-Flag to String-Actual-Value.
           move Expected-Bool-Flag to String-Expected-Value.

           perform callTest.
           perform afterEach.


       TEST-CLONE.
           move 'should clone new instance with same values' 
               to Test-Description.

           perform beforeEach.
           call 'create' using collectie-a.
           call 'create' using collectie-b.
           call 'clone' using collectie-a, collectie-b.

           SET Table-Address TO ADDRESS OF collectie-a.
           DISPLAY "Memory Address of Table: " Table-Address.
           
           SET Table-Address TO ADDRESS OF collectie-b.
           DISPLAY "Memory Address of Table: " Table-Address.

           if ADDRESS OF collectie-a EQUALS ADDRESS OF collectie-b THEN
               display 'whassuyp?'.

           display collectie-name of collectie-a.
           display collectie-name of collectie-b.
           
           perform afterEach.
           
      *****************************************************************
       
      ***************************************************************** 
       TEST-END.

      *****************************************************************
       
       0000-Initialize-Test-Fields.   

           
           Move 'Frank' to String-Actual-Value.
           Move 'Frank' to String-Expected-Value.



       0000-Initialize-Test-Fields-Exit.
           Exit.     
    