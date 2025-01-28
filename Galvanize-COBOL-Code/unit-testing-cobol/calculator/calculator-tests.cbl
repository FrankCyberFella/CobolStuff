       Identification Division.
       Program-id. calculator-tests.
      
       Data Division.
       Working-Storage Section.
        01 Test-Number-Chars pic X(255).
        01 Test-Description pic X(255).
        01 Test-Result-Table.
           05 result comp-2.
           05 error-msg pic X(255).
      
      ****************************************************************
      * Copybook with Fields required/used by GUnit
      * Fields will be set by the caller and returned by GUnit 
      ****************************************************************
       copy GUnit-Test-Fields.cpy.

       Procedure Division.
           Perform 0000-Start-Of-Program-Processing. 
           Perform 1000-Run-Tests. 
           Perform 9999-End-Of-Program-Processing.
           Goback.

       0000-Start-Of-Program-Processing.
           Set Do-Not-Show-Values to True. 

       0000-Start-Of-Program-Processing-Exit.       
           Exit. 

       1000-Run-Tests. 
           Perform Test-Start thru Test-End.

       1000-Run-Tests-Exit.
           Exit. 

      ****************************************************************
       Test-Start.

       Test-Add-Empty.
           move "Add Empty" to Test-Description.
           move SPACES to Test-Number-Chars.
           move ZERO to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.   
    
       Test-Add-1.
           move "Add 1" to Test-Description.
           move "1" to Test-Number-Chars.
           move 1 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.  

       Test-Add-1-2.
           move "Add 1,2" to Test-Description.
           move "1,2" to Test-Number-Chars.
           move 3 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.  

       Test-Add-1-2-3.
           move "Add 1,2,3" to Test-Description.
           move "1,2,3" to Test-Number-Chars.
           move 6 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.  

       Test-Add-Mixed-Delimiters.
           move "Add with mix of comma and newline delimiters" 
               to Test-Description.
           move "1\n2,3" to Test-Number-Chars.
           move 6 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.

       Test-Add-With-Newline.
           move spaces to Test-Number-Chars.
           move "Add 1,\n - repeated delimiters" to Test-Description.
           move "1,\n" to Test-Number-Chars.
           move 1 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT. 

       Test-Add-Double-Digits.
           move "Add double digit numbers" to Test-Description.
           move "12,23" to Test-Number-Chars.
           move 35 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT. 

       Test-Add-Triple-Digits.
           move "Add triple digit numbers" to Test-Description.
           move "123,456" to Test-Number-Chars.
           move 579 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT. 
 
       Test-Custom-Delimiter-Single-Character.
           move "Use custom delimiter - single character" 
            to Test-Description.
           move "//;\n1;2;3" to Test-Number-Chars.
           move 6 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.


       Test-Negative-Number-Three-Digits.
           move "Calling Add with -100 will throw exception" 
            to Test-Description.

           move "-100" to Test-Number-Chars.
           move -1 to Expected-Value-Numeric.
           move "negatives not allowed -100" to Expected-Value-String.
           perform ACT-AND-ASSERT.

       Test-Negative-Number-Two-Digits.
           move "Calling Add with -10 will throw exception" 
            to Test-Description.

           move "-10" to Test-Number-Chars.
           move -1 to Expected-Value-Numeric.
           move "negatives not allowed -10" to Expected-Value-String.
           perform ACT-AND-ASSERT.

       Test-Multiple-Negative-Numbers.
           move "Calling Add with -10 -11 will throw exception" 
            to Test-Description.
           move "-10,-11" to Test-Number-Chars.
           move -1 to Expected-Value-Numeric.
           move "negatives not allowed -10 -11" 
            to Expected-Value-String.
           perform ACT-AND-ASSERT.
           move spaces to Expected-Value-String.

       Test-Ignore-Large-Numbers.
           move "Numbers bigger than 1000 should be ignored"
            to Test-Description.
           move "2,1001" to Test-Number-Chars.
           move 2 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.

       Test-Longer-Delimiters.
           move "Delimiters can be any length"
            to Test-Description.
           move "//[***]\n1***2***3" to Test-Number-Chars.
           move 6 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.
      
       Test-Multiple-Custom-Delimiters.
           move 'Multiple custom delimiters' to Test-Description.
           move "//[**][%%]\n1**2%%3" to Test-Number-Chars.
           move 6 to Expected-Value-Numeric.
           perform ACT-AND-ASSERT.

       Test-End.
      *    Once tests are arranged do common act and assert steps 
       ACT-AND-ASSERT.
           call 'add' using Test-Number-Chars, Test-Result-Table.
           move result of Test-Result-Table to Actual-Value-Numeric.
           move error-msg of Test-Result-Table to Actual-Value-String.
           

      * Assert - Call GUnit to verify expected result matches actual
           set Test-Failed to True.
           call 'AssertEquals-Numeric' using GUnit-Test-Fields.
           perform show-results.
           set Test-Failed to True. 
           call 'AssertEquals-String' using GUnit-Test-Fields.
           perform show-results.
           
       show-results.
      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
               Display '.' with no advancing
           else
              Display 'F'
              Display function trim(Test-Description)
              Display 'Input: ' function trim(Test-Number-Chars)
              Display 'Expected Number: ' Expected-Value-Numeric
              Display 'Actual Number: ' Actual-Value-Numeric
              Display 'Expected String: ' 
                 function trim(Expected-Value-String)
              Display 'Actual String: ' 
                 function trim(Actual-Value-String)
           end-if.

      ****************************************************************      



       9999-End-Of-Program-Processing.
           Display ' '. 

       9999-End-Of-Program-Processing-Exit.
           Exit.      
     
       