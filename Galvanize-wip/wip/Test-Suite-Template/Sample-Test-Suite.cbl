       identification division.
       program-id. TSTemplt.
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.

         01 WS-Test-Number-Chars pic X(255).

         01 WS-My-Test-Result.
              05 WS-My-Result      comp-2.
              05 WS-My-Error-msg   pic X(255).

      ****************************************************************
      * Copybook with Fields required/used by Test Suite Template
      * Fields will be set by GUnit and used however the programmer
      * deems necessary for thier test processing 
      ****************************************************************  
         copy 'TSFields'.
      ****************************************************************
      * Copybook with Fields required/used by GUnit
      * Fields will be set by the caller and returned by GUnit 
      ****************************************************************
       copy 'GUnitFld'.    
       
       procedure division.

           Perform Run-Tests.       *> Perform all tests in test suite
           Perform TS-Show-Results. *> Display results

           goback.
       
       Run-Tests.

           Perform Test-1.
           Perform Test-2.
           Perform Test-3.
           Perform Test-4.
           Perform Test-5.
           Perform Test-6.

       Run-Tests-Exit.
           exit.


       Test-1.

      * Arrange - Setup data for test

      * Initialize GUnit-Test-Fields default values.
           perform GU-Initialize-Default-Values.

      * Set up GUnit-Test-Fields for test
           move "Test-1 - Verify Values Are Equal" *> Set Test Desc.
             to TS-Test-Description.
           
           move "-10,-11" to WS-Test-Number-Chars.
           move -1 to GU-Expected-Value-Numeric.
           
           Move 'Values are not equal' to GU-Error-Msg. *> Set err msg
       
      * Act - Perform process to obtain actual value
      
           call 'add' using WS-Test-Number-Chars, WS-My-Test-Result.
           move WS-My-Result    to GU-Actual-Value-Numeric.
           move WS-My-Error-msg to GU-Actual-Value-String.

      * Call GUnit and save result.     
           
           Perform GU-Assert-Numeric-Equal.

       Test-1-Exit.
           Exit.

       Test-2.

      * Arrange - Setup data for test

      * Initialize GUnit-Test-Fields default values.
           perform GU-Initialize-Default-Values.

      * Set up GUnit-Test-Fields for test
           move "Test-2 - Verify Values Are Equal" *> Set Test Desc.
             to TS-Test-Description.
           
           move "-10,-11" to WS-Test-Number-Chars.
           move 1 to GU-Expected-Value-Numeric. *> Purposely wrong
           
           Move 'Values are not equal' to GU-Error-Msg. *> Set err msg
       
      * Act - Perform process to obtain actual value
      
           call 'add' using WS-Test-Number-Chars, WS-My-Test-Result.
           move WS-My-Result    to GU-Actual-Value-Numeric.
           move WS-My-Error-msg to GU-Actual-Value-String.

      * Call GUnit and save result.     
           
           Perform GU-Assert-Numeric-Equal.

       Test-2-Exit.
           Exit.

       Test-3.

      * Arrange - Setup data for test

      * Initialize GUnit-Test-Fields default values.
           perform GU-Initialize-Default-Values.

      * Set up GUnit-Test-Fields for test
           move "Test-3 - Verify Values Are Not Equal" *> Set Test Desc.
             to TS-Test-Description.
           
           move "-10,-11" to WS-Test-Number-Chars.
           move -1 to GU-Expected-Value-Numeric.
           
           Move 'Values are not equal' to GU-Error-Msg. *> Set err msg
       
      * Act - Perform process to obtain actual value
      
           call 'add' using WS-Test-Number-Chars, WS-My-Test-Result.
           move WS-My-Result    to GU-Actual-Value-Numeric.
           move WS-My-Error-msg to GU-Actual-Value-String.

      * Call GUnit and save result.               
           Perform GU-Assert-Numeric-Not-Equal.

       Test-3-Exit.
           Exit.

       Test-4.

      * Arrange - Setup data for test

      * Initialize GUnit-Test-Fields default values.
           perform GU-Initialize-Default-Values.

      * Set up GUnit-Test-Fields for test
           move "Test-4 - Verify Values Are Not Equal" *> Set Test Desc.
             to TS-Test-Description.
           
           move "-10,-11" to WS-Test-Number-Chars.
           move 1 to GU-Expected-Value-Numeric. *> Purposely wrong
           
           Move 'Values are not equal' to GU-Error-Msg. *> Set err msg
       
      * Act - Perform process to obtain actual value
      
           call 'add' using WS-Test-Number-Chars, WS-My-Test-Result.
           move WS-My-Result    to GU-Actual-Value-Numeric.
           move WS-My-Error-msg to GU-Actual-Value-String.

      * Call GUnit and save result.               
           Perform GU-Assert-Numeric-Not-Equal.

       Test-4-Exit.
           Exit. 

       Test-5.

      * Arrange - Setup data for test

      * Initialize GUnit-Test-Fields default values.
           perform GU-Initialize-Default-Values.

      * Set up GUnit-Test-Fields for test
           move "Test-5 - Verify Strings Are Equal" *> Set Test Desc.
             to TS-Test-Description.
           
           move 'Al' to GU-Expected-Value-String. *> Set expected value
           
           Move 'Values are not equal' to GU-Error-Msg. *> Set err msg
       
      * Act - Perform process to obtain actual value     
           move 'Al' to GU-Actual-Value-String.

      * Call GUnit and save result.             
           Perform GU-Assert-String-Equals.

       Test-5-Exit.
           Exit. 

       Test-6.

      * Arrange - Setup data for test

      * Initialize GUnit-Test-Fields default values.
           perform GU-Initialize-Default-Values.

      * Set up GUnit-Test-Fields for test
           move "Test-6 - Verify Strings Are Equal" *> Set Test Desc.
             to TS-Test-Description.
           
           move 'Al' to GU-Expected-Value-String. *> Set expected value
           
           Move 'Values are not equal' to GU-Error-Msg. *> Set err msg
       
      * Act - Perform process to obtain actual value     
           move 'Pete' to GU-Actual-Value-String.

      * Call GUnit and save result.               
           Perform GU-Assert-String-Equals.

       Test-6-Exit.
           Exit. 



      ******************************************************************
      * COPY Test Suite Features Desired/Used before end of program
      ******************************************************************
       copy 'TSGUAEQN'. *> Assert Equals Numeric
       copy 'TSGUANEN'. *> Assert NotEquals Numeric
       copy 'TSGUAEQS'. *> Assert Equals String
       copy 'TSGUANES'. *> Assert Not Equals String
       copy 'TSShow'.   *> Test Suit Display Results
       copy 'GUInit'.   *> GUnit Initialize to Defaults

       end program TSTemplt.

      ******************************************************************
      * COPY program code to be tested AFTER end of Test Suite Program
      ******************************************************************
       copy './appCalc.cbl'.             *> Program to be tested

      ******************************************************************
      * COPY program code to be tested AFTER end of Test Suite Program
      ******************************************************************       
       copy 'GUnitV3'.   *> GUnit Code
