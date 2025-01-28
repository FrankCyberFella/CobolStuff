           identification division.
           program-id. LeapYear.
           
           environment division.
           configuration section.
           
           data division.
           working-storage section.

           01 ws-year     pic s9(4).
           01 ws-quotient pic s9(4).

           01 divisible-by-4 pic s9(4).
              88 is-divisible-by-4     value 0.

           01 divisible-by-100 pic s9(4).
              88 is-divisible-by-100   value 0.

           01 divisible-by-400 pic s9(4).
              88 is-divisible-by-400   value 0.
           
           procedure division.
           
           perform 5 times 
               display 'Enter Year: '
               Accept ws-year  

               divide ws-year by 4   giving ws-quotient
                                     remainder divisible-by-4

               divide ws-year by 100 giving ws-quotient
                                     remainder divisible-by-100

               divide ws-year by 400 giving ws-quotient
                                     remainder divisible-by-400

               If (is-divisible-by-4 and Not is-divisible-by-100)
                or is-divisible-by-400

                  display 'Its a Leap Year'

               else
                  display 'Its NOT a Leap Year'
               end-if     
           end-perform.
           goback.
           
      