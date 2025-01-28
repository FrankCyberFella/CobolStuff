       Identification Division.
       Program-id. GUnit.
           
       Environment Division.
           
       Data Division.
       Working-Storage Section.

        01 Number-of-Trailing-Spaces      Pic s9(9)   comp.

       Linkage Section. 
      * Include the COBOL code in the GUnit-Test-Fields copy book 
      * .cpy extension is optional
           copy '../copybooks/GUnitFld.cpy'.

       Procedure Division.

           Entry 'GU-Initialize-Default-Values' using GUnit-Test-Fields.
          
           Set GU-Test-Failed                  to True.
           Set GU-Do-Not-Show-Values           to True.
           Set GU-Content-Lengths-Do-Not-Match to True.
             Set GU-Use-Content-Length           to True.
             Initialize GU-Actual-Value-Numeric
                        GU-Expected-Value-Numeric
                        GU-Actual-Value-String
                        GU-Expected-Value-String
                        GU-Content-Length-Expected
                        GU-Content-Length-Actual
                        GU-Test-Length.
           Goback.

           Entry 'GU-AssertEquals-Numeric' using GUnit-Test-Fields.

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

           Entry 'GU-AssertNotEquals-Numeric' using GUnit-Test-Fields.

           if GU-Show-Values
               display ' '
               display '--- AssertNotEquals-Numeric --------------'
               Perform 1200-Show-Values-Numeric
           end-if.     
      
           if(GU-Actual-Value-Numeric not = GU-Expected-Value-Numeric)
             set GU-Test-Passed to True
           else
             set GU-Test-Failed to True
           end-if.

           goback.

           entry 'GU-AssertEquals-String' using GUnit-Test-Fields.
         
           Perform 1000-Determine-Content-Lengths
              thru 1000-Determine-Content-Lengths-Exit    
           
           if GU-Show-Values
              display ' '
              display '-- AssertEquals-String ---------------------'
              Perform 1100-Show-Values-String
                 thru 1100-Show-Values-String-Exit
           end-if.                

           if GU-Actual-value-string(1:GU-Content-Length-Actual) equal 
              GU-Expected-value-string(1:GU-Content-Length-Expected)
              set GU-Test-Passed to True
           else
              set GU-Test-Failed to True
           end-if.

           goback.
 

           entry 'GU-AssertNotEquals-String' using GUnit-Test-Fields.

           Perform 1000-Determine-Content-Lengths
              thru 1000-Determine-Content-Lengths-Exit    

           if GU-Show-Values
               display ' '
               display '-- AssertNotEquals-String ------------------'
               Perform 1100-Show-Values-String
                  thru 1100-Show-Values-String-Exit
           end-if.                

           if GU-Actual-value-string(1:GU-Content-Length-Actual) equal 
              GU-Expected-value-string
                    (1:GU-Content-Length-Expected)
              set GU-Test-Failed to True
           else
              set GU-Test-Passed to True
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
           
       1200-Show-Values-Numeric.
           display '     Actual Received: ' GU-Actual-Value-Numeric.
           display '   Expected Received: ' GU-Expected-Value-Numeric.
           display ' '.   

       1200-Show-Values-Numeric-Exit.
           Exit.     

       end program GUnit.
