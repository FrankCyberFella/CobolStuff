       Identification Division.
       Program-id. TSCalc.
      
       Data Division.
       Working-Storage Section.
        01 Test-Number-Chars pic X(255).
        01 Test-Description  pic X(255).
        01 Test-Number-Out   pic zz9.
        01 Test-Result-Table.
           05 Test-Result  occurs 500 times  
                           indexed by Test-Result-Index.
                                 
              10 TR-Test-Description   pic x(255).                   
              10 TR-Pass-Fail          pic x.
                 88 TR-Test-Passed     value 'Y'.
                 88 TR-Test-Failed     value 'N'.                   
              10 TR-Result             comp-2.
              10 TR-Error-Msg          pic X(255).
              10 TR-Test-Length        pic s9(4) comp. 

              10 TR-Expected-Value-Numeric comp-2.
              10 TR-Actual-Value-Numeric   comp-2.

              10 TR-Expected-Value-String Pic x(32767).
              10 TR-Actual-Value-String   Pic x(32767).
       

      * Number-Tests-Performed is also used as subscript for Test Results        
        01 Number-Tests-Performed  pic s9(3) comp value 0. 
        01 Number-Tests-Passed     Pic s9(3) comp-3.
        01 Number-Tests-Failed     Pic s9(3) comp-3.   
      
      ****************************************************************
      * Copybook with Fields required/used by GUnit
      * Fields will be set by the caller and returned by GUnit 
      ****************************************************************
       copy '../copybooks/GUnitFld.cpy'.
       
       Procedure Division.
           Perform 0000-Start-Of-Program-Processing. 
           Perform 1000-Run-Tests. 
           Perform 9999-End-Of-Program-Processing.
           Goback.
       0000-Start-Of-Program-Processing.
           Set GU-Do-Not-Show-Values to True. 
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
           move ZERO to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.   
    
       Test-Add-1.
           move "Add 1" to Test-Description.
           move "1" to Test-Number-Chars.
           move 1 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.  

       Test-Add-1-2.
           move "Add 1,2" to Test-Description.
           move "1,2" to Test-Number-Chars.
           move 3 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.  
       Test-Add-1-2-3.
           move "Add 1,2,3" to Test-Description.
           move "1,2,3" to Test-Number-Chars.
      *    move 6 to GU-Expected-Value-Numeric. *> original statement
           move 5 to GU-Expected-Value-Numeric. *> changed to make test fail

           perform ACT-AND-ASSERT.  
       Test-Add-Mixed-Delimiters.
           move "Add with mix of comma and newline delimiters" 
               to Test-Description.
           move "1\n2,3" to Test-Number-Chars.
           move 6 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.
       Test-Add-With-Newline.
           move spaces to Test-Number-Chars.
           move "Add 1,\n - repeated delimiters" to Test-Description.
           move "1,\n" to Test-Number-Chars.
           move 1 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT. 
       Test-Add-Double-Digits.
           move "Add double digit numbers" to Test-Description.
           move "12,23" to Test-Number-Chars.
           move 35 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT. 
       Test-Add-Triple-Digits.
           move "Add triple digit numbers" to Test-Description.
           move "123,456" to Test-Number-Chars.
           move 579 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT. 
 
       Test-Custom-Delimiter-Single-Character.
           move "Use custom delimiter - single character" 
            to Test-Description.
           move "//;\n1;2;3" to Test-Number-Chars.
           move 6 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.
       Test-Negative-Number-Three-Digits.
           move "Calling Add with -100 will throw exception" 
            to Test-Description.
           move "-100" to Test-Number-Chars.
           move -1 to GU-Expected-Value-Numeric.
           move "negatives not allowed -100" to GU-Expected-Value-String.
           perform ACT-AND-ASSERT.
       Test-Negative-Number-Two-Digits.
           move "Calling Add with -10 will throw exception" 
            to Test-Description.
           move "-10" to Test-Number-Chars.
           move -1 to GU-Expected-Value-Numeric.
           move "negatives not allowed -10" to GU-Expected-Value-String.
           perform ACT-AND-ASSERT.
       Test-Multiple-Negative-Numbers.
           move "Calling Add with -10 -11 will throw exception" 
            to Test-Description.
           move "-10,-11" to Test-Number-Chars.
           move -1 to GU-Expected-Value-Numeric.
           move "negatives not allowed -10 -11" 
            to GU-Expected-Value-String.
           perform ACT-AND-ASSERT.
           move spaces to GU-Expected-Value-String.
       Test-Ignore-Large-Numbers.
           move "Numbers bigger than 1000 should be ignored"
            to Test-Description.
           move "2,1001" to Test-Number-Chars.
           move 2 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.
       Test-Longer-Delimiters.
           move "Delimiters can be any length"
            to Test-Description.
           move "//[***]\n1***2***3" to Test-Number-Chars.
           move 6 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.
      
       Test-Multiple-Custom-Delimiters.
           move 'Multiple custom delimiters' to Test-Description.
           move "//[**][%%]\n1**2%%3" to Test-Number-Chars.
           move 6 to GU-Expected-Value-Numeric.
           perform ACT-AND-ASSERT.
       Test-End.
      *    Once tests are arranged do common act and assert steps 
       ACT-AND-ASSERT.
           add 1 to Number-Tests-Performed.
           call 'add' using Test-Number-Chars
                          , Test-Result(Number-Tests-Performed).
           move GU-Actual-Value-Numeric
             to TR-Actual-Value-Numeric(Number-Tests-Performed).
           move GU-Error-Msg to TR-Error-Msg(Number-Tests-Performed).
           
      * Assert - Call GUnit to verify expected result matches actual
           set GU-Test-Failed to True.
           call 'AssertEquals-Numeric' using GUnit-Test-Fields.

           if GU-Test-Passed
              add 1 to Number-Tests-Passed
              Set TR-Test-Passed(Number-Tests-Performed) to True
           else
              add 1 to Number-Tests-Failed
              Set TR-Test-Failed(Number-Tests-Performed) to True
              move GU-Actual-Value-Numeric
                to TR-Actual-Value-Numeric(Number-Tests-Performed)
              move GU-Error-Msg to TR-Error-Msg(Number-Tests-Performed)
           end-if.     

 
      *     perform show-results.
           add 1 to Number-Tests-Performed.
           set GU-Test-Failed to True. 
           call 'AssertEquals-String' using GUnit-Test-Fields.
           if GU-Test-Passed
              Set TR-Test-Passed(Number-Tests-Performed) to True
           else
              Set TR-Test-Failed(Number-Tests-Performed) to True
              Move Test-Description 
                to TR-Test-Description(Number-Tests-Performed)
              Move GU-Expected-Value-Numeric 
                to TR-Expected-Value-Numeric(Number-Tests-Performed)
              Move GU-Actual-Value-Numeric     
                to TR-Actual-Value-Numeric(Number-Tests-Performed)
              Move GU-Expected-Value-String 
                to TR-Expected-Value-String(Number-Tests-Performed)  
              Move GU-Actual-Value-String      
                to TR-Actual-Value-String(Number-Tests-Performed)
              Move GU-Test-Length   
                to TR-Test-Length(Number-Tests-Performed)
           end-if.       
      *     perform show-results.
           
       show-results.
      * Check test result returned by GUnit
      * Process accordingly
           Display '---- Testing Complete -----'.
           Display 'Number of tests performed: ' Number-Tests-Performed
           Display 'Number of tests passed: ' Number-Tests-Passed
           Display 'Number of tests failed: ' Number-Tests-Failed

           perform varying Test-Result-Index from 1 by 1
                     until Test-Result-Index < Number-Tests-Performed 
           
               if GU-Test-Passed
                   Display '.' with no advancing
               else
                  Display 'F'
               end-if

           end-perform.   
           
           perform varying Test-Result-Index from 1 by 1
                     until Test-Result-Index < Number-Tests-Performed 
               
              Move Test-Result-Index to Test-Number-Out 
              Display 'Test #' Test-Number-Out  
              Display ' Failed'
              Display function 
                      trim(TR-Test-Description(Number-Tests-Performed)) 
              
              Display 'Expected Number: ' GU-Expected-Value-Numeric
              Display '  Actual Number: ' GU-Actual-Value-Numeric

              Display 'String Length Used: ' 
                                 TR-Test-Length(Number-Tests-Performed)
              Display 'Expected String: ' 
                 function 
                  trim(TR-Expected-Value-String(Number-Tests-Performed))
              Display '  Actual String: ' 
                 function 
                    trim(TR-Actual-Value-String(Number-Tests-Performed))

           end-perform.
      ****************************************************************      
       9999-End-Of-Program-Processing.
           Display ' '. 
       9999-End-Of-Program-Processing-Exit.
           Exit.      

       end program TSCalc.

       copy appCalc.

       copy '../GUnit/GUnitV3.cbl'.
