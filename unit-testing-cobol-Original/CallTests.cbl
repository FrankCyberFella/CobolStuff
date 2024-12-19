       identification division.
       program-id. CallTests.
       environment division.
       data division.
       working-storage section.

       01  Test-Result             Pic x(5).
           88  Test-Passed      value 'True'.
           88  Test-Failed      value 'False'.

       01  show-values-switch         pic x(5).
           88  Show-Values      value 'Yes'.
           88  Not-Show-Values  value 'No'.    

       01  Float-Expected-4-byte  comp-1   value 10.
       01  Float-Actual-4-byte    comp-1   value 10.

       01  Float-Expected-8-byte  comp-2   value 10.
       01  Float-Actual-8-byte    comp-2   value 10.

       01  Comp-S-Expected-4-byte  Pic s9(9) comp   value 10.
       01  Comp-S-Actual-4-byte    Pic s9(9) comp   value 10.

       01  Comp-S-Expected-2-byte  Pic s9(4) comp   value 10.
       01  Comp-S-Actual-2-byte    Pic s9(4) comp   value 10.

       01  Comp-S-Expected-8-byte  Pic s9(18) comp   value 10.
       01  Comp-S-Actual-8-byte    Pic s9(18) comp   value 10.

       01  Comp-3-S-Expected       Pic s9(9)  comp-3 value 10.
       01  Comp-3-S-Actual         Pic s9(9)  comp-3 value 10.

       01  Comp-U-Expected-4-byte  Pic 9(9)   comp   value 10.
       01  Comp-U-Actual-4-byte    Pic 9(9)   comp   value 10.

       01  Comp-U-Expected-2-byte  Pic 9(4)   comp   value 10.
       01  Comp-U-Actual-2-byte    Pic 9(4)   comp   value 10.

       01  Comp-U-Expected-8-byte  Pic 9(18)  comp   value 10.
       01  Comp-U-Actual-8-byte    Pic 9(18)  comp   value 10.

       01  Comp-3-U-Expected   Pic 9(9)       comp-3   value 10.
       01  Comp-3-U-Actual     Pic 9(9)       comp-3   value 10.

       01  Disp-NM-S-Expected   Pic S9(9)              value +10.
       01  Disp-NM-S-Actual     Pic S9(9)              value +10.

       01  Disp-NM-U-Expected   Pic 9(9)               value 10.
       01  Disp-NM-U-Actual     Pic 9(9)               value 10.

       01  String-Expected-Value pic x(20)    value 'Frank'.
       01  String-Actual-Value   pic x(20)    value 'Frank'.

       01  String-length         pic s9(9) comp.
