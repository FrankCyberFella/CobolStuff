       TS-Show-Results.
      *> Check test result returned by GUnit
      *> Process accordingly
           Display '---- Testing Complete -----'.
           Display ' '.
           perform varying Test-Result-Index from 1 by 1
           until Test-Result-Index > TS-Asserts-Performed 

               if TR-Test-Passed(Test-Result-index)
                  Move '.' 
                    to TS-Test-Summary-String-Table(Test-Result-Index)
               else
                    Move 'F' 
                    to TS-Test-Summary-String-Table(Test-Result-Index)
               end-if
           end-perform.  
      
           Display 'Test Summary: '. 
           Display function trim(TS-Test-Summary-String).
           Display ' '.

           Move TS-Asserts-Performed
             to TS-Asserts-Performed-Out.

           Move TS-Asserts-Passed
             to TS-Asserts-Passed-Out.

           Move TS-Asserts-Failed
             to TS-Asserts-Failed-Out.    

           Display 'Number asserts performed: ' 
                    TS-Asserts-Performed-Out.
           Display 'Number asserts passed: '    
                    TS-Asserts-Passed-Out.
           Display 'Number asserts failed: '    
                    TS-Asserts-Failed-Out.

           Display ' '. 
           
           perform varying Test-Result-Index from 1 by 1
                     until Test-Result-Index > TS-Asserts-Performed 

           if TR-Test-Failed(Test-Result-Index) 
               Display TS-Separator-Line
               Move Test-Result-Index to TS-Test-Number-Out 

               Display 'Test #' TS-Test-Number-Out ' Failed: ' 
                   function trim(TR-Test-Description(Test-Result-Index)) 
                                     
               Display 'Expected Number: ' 
                           TR-Expected-Value-Numeric(Test-Result-Index)
               Display '  Actual Number: ' 
                           TR-Actual-Value-Numeric(Test-Result-Index) 
               Display ' '
               Move TR-Expected-String-Len-Used(Test-Result-Index)
                 to TS-String-Length-Expected
               Display 'Expected String Length Used: ' 
                      TS-String-Length-Expected

               Display 'Expected String: ' 
                  function 
                   trim(TR-Expected-Value-String(Test-Result-Index))
               Display ' '
               Move TR-Actual-String-Len-Used(Test-Result-Index)
                 to TS-String-Length-Actual
               Display 'Actual String Length Used: ' 
                      TS-String-Length-Actual
    
               Display '  Actual String: ' 
                  function 
                     trim(TR-Actual-Value-String(Test-Result-Index))

           end-perform.

           Display ' '. 
           Display 'Test Summary: '. 
           Display function trim(TS-Test-Summary-String).

           Display ' '. 
           Display ' '.

       End-show-Results.
           exit.   