       identification division.
       program-id. programIDName.
           
       environment division.
       configuration section.
           
       data division.
       working-storage section.
               copy GUnit-Test-Fields.
       procedure division.
            
           testsuite 'FrankSuite'.

           Move 10 to Expected-Value-Numeric.
           Move 4  to Actual-Value-Numeric.

           Call 'AssertEquals-Numeric' using GUnit-Test-Fields.

           If Test-Passed
               Display 'Test Passed'
           else
               display '!!Test Failed!!'   

           goback.
           
       