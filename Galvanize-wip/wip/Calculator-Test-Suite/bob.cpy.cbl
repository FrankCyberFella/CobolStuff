01 TS-Test-Number-Chars pic X(255).
        01 TS-Test-Description  pic X(255).
        01 TS-Test-Number-Out   pic zz9.
        01 TS-Test-Result-Table.
           05 TS-Test-Result  occurs 500 times  
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
        01 TS-Number-Tests-Performed  pic s9(3) comp value 0. 
        01 TS-Number-Tests-Passed     Pic s9(3) comp-3.
        01 TS-Number-Tests-Failed     Pic s9(3) comp-3.   
      
