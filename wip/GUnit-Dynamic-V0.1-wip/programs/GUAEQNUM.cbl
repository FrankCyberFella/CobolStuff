           identification division.
           program-id. GUAEQNUM.
           
           environment division.
           configuration section.
           
           data division.
           working-storage section.

           Linkage Section.

               copy 'GUNITFLD'.
           
           procedure division using GUnit-Test-Fields.

           if GU-Show-Values
               display ' '
               display '--- AssertEquals-Numeric ----------------'
               display '  Actual Received: 'GU-Actual-Value-Numeric  
               display 'Expected Received: 'GU-Expected-Value-Numeric
               display ' '
           end-if.               
          
           if(GU-Actual-Value-Numeric equal GU-Expected-Value-Numeric)
             set GU-Test-Passed to True
           else
             set GU-Test-Failed to True
           end-if.

           goback.
           
           end program GUAEQNUM.
           