 
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