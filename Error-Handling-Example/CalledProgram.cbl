       identification division.
       program-id. calledpgm.
           
       data division.
       working-storage section.

       Linkage Section.
           copy SharedData.cpy.
           
       procedure division.

           Set Success to true. 
           
           Entry 'CallMe' using Shared-Data.

           compute Result = Number-1 * Number-2
                on size error 
                   String 'Computed value too large '
                          ' for receiving field. Setting value to 0'
                           into Error-Message
                   Set Overflow-Error to True.

            
           goback.
           
       end program calledpgm.
