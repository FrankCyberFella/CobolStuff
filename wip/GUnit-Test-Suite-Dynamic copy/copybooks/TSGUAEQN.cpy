       GU-Assert-Numeric-Equal.

      * Assert - Invoke Unit Test module
           add 1 to TS-Number-Tests-Performed.

      * Save Expected and Actual Test Values along with Error Message
           Move TS-Test-Description 
             to TR-Test-Description(TS-Number-Tests-Performed)
           Move GU-Expected-Value-Numeric
             to TR-Expected-Value-Numeric(TS-Number-Tests-Performed).
           Move GU-Actual-Value-Numeric
             to TR-Actual-Value-Numeric(TS-Number-Tests-Performed).
           Move GU-Error-Msg to TR-Error-Msg(TS-Number-Tests-Performed).
           
           Call GU-AssertEquals-Numeric using GUnit-Test-Fields.

           if GU-Test-Passed
              add 1 to TS-Number-Tests-Passed
              Set TR-Test-Passed(TS-Number-Tests-Performed) to True
           else
              add 1 to TS-Number-Tests-Failed
              Set TR-Test-Failed(TS-Number-Tests-Performed) to True
              move GU-Actual-Value-Numeric
                to TR-Actual-Value-Numeric(TS-Number-Tests-Performed)
              move GU-Error-Msg 
                to TR-Error-Msg(TS-Number-Tests-Performed)
           end-if.     
           
       GU-AssertEquals-Numeric-Exit.
           Exit.
