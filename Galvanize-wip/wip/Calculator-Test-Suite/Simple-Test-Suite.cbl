cd       identification division.
       program-id. TSSimpl.
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.
      ****************************************************************
      * Copybook with Fields required/used by Test Suite Template
      * Fields will be set by GUnit and used however the programmer
      * deems necessary for thier test processing 
      ****************************************************************  
         copy '../copybooks/TSFields.cpy'.
      ****************************************************************
      * Copybook with Fields required/used by GUnit
      * Fields will be set by the caller and returned by GUnit 
      ****************************************************************
        copy '../copybooks/GUnitFld.cpy'.    
       procedure division.

       Test-Add-1.

      * Arrange - Setup data for test

           move "Add 1" to TS-Test-Description.
           move 1 to GU-Expected-Value-Numeric.
      * Call GUnit eto initialize test fields to default values
           call 'GU-Initialize-Default-Values' using GUnit-Test-Fields
           Move 'test error message-1' to GU-Error-Msg.
       
      * Act - Perform process to obtain actual value

           Move 5 to GU-Actual-Value-Numeric *> Set/Determine actual

      * Call GUnit and save result.     
           move GU-Expected-Value-Numeric to GU-Actual-Value-Numeric
           perform 5 times
              perform GU-Assert-Numeric-Equal
           end-perform.    

           move 9999 to GU-Actual-Value-Numeric
           perform GU-Assert-Numeric-Equal

           perform 5 times
              perform GU-Assert-Numeric-Equal
           end-perform.    

           move GU-Expected-Value-Numeric to GU-Actual-Value-Numeric
           perform 5 times
              perform GU-Assert-Numeric-Equal
           end-perform.    

           Perform TS-Show-Results.

           goback.
 
       copy '../copybooks/TSGUAEQ.cpy'.
       copy '../copybooks/TSShow.cpy'.
       end program TSSimpl.

      * copy appCalc.

       copy '../GUnit/GUnitV3.cbl'.
