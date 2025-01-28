       identification division.
       program-id. CallTests.
       environment division.
       data division.
       working-storage section.
       
       copy GUnit-Test-Fields.cpy.

       01  Float-Expected-4-byte  comp-1   value 10.
       01  Float-Actual-4-byte    comp-1   value 10.

       01  Float-Expected-8-byte  comp-2   value 10.
       01  Float-Actual-8-byte    comp-2   value 10.

       01  Comp-S-Expected-4-byte  Pic s9(9) comp   value 10.
       01  Comp-S-Actual-4-byte    Pic s9(9) comp   value 10.

       01  Comp-S-Expected-2-byte  Pic s9(4) comp   value 10.
       01  Comp-S-Actual-2-byte    Pic s9(4) comp   value 10.

       01  Comp-S-Expected-8-byte  Pic s9(18) comp   value 10.
       01  Comp-S-Actual-8-byte    Pic s9(18) comp   value 10.

       01  Comp-3-S-Expected       Pic s9(9)  comp-3 value 10.
       01  Comp-3-S-Actual         Pic s9(9)  comp-3 value 10.

       01  Comp-U-Expected-4-byte  Pic 9(9)   comp   value 10.
       01  Comp-U-Actual-4-byte    Pic 9(9)   comp   value 10.

       01  Comp-U-Expected-2-byte  Pic 9(4)   comp   value 10.
       01  Comp-U-Actual-2-byte    Pic 9(4)   comp   value 10.

       01  Comp-U-Expected-8-byte  Pic 9(18)  comp   value 10.
       01  Comp-U-Actual-8-byte    Pic 9(18)  comp   value 10.

       01  Comp-3-U-Expected   Pic 9(9)       comp-3   value 10.
       01  Comp-3-U-Actual     Pic 9(9)       comp-3   value 10.

       01  Disp-NM-S-Expected   Pic S9(9)              value +10.
       01  Disp-NM-S-Actual     Pic S9(9)              value +10.

       01  Disp-NM-U-Expected   Pic 9(9)               value 10.
       01  Disp-NM-U-Actual     Pic 9(9)               value 10.

       01  String-Expected-Value pic x(20)    value 'Frank'.
       01  String-Actual-Value   pic x(20)    value 'Frank'.
       01  String-Actual-Value-2 pic x(10)    value 'Frank'.

       01  String-length         pic s9(9) comp.
'
       procedure division.
           Perform 0000-Start-Of-Program-Processing. 
           Perform 1000-Run-Tests. 
           Perform 9999-End-Of-Program-Processing.
           Goback.

       0000-Start-Of-Program-Processing.
           Display '----                           ----'.
           Display '---- Starting GUnit Test       ----'. 
           Display '----                           ----'.
       0000-Start-Of-Program-Processing-Exit.       
           Exit. 

       1000-Run-Tests.      
           Perform 1100-Binary-Numeric-Tests.
           Perform 1200-Float-Numeric-Tests.
           Perform 1300-Packed-Decimal-Tests.
           Perform 1400-Display-Numeric-Tests.
           Perform 1500-String-Char-Tests.
       1000-Run-Tests-Exit.
           Exit. 

       1100-Binary-Numeric-Tests.

      **** Pic s9(4) comp - Signed 2-byte Binary - Equal Values **** 
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic s9(4) comp to Pic s9(4) comp --'. 
           Display '-- equal values                             --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           move Comp-S-Expected-2-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-S-Actual-2-byte.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.
      
      **** Pic s9(4) comp - Signed 2-byte Binary - Un-Equal Values ****
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic s9(4) comp to Pic s9(4) comp --'. 
           Display '-- unequal values                           --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           Move Comp-S-Expected-2-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Comp-S-Actual-2-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.  

      **** Pic s9(9) comp - Signed 4 byte Binary Equal Values *********
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic s9(9) comp to Pic s9(9) comp --'. 
           Display '-- equal values                             --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           move Comp-S-Expected-4-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-S-Actual-4-byte.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      **** Pic s9(9) comp - Signed 4-byte Binary - Un-Equal Values ****
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic s9(9) comp to Pic s9(9) comp --'. 
           Display '-- unequal values                             --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           Move Comp-S-Expected-4-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Comp-S-Actual-4-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.   

      **** Pic 9(4) comp - Un-Signed 2-byte Binary - Equal Values **** 
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic 9(4) comp to Pic 9(4) comp   --'. 
           Display '-- equal values                             --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           move Comp-U-Expected-2-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-U-Actual-2-byte.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.
      
      **** Pic 9(4) comp - Un-Signed 2-byte Binary - Un-Equal Values **
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic 9(4) comp to Pic 9(4) comp   --'. 
           Display '-- unequal values                           --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           Move Comp-U-Expected-2-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Comp-U-Actual-2-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.  

      ******* Pic 9(9) comp - Un-Signed 4 byte Binary Equal Values ****
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic 9(9) comp to Pic 9(9) comp   --'. 
           Display '-- equal values                             --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           move Comp-U-Expected-4-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-U-Actual-4-byte.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      **** Pic 9(9) comp - Un-Signed 4-byte Binary - Un-Equal Values **
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic 9(9) comp to Pic 9(9) comp   --'. 
           Display '-- unequal values                           --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           Move Comp-U-Expected-4-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Comp-U-Actual-4-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      ******* Pic S9(18) comp - Signed 8 byte Binary Equal Values ****
           Display ' '.
           Display '--                                            --'. 
           Display '-- Testing Pic S9(18) comp to Pic S9(18) comp --'. 
           Display '-- equal values                               --'.
           Display '--                                            --'.
           
      * Arrange - Set Test Values
           move Comp-S-Expected-8-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-S-Actual-8-byte.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      **** Pic S9(18) comp - Signed 8-byte Binary - Un-Equal Values **
           Display ' '.
           Display '--                                             --'. 
           Display '-- Testing Pic S9(18) comp to Pic S9(18) comp  --'. 
           Display '-- unequal values                              --'.
           Display '--                                             --'.
           
      * Arrange - Set Test Values
           Move Comp-S-Expected-8-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Comp-S-Actual-8-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      ******* Pic 9(18) comp - Un-Signed 8 byte Binary Equal Values ****
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic 9(18) comp to Pic 9(18) comp --'. 
           Display '-- equal values                             --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           move Comp-U-Expected-8-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-U-Actual-8-byte.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      **** Pic 9(18) comp - Un-Signed 8-byte Binary - Un-Equal Values **
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing Pic 9(18) comp to Pic 9(18) comp   --'. 
           Display '-- unequal values                           --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           Move Comp-U-Expected-8-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Comp-U-Actual-8-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.
