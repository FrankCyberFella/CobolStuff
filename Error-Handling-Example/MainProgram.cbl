       *> gnuCOBOL compile command: 
       *>
       *>   cobc -x MainProgram.cbl CalledProgram.cbl 

       *> To Run: ./MainProgram 
       
       identification division.
       program-id. mainProgram.
           
       data division.
       working-storage section.
           copy 'SharedData.cpy'.
           
       procedure division.
      
           Move 11 to Number-1.
           Move 9 to Number-2.
           
           Perform 1000-Call-The-Program. *> No error

                 
           Move 11 to Number-1.
           Move 99 to Number-2.
           
           Perform 1000-Call-The-Program. *> Size Error

           goback.

       1000-Call-The-Program.
           
           Call 'CallMe' using Shared-Data.

           if Success
              Display ' '
              Display Number-1 ' * ' Number-2 ' is ' Result
           else
              display ' '
              Display '!!! Uh-Oh Uh-Oh Uh-OH !!!'
              Display 'Error in "CallMe"'  
           
              Display 'Error Code: ' Error-Code
              Display 'Error Message: ' function trim(Error-Message)
              Display 'Result: ' Result
           end-if.   
           
       1000-Exit.
           Exit.     
 
           
      