'
       procedure division.

           Perform 0000-Initialize-Test-Fields
              thru 0000-Initialize-Test-Fields-Exit.
               
           Display '---- Starting call tests       ----'.
      *****************************************************************
           display ' '.
           Display '-- Testing Pic s9(9) comp to Pic s9(9) comp --'. 
           Display '-- equal values                             --'.
           
           Perform 0000-Initialize-Test-Fields. 
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-S-Expected-4-byte
                                          Comp-S-Actual-4-byte
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-4-byte
                                             Comp-S-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic s9(9) comp to Pic s9(9) comp --'.
           Display '-- unequal values                           --'.


           Perform 0000-Initialize-Test-Fields. 
           Set Not-Show-Values to true.

           Move 0 to Comp-S-Actual-4-byte;

           call 'AssertEquals-Numeric' using Comp-S-Expected-4-byte
                                          Comp-S-Actual-4-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-4-byte
                                             Comp-S-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
           
      *****************************************************************
           display ' '.
           Display '-- Testing Pic s9(4) comp to Pic s9(4) comp --'. 
           Display '-- equal values                             --'.

           Perform 0000-Initialize-Test-Fields. 
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-S-Expected-2-byte
                                          Comp-S-Actual-2-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-2-byte
                                             Comp-S-Actual-2-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic s9(4) comp to Pic s9(4) comp --'.
           Display '-- unequal values                           --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-S-Actual-2-byte;
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-S-Expected-2-byte
                                          Comp-S-Actual-2-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-2-byte
                                             Comp-S-Actual-2-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 

      *****************************************************************
           display ' '.
           Display '-- Testing Pic s9(18) comp to Pic s9(18) comp --'. 
           Display '-- equal values                               --'.

           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-S-Expected-8-byte
                                          Comp-S-Actual-8-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-8-byte
                                             Comp-S-Actual-8-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic s9(18) comp to Pic s9(18) comp --'.
           Display '-- unequal values                             --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-S-Actual-8-byte;
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-S-Expected-8-byte
                                          Comp-S-Actual-8-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-8-byte
                                             Comp-S-Actual-8-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 

      *****************************************************************
           display ' '.
           Display '-- Testing Pic s9(4) comp to Pic s9(9) comp --'. 
           Display '-- equal values                             --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-S-Expected-2-byte
                                          Comp-S-Actual-4-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-2-byte
                                             Comp-S-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic s9(4) comp to Pic s9(9) comp --'.
           Display '-- unequal values                           --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-S-Actual-2-byte;
           Set Not-Show-Values to true.
           
           call 'AssertEquals-Numeric' using Comp-S-Expected-2-byte
                                          Comp-S-Actual-4-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-S-Expected-2-byte
                                             Comp-S-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
           
      *****************************************************************     
           display ' '.
           Display '-- Testing Pic s9(9) comp-3 to Pic s9(9) comp-3 --'.
           Display '-- equal values                                 --'.

           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-3-S-Expected
                                          Comp-3-S-Actual
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-3-S-Expected
                                             Comp-3-S-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic s(9) comp-3 to Pic s9(9) comp-3 --'.
           Display '-- unequal values                              --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-3-S-Actual;
           Set Not-Show-Values to true.
           

           call 'AssertEquals-Numeric' using Comp-3-S-Expected
                                          Comp-3-S-Actual
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                
 
           call 'AssertNotEquals-Numeric' using Comp-3-S-Expected
                                             Comp-3-S-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 


      *****************************************************************
           display ' '.
           Display '-- Testing Pic 9(9) comp to Pic 9(9) comp --'. 
           Display '-- equal values                            --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-U-Expected-4-byte
                                          Comp-U-Actual-4-byte
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-4-byte
                                             Comp-U-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic 9(9) comp to Pic 9(9) comp --'.
           Display '-- unequal values                          --'.

           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           Move 0 to Comp-U-Actual-4-byte;

           call 'AssertEquals-Numeric' using Comp-U-Expected-4-byte
                                          Comp-U-Actual-4-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-4-byte
                                             Comp-U-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
           
      *****************************************************************
           display ' '.
           Display '-- Testing Pic 9(4) comp to Pic 9(4) comp --'. 
           Display '-- equal values                            --'.

           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-U-Expected-2-byte
                                          Comp-U-Actual-2-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-2-byte
                                             Comp-U-Actual-2-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic 9(4) comp to Pic s9(4) comp --'.
           Display '-- unequal values                          --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-U-Actual-2-byte;
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-U-Expected-2-byte
                                          Comp-U-Actual-2-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-2-byte
                                             Comp-U-Actual-2-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 

      *****************************************************************
           display ' '.
           Display '-- Testing Pic 9(18) comp to Pic 9(18) comp --'. 
           Display '-- equal values                             --'.

           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-U-Expected-8-byte
                                          Comp-U-Actual-8-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-8-byte
                                             Comp-U-Actual-8-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic 9(18) comp to Pic 9(18) comp --'.
           Display '-- unequal values                           --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-U-Actual-8-byte.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-U-Expected-8-byte
                                          Comp-U-Actual-8-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-8-byte
                                             Comp-U-Actual-8-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 

      *****************************************************************
           display ' '.
           Display '-- Testing Pic 9(4) comp to Pic s9(9) comp --'. 
           Display '-- equal values                            --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-U-Expected-2-byte
                                          Comp-U-Actual-4-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-2-byte
                                             Comp-U-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic 9(4) comp to Pic s9(9) comp --'.
           Display '-- unequal values                          --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-U-Actual-2-byte.
           Set Not-Show-Values to true.
           
           call 'AssertEquals-Numeric' using Comp-U-Expected-2-byte
                                          Comp-U-Actual-4-byte
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-U-Expected-2-byte
                                             Comp-U-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
           
      *****************************************************************     
           display ' '.
           Display '-- Testing Pic 9(9) comp-3 to Pic 9(9) comp-3 --'.
           Display '-- equal values                                --'.

           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Comp-3-U-Expected
                                          Comp-3-U-Actual
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Comp-3-U-Expected
                                             Comp-3-U-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           Display ' '.
           Display '-- Testing Pic 9(9) comp-3 to Pic 9(9) comp-3  --'.
           Display '-- unequal values                              --'.

           Perform 0000-Initialize-Test-Fields.
           Move 0 to Comp-3-U-Actual;
           Set Not-Show-Values to true.



           call 'AssertEquals-Numeric' using Comp-3-U-Expected
                                          Comp-3-U-Actual
                                          Test-Result
                                          show-values-switch.

           display '   AssertEquals result: ' Test-Result.                                
 
           call 'AssertNotEquals-Numeric' using Comp-3-U-Expected
                                             Comp-3-U-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 

      *****************************************************************
           display ' '.
           Display '-- Testing Comp-1 to Comp-1                 --'. 
           Display '-- equal values                             --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Float-Expected-4-byte
                                          Float-Actual-4-byte
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Float-Expected-4-byte
                                             Float-Actual-4-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           display ' '.
           Display '-- Testing Comp-2 to Comp-2                 --'. 
           Display '-- equal values                             --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Float-Expected-8-byte
                                          Float-Actual-8-byte
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Float-Expected-8-byte
                                             Float-Actual-8-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           display ' '.
           Display '-- Testing Comp-2 to Comp-2                 --'. 
           Display '-- unequal values                           --'.
           
           Perform 0000-Initialize-Test-Fields.
           move 0 to Float-Actual-8-byte.
           Set Not-Show-Values to true.

          

           call 'AssertEquals-Numeric' using Float-Expected-8-byte
                                          Float-Actual-8-byte
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Float-Expected-8-byte
                                             Float-Actual-8-byte
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           display ' '.
           Display '-- Testing Disp-NM-S to Disp-NM-S           --'. 
           Display '-- equal values                             --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Disp-NM-S-Expected
                                          Disp-NM-S-Actual
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Disp-NM-S-Expected
                                             Disp-NM-S-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           display ' '.
           Display '-- Testing Disp-NM-S to Disp-NM-S           --'. 
           Display '-- unequal values                           --'.
           
           Perform 0000-Initialize-Test-Fields.
           move 0 to Disp-NM-S-Actual.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Disp-NM-S-Expected
                                          Disp-NM-S-Actual
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Disp-NM-S-Expected
                                             Disp-NM-S-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 

      *****************************************************************
      *****************************************************************
           display ' '.
           Display '-- Testing Disp-NM-U to Disp-NM-U           --'. 
           Display '-- equal values                             --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Disp-NM-U-Expected
                                          Disp-NM-U-Actual
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Disp-NM-U-Expected
                                             Disp-NM-U-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 
      *****************************************************************
           display ' '.
           Display '-- Testing Disp-NM-U to Disp-NM-U           --'. 
           Display '-- unequal values                           --'.
           
           Perform 0000-Initialize-Test-Fields.
           move 0 to Disp-NM-U-Actual.
           Set Not-Show-Values to true.

           call 'AssertEquals-Numeric' using Disp-NM-U-Expected
                                          Disp-NM-U-Actual
                                          Test-Result
                                          show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-Numeric' using Disp-NM-U-Expected
                                             Disp-NM-U-Actual
                                             Test-Result
                                             show-values-switch.

           display 'AssertNotEquals result: ' Test-Result. 

      *****************************************************************
           display ' '.
           Display '-- Testing string to string - same size     --'. 
           Display '-- equal values                             --'.
           
           Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.

           display 'Length: ' LENGTH of String-Expected-Value.
           move length of String-Expected-Value to String-length

           call 'AssertEquals-String' using String-Expected-Value
                                            String-Actual-Value
                                            String-length
                                            Test-Result
                                            show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-String' using String-Expected-Value
                                               String-Actual-Value
                                               String-length     
                                               Test-Result
                                               show-values-switch.

           display '   AssertNotEquals result: ' Test-Result.                                       
      *****************************************************************
           display ' '.
           Display '-- Testing string to string - same size     --'. 
           Display '-- unequal values                           --'.
          
          Perform 0000-Initialize-Test-Fields.
           Set Not-Show-Values to true.
           move 'David' to String-Actual-Value.

           display 'Length: ' LENGTH of String-Expected-Value.
           move length of String-Expected-Value to String-length
            
           call 'AssertEquals-String' using String-Expected-Value
                                            String-Actual-Value
                                            String-length
                                            Test-Result
                                            show-values-switch,

           display '   AssertEquals result: ' Test-Result.                                

           call 'AssertNotEquals-String' using String-Expected-Value
                                               String-Actual-Value
                                               String-length     
                                               Test-Result
                                               show-values-switch.

             display 'AssertNotEquals result: ' Test-Result.                                       
      *****************************************************************


           Display '---- End of call tests -----'.
           
           Goback.


       0000-Initialize-Test-Fields.

           Move 99 to Float-Expected-4-byte.
           Move 99 to Float-Actual-4-byte.

           Move 99 to Float-Expected-8-byte.
           Move 99 to Float-Actual-8-byte.          

           Move 99 to Comp-S-Expected-2-byte.
           Move 99 to Comp-S-Actual-2-byte.
           
           Move 99 to Comp-S-Expected-4-byte.
           Move 99 to Comp-S-Actual-4-byte. 

           Move 99 to Comp-S-Expected-8-byte.
           Move 99 to Comp-S-Actual-8-byte.
           
           Move 99 to Comp-U-Expected-2-byte.
           Move 99 to Comp-U-Actual-2-byte. 

           Move 99 to Comp-U-Expected-4-byte.
           Move 99 to Comp-U-Actual-4-byte.
           
           Move 99 to Comp-U-Expected-8-byte.
           Move 99 to Comp-U-Actual-8-byte.  

           Move 99 to Comp-3-U-Expected.
           Move 99 to Comp-3-U-Actual.

           Move 99 to Comp-3-S-Expected.
           Move 99 to Comp-3-S-Actual.   

           Move 99 to Disp-NM-S-Expected.
           Move 99 to Disp-NM-S-Actual. 

           Move 99 to Disp-NM-U-Expected.
           Move 99 to Disp-NM-U-Actual.    

           Move 'Frank' to String-Actual-Value.
           Move 'Frank' to String-Expected-Value.



       0000-Initialize-Test-Fields-Exit.
           Exit. 
    