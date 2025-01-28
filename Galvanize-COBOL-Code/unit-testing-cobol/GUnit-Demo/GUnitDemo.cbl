       Identification Division.
       Program-id. GUnitDemo.
      
       Data Division.
       Working-Storage Section.

        01 Test-String-5-characters    Pic x(5).
        01 Test-String-10-characters   pic x(10).
      
      ****************************************************************
      * Copybook with Fields required/used by GUnit
      * Fields will be set by the caller and returned by GUnit 
      ****************************************************************
       copy GUnit-Test-Fields.cpy.

      ****************************************************************
      * To Use GUnit:
      *    1. Be sure to include the 'GUnit-Test_Fields.cpy'
      *       copy book in your working-Storage Section.
      *       It contains all user set fields for GUnit as wells
      *       the result fields GUnit will send back.
      *
      *    2. Before calling GUnit be sure you have set values for the
      *       following fields in the GUnit copybook:
      *
      *       a. Expected-Value-Numeric (or Expected-Value-String)
      *       b. Actual-Value-Numeric (or Actual-Value-String)
      *       c. Set Show-Values to true
      *           or Do-Not-Show-Values to true
      *           Depending on if you want to see values GUnit 
      *           received and other pertinent info.
      *    
      *    3. Once  you have sent the incoming information for GUnit,
      *       Call the Assert you want to use passing it the GUnit copybook:
      *
      *       Call 'AssertEquals-Numeric'    using GUnit-Test-Fields. 
      *       Call 'AssertNotEquals-Numeric' using GUnit-Test-Fields. 
      *       Call 'AssertEquals-String'     using GUnit-Test-Fields. 
      *       Call 'AssertNotEquals-String'  using GUnit-Test-Fields. 
      *
      *    4. Upon return from the call to the GUnit Assert,
      *       These fields are populated in the GUnIt copybook:
      *
      *     a. Test-Failed - Condition-name - if test failed
      *
      *     b. Test-Passed - Condition-name - if test passed
      *
      *     c. Content-Length-Expected - Numeric - Strings only
      *        (the length of the content in the expected string passed)
      *
      *     d. Content-Length-Actual - Numeric - Strings only
      *        (the length of the content in the actual string passed)
      *
      *     e. Content-Lengths-Matched - Condition-name (Strings only)
      *        (if the content length of expected and actual matched)
      *
      *     f. Content-Lengths-Do-Not-Match - Condition-name Strings only
      *        (if the content length of expected and actual differ)
      *
      *  The copybook fields set by GUnit may be used in any manner
      *  teh programmer desires
      **************************************************************** 

       Procedure Division.
           Perform 0000-Start-Of-Program-Processing. 
           Perform 1000-Run-Tests. 
           Perform 9999-End-Of-Program-Processing.
           Goback.

       0000-Start-Of-Program-Processing.
           Display '----                           ----'.
           Display '---- Starting GUnit Tests       ----'. 
           Display '----                           ----'.
       0000-Start-Of-Program-Processing-Exit.       
           Exit. 

       1000-Run-Tests.      
           Perform 1100-Numeric-Tests.
           Perform 1200-String-Char-Tests.
       1000-Run-Tests-Exit.
           Exit. 

       1100-Numeric-Tests.

      **** Numeric Tests - Equal Values **** 
           Display ' '.
           Display '--                                     --'. 
           Display '-- Numeric Tests - Equal Values        --'. 
           Display '--                                     --'
           
      * Arrange - Set Test Values in GUnit copybook
           move 4 to Expected-Value-Numeric.
           Set  Do-Not-Show-Values to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = 2 + 2.

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertEquals-Numeric' using GUnit-Test-Fields. 

      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'Equals Test Passed'
           else
              Display 'Equals Test Failed'
           end-if.    

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertNotEquals-Numeric' using GUnit-Test-Fields. 

      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'Not Equals Test Passed'
           else
              Display 'Not Equals Test Failed'
           end-if.  
         
      **** Numeric Tests - Un-Equal Values **** 
           Display ' '.
           Display '--                                     --'. 
           Display '-- Numeric Tests - Un-Equal Values     --'. 
           Display '--                                     --'
           
      * Arrange - Set Test Values in GUnit copybook
           move 5 to Expected-Value-Numeric.
           Set  Do-Not-Show-Values     to True.

      * Act - Run code to produce actual result
           compute Actual-Value-Numeric = 2 + 2.

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertNotEquals-Numeric'    using GUnit-Test-Fields. 

      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'Not Equals Test Passed'
           else
              Display 'Not Equals Test Failed'
           end-if.  

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertEquals-Numeric'    using GUnit-Test-Fields. 

      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'Equals Test Passed'
           else
              Display 'Equals Test Failed'
           end-if.    
     

       1100-Numeric-Tests-Exit.
            Exit.
       
           
       1200-String-Char-Tests.

      **** String Test - Same Values Same Length****
           display ' '.
           Display '-- Testing string to string Same Length     --'. 
           Display '-- Equal values                             --'.

      * Arrange - Set Test Values
           Move 'Frank' to Expected-Value-String.
           Set Do-Not-Show-Values to True.
                
      * Act - Run code to produce actual result
           Move 'Frank' to Actual-Value-String.   

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertEquals-String' using GUnit-Test-Fields. 
      
      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'String Equals Test Passed'
           else
              Display 'String Equals Test Failed'
           end-if .  

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertNotEquals-String' using GUnit-Test-Fields. 
      
      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'String Not Equals Test Passed'
           else
              Display 'String Not Equals Test Failed'
           end-if.  

      **** String Test - Different Values Same Length****
           display ' '.
           Display '-- Testing string to string Same Length     --'. 
           Display '-- Un-Equal values                             --'.

      * Arrange - Set Test Values
           Move 'Frank' to Expected-Value-String.
           Set Do-Not-Show-Values to True.
                
      * Act - Run code to produce actual result
           Move 'David' to Actual-Value-String.   

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertEquals-String' using GUnit-Test-Fields. 
      
      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'String Equals Test Passed'
           else
              Display 'String Equals Test Failed'
           end-if .  

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertNotEquals-String' using GUnit-Test-Fields. 
      
      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'String Not Equals Test Passed'
           else
              Display 'String Not Equals Test Failed'
           end-if.       

      **** String Test - Different Values Same Length****
           display ' '.
           Display '-- Testing string to string Different Length   --'.
           Display ' Expected: Pic x(5)   Actual: Pic x(10)        --'. 
           Display '-- Equal values                                --'.

      * Arrange - Set Test Values
           Move 'Frank' to Test-String-5-characters
                           Test-String-10-characters.
           Move Test-String-5-characters to Expected-Value-String.      
           Set  Show-Values to True.
                
      * Act - Run code to produce actual result
           Move Test-String-10-characters to Actual-Value-String.   

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertEquals-String' using GUnit-Test-Fields. 
      
      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'String Equals Test Passed'
           else
              Display 'String Equals Test Failed'
           end-if .  

      * Assert - Call GUnit to verify expected result matches actual
           call 'AssertNotEquals-String' using GUnit-Test-Fields. 
      
      * Check test result returned by GUnit
      * Process accordingly
           if Test-Passed
              Display 'String Not Equals Test Passed'
           else
              Display 'String Not Equals Test Failed'
           end-if.            
                 
       1500-String-Char-Tests-Exit.
           Exit.      


       9999-End-Of-Program-Processing.
           Display ' '. 
           Display '----                   ----'.
           Display '---- End of call tests ----'.
           Display '----                   ----'.
       9999-End-Of-Program-Processing-Exit.
           Exit.      
     
       