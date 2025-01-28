       Identification Division.
       Program-id. GUnit.
           
       Environment Division.
           
       Data Division.
       Working-Storage Section.

        01 Number-of-Trailing-Spaces      Pic s9(9)   comp.

       Linkage Section. 
      * Include the COBOL code in the GUnit-Test-Fields copy book 
      * .cpy extension is optional
           copy GUnit-Test-Fields.

       Procedure Division.

           Entry 'AssertEquals-Numeric' using GUnit-Test-Fields.

           if Show-Values
               display ' '
               display '--- AssertEquals-Numeric ----------------'
               display '  Actual Received: 'Actual-Value-Numeric  
               display 'Expected Received: 'Expected-Value-Numeric
               display ' '
           end-if.               
          
           if(Actual-Value-Numeric equal Expected-Value-Numeric)
             set Test-Passed to True
           else
             set Test-Failed to True
           end-if.

           goback.

           Entry 'AssertNotEquals-Numeric' using GUnit-Test-Fields.

           if Show-Values
               display ' '
               display '--- AssertNotEquals-Numeric --------------'
               display '     Actual Received: ' Actual-Value-Numeric
               display '   Expected Received: ' Expected-Value-Numeric
               display ' '
           end-if.     
      
           if(Actual-Value-Numeric not equal Expected-Value-Numeric)
             set Test-Passed to True
           else
             set Test-Failed to True
           end-if.

           goback.

           entry 'AssertEquals-String' using GUnit-Test-Fields.
         
           Perform 1000-Determine-Content-Lengths
              thru 1000-Determine-Content-Lengths-Exit    
           
           if Show-Values
              display ' '
              display '-- AssertEquals-String ---------------------'
              Perform 1100-Show-Values-String
                 thru 1100-Show-Values-String-Exit
           end-if.                

           if Actual-value-string(1:Content-Length-Actual) equal 
              Expected-value-string(1:Content-Length-Expected)
              set Test-Passed to True
           else
              set Test-Failed to True
           end-if.

           goback.
 

           entry 'AssertNotEquals-String' using GUnit-Test-Fields.

           Perform 1000-Determine-Content-Lengths
              thru 1000-Determine-Content-Lengths-Exit    

           if Show-Values
               display ' '
               display '-- AssertNotEquals-String ------------------'
               Perform 1100-Show-Values-String
                  thru 1100-Show-Values-String-Exit
           end-if.                

           if Actual-value-string(1:Content-Length-Actual) equal 
              Expected-value-string(1:Content-Length-Expected)
              set Test-Failed to True
           else
              set Test-Passed to True
           end-if.

           goback.

       1000-Determine-Content-Lengths.

           Move 0 to Number-of-Trailing-Spaces.

           Inspect Expected-Value-String
               TALLYING  Number-of-Trailing-Spaces
               FOR Trailing ' '.                    

           compute Content-Length-Expected = 
                                     Length of Expected-Value-String 
                                   - Number-of-Trailing-Spaces.
      
           Move 0 to Number-of-Trailing-Spaces.                          
           
           Inspect Actual-value-string
             TALLYING  Number-of-Trailing-Spaces
                FOR TRAILING Spaces.     

           compute Content-Length-Actual = 
                Length of Actual-Value-String 
                        - Number-of-Trailing-Spaces.             

           If Content-Length-Expected equals Content-Length-Actual
              Set Content-Lengths-Match to True
           else
              Set Content-Lengths-Do-Not-Match to True       
           End-if.

       1000-Determine-Content-Lengths-Exit.
         Exit.

       1100-Show-Values-String.
     
           display '     Actual Value Received: ' 
                   Actual-value-string(1:Content-Length-Actual).
           display '   Content Length (Actual): ' 
                       Content-Length-Actual.        
           display '   Expected Value Received: ' 
                   Expected-value-string(1:Content-Length-Expected).
           display '   Content Length (Expected): ' 
                       Content-Length-Expected.         
           display ' '.
           
       1100-Show-Values-String-Exit.
           Exit.  
           