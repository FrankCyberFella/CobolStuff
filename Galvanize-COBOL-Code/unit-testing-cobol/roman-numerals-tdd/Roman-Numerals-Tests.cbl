       identification division.
       program-id. JB-Tests.
       environment division.
       data division.
       working-storage section.

       01  Test-Result             Pic x(5).
           88  Test-Passed      value 'True'.
           88  Test-Failed      value 'False'.

       01  show-values-switch         pic x(5).
           88  Show-Values      value 'Yes'.
           88  Not-Show-Values  value 'No'.    


       01  String-Expected-Value pic x(20)    value 'Frank'.
       01  String-Actual-Value   pic x(20)    value 'Frank'.
       01  String-length         pic s9(9) comp.
       01  Test-Description PIC X(100).
       01  Entry-Name PIC X(100).
       01  input-number pic 9999.
       01  output-string pic x(20).
       
      *****************************************************************
       procedure division.

       MAIN-PROCEDURE.
           
           perform beforeAll.
           perform TEST-TO-ROMAN-I THRU TEST-TO-ROMAN-XLIX.

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
           call Entry-Name using input-number output-string.
           move output-string to String-Actual-Value.
           perform afterEach.
           exit.


      *****************************************************************
       TEST-TO-ROMAN-I.
           move '1 is I' to Test-Description.
           perform beforeEach.
           move "I" TO String-Expected-Value.
           move 1 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-II.
           move '2 is II' to Test-Description.
           perform beforeEach.
           move "II" TO String-Expected-Value.
           move 2 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-III.
           move '3 is III' to Test-Description.
           perform beforeEach.
           move "III" TO String-Expected-Value.
           move 3 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-IV.
           move '4 is IV' to Test-Description.
           perform beforeEach.
           move "IV" TO String-Expected-Value.
           move 4 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-V.
           move '5 is V' to Test-Description.
           perform beforeEach.
           move "V" TO String-Expected-Value.
           move 5 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-VI.
           move '6 is VI' to Test-Description.
           perform beforeEach.
           move "VI" TO String-Expected-Value.
           move 6 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-VII.
           move '7 is VII' to Test-Description.
           perform beforeEach.
           move "VII" TO String-Expected-Value.
           move 7 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-VIII.
           move '8 is VIII' to Test-Description.
           perform beforeEach.
           move "VIII" TO String-Expected-Value.
           move 8 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-IX.
           move '9 is IX' to Test-Description.
           perform beforeEach.
           move "IX" TO String-Expected-Value.
           move 9 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-X.
           move '10 is X' to Test-Description.
           perform beforeEach.
           move "X" TO String-Expected-Value.
           move 10 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-XXVII.
           move '27 is XXVII' to Test-Description.
           perform beforeEach.
           move "XXVII" TO String-Expected-Value.
           move 27 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-XLVIII.
           move '48 is XLVIII' to Test-Description.
           perform beforeEach.
           move "XLVIII" TO String-Expected-Value.
           move 48 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       TEST-TO-ROMAN-XLIX.
           move '49 is XLIX' to Test-Description.
           perform beforeEach.
           move "XLIX" TO String-Expected-Value.
           move 49 to input-number.
           perform callTest.
           exit.

      *****************************************************************
       
       0000-Initialize-Test-Fields.   

           Move 'to-roman' to Entry-Name
           Move 'Frank' to String-Actual-Value.
           Move 'Frank' to String-Expected-Value.



       0000-Initialize-Test-Fields-Exit.
           Exit.     
    