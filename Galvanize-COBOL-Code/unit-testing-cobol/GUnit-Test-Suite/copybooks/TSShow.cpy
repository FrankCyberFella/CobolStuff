       TS-Show-Results.
      * Check test result returned by GUnit
      * Process accordingly
           Display '---- Testing Complete -----'.
           Display ' '.
           perform varying Test-Result-Index from 1 by 1
           until Test-Result-Index > TS-Number-Tests-Performed 

               if TR-Test-Passed(Test-Result-index)
                   Display '.' with no advancing
               else
                   Display 'F' with no advancing
               end-if
           end-perform.  

           Display ' '. 
           Display ' '.

           Display 'Number tests performed: ' TS-Number-Tests-Performed.
           Display 'Number tests passed: '    TS-Number-Tests-Passed.
           Display 'Number tests failed: '    TS-Number-Tests-Failed.

           Display ' '. 
           
           perform varying Test-Result-Index from 1 by 1
                     until Test-Result-Index > TS-Number-Tests-Performed 

           if TR-Test-Failed(Test-Result-Index) 
            
               Move Test-Result-Index to TS-Test-Number-Out 
               display '  '
               Display 'Test #' TS-Test-Number-Out ' Failed: ' 
                   function trim(TR-Test-Description(Test-Result-Index)) 
                                     
               Display 'Expected Number: ' 
                           TR-Expected-Value-Numeric(Test-Result-Index)
               Display '  Actual Number: ' 
                           TR-Actual-Value-Numeric(Test-Result-Index) 

               Display 'Expected String Length Used: ' 
                      TR-Expected-String-Len-Used(Test-Result-Index)

               Display 'Expected String: ' 
                  function 
                   trim(TR-Expected-Value-String(Test-Result-Index))

               Display 'Actual String Length Used: ' 
                      TR-Actual-String-Len-Used(Test-Result-Index)
    
               Display '  Actual String: ' 
                  function 
                     trim(TR-Actual-Value-String(Test-Result-Index))

           end-perform.

           Display ' '.

           perform varying Test-Result-Index from 1 by 1
                     until Test-Result-Index > TS-Number-Tests-Performed 
           
               if TR-Test-Passed(Test-Result-index)
                   Display '.' with no advancing
               else
                   Display 'F' with no advancing
               end-if
           end-perform.  

           Display ' '. 
           Display ' '.

       End-show-Results.
           exit.   
           