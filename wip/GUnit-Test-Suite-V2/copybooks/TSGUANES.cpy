       GU-Assert-String-Not-Equal.

      * Assert - Invoke Unit Test module
           add 1 to TS-Number-Tests-Performed.

      * Save Expected and Actual Test Values along with Error Message
           Move TS-Test-Description 
             to TR-Test-Description(TS-Number-Tests-Performed)
           Move GU-Expected-Value-String
             to TR-Expected-Value-String(TS-Number-Tests-Performed).
           Move GU-Actual-Value-String
             to TR-Actual-Value-String(TS-Number-Tests-Performed).
           Move GU-Error-Msg to TR-Error-Msg(TS-Number-Tests-Performed).
           
           Call 'GU-AssertEquals-String' using GUnit-Test-Fields.

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
              move GU-Content-Length-Expected 
              to TR-Expected-String-Len-Used(TS-Number-Tests-Performed)
              move GU-Content-Length-Actual
              to TR-Actual-String-Len-Used(TS-Number-Tests-Performed)  
           end-if.     
           
       GU-Assert-Equals-String-Exit.
           Exit.
