           identification division.
           program-id. GUANESTR.
           
           environment division.
           configuration section.
           
           data division.
           working-storage section.
           
           01 Number-of-Trailing-Spaces      Pic s9(9)   comp.

           linkage section.

               copy 'GUNITFLD'.

           procedure division using GUnit-Test-Fields.

           Perform 1000-Determine-Content-Lengths
              thru 1000-Determine-Content-Lengths-Exit    

           if GU-Show-Values
               display ' '
               display '-- AssertNotEquals-String ------------------'
               Perform 1100-Show-Values-String
                  thru 1100-Show-Values-String-Exit
           end-if.                

           if GU-Actual-value-string(1:GU-Content-Length-Actual) 
              Not equal 
              GU-Expected-value-string
                    (1:GU-Content-Length-Expected)
              set GU-Test-Passed to True
           else
              set GU-Test-Failed to True
           end-if.

           goback.

       1000-Determine-Content-Lengths.

           Move 0 to Number-of-Trailing-Spaces.

           Inspect GU-Expected-Value-String
               TALLYING  Number-of-Trailing-Spaces
               FOR Trailing ' '.                    

           compute GU-Content-Length-Expected = 
                                     Length of GU-Expected-Value-String 
                                   - Number-of-Trailing-Spaces.
      
           Move 0 to Number-of-Trailing-Spaces.                          
           
           Inspect GU-Actual-value-string
             TALLYING  Number-of-Trailing-Spaces
                FOR TRAILING Spaces.     

           compute GU-Content-Length-Actual = 
                Length of GU-Actual-Value-String 
                        - Number-of-Trailing-Spaces.             

           If GU-Content-Length-Expected equals GU-Content-Length-Actual
              Set GU-Content-Lengths-Match to True
           else
              Set GU-Content-Lengths-Do-Not-Match to True       
           End-if.

       1000-Determine-Content-Lengths-Exit.
         Exit.

       1100-Show-Values-String.
     
           display '     Actual Value Received: ' 
                   GU-Actual-value-string(1:GU-Content-Length-Actual).
           display '   Content Length (Actual): ' 
                       GU-Content-Length-Actual.        
           display '   Expected Value Received: ' 
                   GU-Expected-value-string
                                       (1:GU-Content-Length-Expected).
           display '   Content Length (Expected): ' 
                       GU-Content-Length-Expected.         
           display ' '.
           
       1100-Show-Values-String-Exit.
           Exit.  

           
           end program GUANESTR.