************************************************************************
       1100-Binary-Numeric-Tests-Exit.
            Exit.
       
       1200-Float-Numeric-Tests.

************************************************************************
      **** 8-byte Float - Equal Values                               **
           Display ' '.
           Display '--                                             --'. 
           Display '-- Testing comp-2 to comp-2                    --'. 
           Display '-- equal values                                --'.
           Display '--                                             --'.
           
      * Arrange - Set Test Values
           Move Float-Expected-8-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Float-Actual-8-byte.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      **** 8-byte Float - Un-Equal Values                            **
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing comp-2 to comp-2                 --'. 
           Display '-- un-equal values                          --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           move Float-Expected-8-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values    to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = FLoat-Actual-8-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      **** 4-byte Float - Equal Values                               **
           Display ' '.
           Display '--                                             --'. 
           Display '-- Testing comp-1 to comp-1                    --'. 
           Display '-- equal values                                --'.
           Display '--                                             --'.
           
      * Arrange - Set Test Values
           Move Float-Expected-4-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           Compute Actual-Value-Numeric = Float-Actual-4-byte.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

      **** 4-byte Float - Un-Equal Values                            **
           Display ' '.
           Display '--                                          --'. 
           Display '-- Testing comp-1 to comp-1                 --'. 
           Display '-- un-equal values                          --'.
           Display '--                                          --'.
           
      * Arrange - Set Test Values
           move Float-Expected-4-byte to Expected-Value-Numeric.
           Set  Do-Not-Show-Values    to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Float-Actual-4-byte + 1.

      * Assert - Call GUnit to verify expected result matches actual
          Perform 8000-Call-GUnit-Numeric-And-Display-Results
             thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.

       1200-Float-Numeric-Tests-Exit.
           Exit. 

       1300-Packed-Decimal-Tests.
      **** Signed Packed-Decimal - Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic s9(9) comp-3 to Pic s9(9) comp-3 --'. 
           Display '-- equal values                                 --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Comp-3-S-Expected to Expected-Value-Numeric.
           Set Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-3-S-Actual.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.                                      
      
      **** Signed Packed-Decimal - Un-Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic s9(9) comp-3 to Pic s9(9) comp-3 --'. 
           Display '-- unequal values                               --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Comp-3-S-Expected  to Expected-Value-Numeric.  
           Set  Do-Not-Show-Values to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-3-S-Actual + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.  
      
      **** Un-Signed Packed-Decimal - Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic 9(9) comp-3 to Pic 9(9) comp-3   --'. 
           Display '-- equal values                                 --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Comp-3-U-Expected to Expected-Value-Numeric.
           Set Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-3-U-Actual.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.                                      
      
      **** Un-Signed Packed-Decimal - Un-Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic 9(9) comp-3 to Pic 9(9) comp-3 --'. 
           Display '-- unequal values                               --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Comp-3-U-Expected  to Expected-Value-Numeric.  
           Set  Do-Not-Show-Values to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Comp-3-U-Actual + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.         

       1300-Packed-Decimal-Tests-Exit.
           Exit. 

       1400-Display-Numeric-Tests.

      **** Signed Display-Numeric - Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic s9(9) to Pic s9(9)               --'. 
           Display '-- equal values                                 --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Disp-NM-S-Expected to Expected-Value-Numeric.
           Set Show-Values         to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Disp-NM-S-Actual.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.                                      
      
      **** Signed Display-NM - Un-Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic s9(9) to Pic s9(9)               --'. 
           Display '-- unequal values                               --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Disp-NM-S-Expected  to Expected-Value-Numeric.  
           Set  Do-Not-Show-Values to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Disp-NM-S-Actual + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit. 

      **** Un-Signed Display-Numeric - Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic 9(9) to Pic 9(9)               --'. 
           Display '-- equal values                                 --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Disp-NM-U-Expected to Expected-Value-Numeric.
           Set Show-Values         to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Disp-NM-U-Actual.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.                                      
      
      **** Un-Signed Display-NM - Un-Equal Values ** 
           Display ' '.
           Display '--                                              --'. 
           Display '-- Testing Pic 9(9) to Pic 9(9)               --'. 
           Display '-- unequal values                               --'.
           Display '--                                              --'.
           
      * Arrange - Set Test Values
           move Disp-NM-U-Expected  to Expected-Value-Numeric.  
           Set  Do-Not-Show-Values to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = Disp-NM-U-Actual + 1.

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8000-Call-GUnit-Numeric-And-Display-Results
              thru 8000-Call-GUnit-Numeric-And-Display-Results-Exit.  

       1400-Display-Numeric-Tests-Exit.
           Exit.     


       1500-String-Char-Tests.

      **** String Test - Same Values Same Length****
           display ' '.
           Display '-- Testing string to string Same Length     --'. 
           Display '-- Equal values                             --'.

      * Arrange - Set Test Values
           Move String-Expected-Value to Expected-Value-String.
           Set Use-Content-Length to True.
                
      * Act - Run code to produce actual result
           Move String-Actual-Value to Actual-Value-String.   

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8100-Call-GUnit-String-And-Display-Results
              thru 8100-Call-GUnit-String-And-Display-Results-Exit.   
   
      **** String Test - Same Value - Different Lengths ****
           display ' '.
           Display '-- Testing string to string            --'. 
           Display '-- Equal values - Different Lengths    --'.
           Display '-- Expected Length=20 Actual Length=10 --'.

      * Arrange - Set Test Values
           Move String-Expected-Value to Expected-Value-String.
           Set Do-Not-Show-Values     to True.
                
      * Act - Run code to produce actual result
           Move String-Actual-Value-2 to Actual-Value-String.   

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8100-Call-GUnit-String-And-Display-Results
              thru 8100-Call-GUnit-String-And-Display-Results-Exit. 

      **** String Test - Different Values Same Length****
           display ' '.
           Display '-- Testing string to string Same Length     --'. 
           Display '-- Un-Equal values                             --'.

      * Arrange - Set Test Values
           Move String-Expected-Value to Expected-Value-String.
           Set Do-Not-Show-Values            to True.
                
      * Act - Run code to produce actual result
           Move Spaces to Actual-Value-String.   

      * Assert - Call GUnit to verify expected result matches actual
           Perform 8100-Call-GUnit-String-And-Display-Results
              thru 8100-Call-GUnit-String-And-Display-Results-Exit.   
                 
       1500-String-Char-Tests-Exit.
           Exit.      

       8000-Call-GUnit-Numeric-And-Display-Results.
           call 'AssertEquals-Numeric' using GUnit-Test-Fields.
      *     display '   AssertEquals result: ' Test-Result.
           if Test-Passed 
                 Display '-- AssertEquals Test    - Passed --'
           else           
                 Display '!! AssertEquals Test    - Failed !!'
           end-if.                             

           call 'AssertNotEquals-Numeric' using GUnit-Test-Fields.
      *     display 'AssertNotEquals result: ' Test-Result. 
           if Test-Passed 
                 Display '-- AssertNotEquals Test - Passed --'
           else           
                 Display '!! AssertNotEquals Test - Failed !!'
           end-if.                                 

       8000-Call-GUnit-Numeric-And-Display-Results-Exit.
           Exit.

       8100-Call-GUnit-String-And-Display-Results.

           call 'AssertEquals-String' using GUnit-Test-Fields.
      *     display '   AssertEquals result: ' Test-Result. 

           if Test-Passed 
                 Display '-- AssertEqualsTest     - Passed --'
           else           
                 Display '!! AssertEquals Test    - Failed !!'
           end-if.                          

           call 'AssertNotEquals-String' using GUnit-Test-Fields.
      *     display 'AssertNotEquals result: ' Test-Result.   

           if Test-Passed 
                 Display '-- AssertNotEquals Test - Passed --'
           else           
                 Display '!! AssertNotEquals Test - Failed !!'
           end-if.   

       8100-Call-GUnit-String-And-Display-Results-Exit.
           Exit.

       9999-End-Of-Program-Processing.
           Display ' '. 
           Display '----                   ----'.
           Display '---- End of call tests ----'.
           Display '----                   ----'.
       9999-End-Of-Program-Processing-Exit.
           Exit.      
     
       