       identification division.
       program-id. GUnit.
           
       environment division.
       configuration section.
           
       data division.
       working-storage section.

       linkage section.   
       01  test-result               pic x(5).
           88  Test-Passed      value 'True'.
           88  Test-Failed      value 'False'.

       01  show-values-switch         pic x(5).
           88  Show-Values      value 'Yes'.
           88  Not-Show-Values  value 'No'.

       01  expected-value-comp  comp-2.
       01  actual-value-comp    comp-2.

       01 expected-value-string pic x(100).
       01 actual-value-string   pic x(100).   

       01 test-length           pic s9(9) comp.   

       procedure division.

           entry 'AssertEquals-Numeric' using expected-value-comp
                                           actual-value-comp
                                           test-result
                                           show-values-switch.
           display "Show Values: " show-values-switch                                     
           if Show-Values
               display '------ AssertEquals ----------------'
               display ' expected: ' expected-value-comp
               display '   actual: ' actual-value-comp.
               display '-------------------------------------'.            

           if(expected-value-comp equal actual-value-comp)
             set Test-Passed to True
           else
             set Test-Failed to True
           end-if.
           goback.

           entry 'AssertNotEquals-Numeric' using expected-value-comp
                                              actual-value-comp
                                              test-result
                                              show-values-switch.
           display "Show Values: " show-values-switch     
           if Show-Values
               display '------ AssertNotEquals --------------'
               display ' expected: ' expected-value-comp
               display '   actual: ' actual-value-comp.
               display '-------------------------------------'. 
      
           if(expected-value-comp not equal actual-value-comp)
             set Test-Passed to True
           else
             set Test-Failed to True
           end-if.

           goback.

           entry 'AssertEquals-String' using expected-value-string
                                             actual-value-string
                                             test-length
                                             test-result
                                             show-values-switch.

           display "Show Values: " show-values-switch                                  

           if Show-Values
               display '------ AssertEquals ----------------'
               display ' expected: ' 
                         expected-value-string(1:test-length)
               display '   actual: ' 
                         actual-value-string(1:test-length)
                display '  length: ' test-length.          
               display '-------------------------------------'.            

           if expected-value-string(1:test-length)
                            equal actual-value-string(1:test-length)
             set Test-Passed to True
           else
             set Test-Failed to True
           end-if.
           goback.
 

            entry 'AssertNotEquals-String' using expected-value-string
                                                 actual-value-string
                                                 test-length
                                                 test-result
                                                 show-values-switch.

           if Show-Values
               display '------ AssertNotEquals ----------------'
               display ' expected: ' 
                         expected-value-string(1:test-length)
               display '   actual: ' 
                         actual-value-string(1:test-length)
               display '  length: ' test-length.          
               display '-------------------------------------'            
           end-if.
           
           if expected-value-string(1:test-length)
                            not equal actual-value-string(1:test-length)
             set Test-Passed to True
           else
             set Test-Failed to True
           end-if.
           goback.
           
          