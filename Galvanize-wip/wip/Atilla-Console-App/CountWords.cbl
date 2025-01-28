       Identification division.
       Program-id. CountWords.

       Data Division.
       Working-Storage section.

        01 WS-Sentence              Pic x(200).

        01 WS-Remainder-of-Sentence Pic x(200).

        01 WS-Max-Number-Words-Expected   Pic s9(9) value 100.
        
        01 WS-Number-Of-Words-Found       Pic s9(9) value 0.
           88 No-Words-Found-In-Sentence   Value 0.
           88 Words-Were-Found-In-Sentence Value 1 Thru 100.
           
        01 WS-Word-Char-Count  Pic 9(4).

      * Note: The longest word in the English language is:
      *      pneumonoultramicroscopicsilicovolcanoconiosis
      *      which has 45 letters  
        01 WS-Words-In-Sentence-Table.         
           05 WS-Words-In-Sentence   Pic x(45)
                       Occurs 1 to 100 times
                       Depending on WS-Max-Number-Words-Expected
                       Indexed by Sentence-Word-Number.

        01 WS-Word-Pointer         Pic S9(9)  comp.  

        01 WS-Process-Sentence-Switch              Pic X.
           88 All-Words-In-Sentence-Processed      Value 'Y'.
           88 Not-All-Words-In-Sentence-Processed  Value 'N'.

        01 WS-Word-Count-Line-Out.
           05 Filler              Pic x(13)   Value "Word Count:".  
           05 Filler              Pic x(2)    Value Spaces.
           05 WS-Word-Count-Out   Pic zzz9. 

        01 WS-Word-Line-Out.
           05 Filler              Pic x(13)   Value "Word #".  
           05 WS-Word-Number-Out  Pic zz9.
           05 Filler              Pic x(2)    Value Spaces.
           05 WS-Word-Out         Pic X(50).

       Procedure Division.
            
           Display 'Enter a line separated by spaces:'. 
           Accept WS-Sentence.
           
           Set Not-All-Words-In-Sentence-Processed to true.

           Move 1 to WS-Word-Pointer

           Move WS-Sentence to WS-Remainder-of-Sentence.

           PERFORM VARYING Sentence-Word-Number FROM 1 BY 1     
                   UNTIL All-Words-In-Sentence-Processed 
                      or  (Sentence-Word-Number 
                        > WS-Max-Number-Words-Expected)
                      or (Sentence-Word-Number > 1 
                      And WS-Words-In-Sentence(Sentence-Word-Number - 1)
                          = spaces)      

              UNSTRING WS-Sentence
                       DELIMITED BY Space 
                       INTO WS-Words-In-Sentence(Sentence-Word-Number)                     
                       WITH POINTER WS-Word-Pointer 
                    not on overflow Set All-Words-In-Sentence-Processed
                                     to true  
              END-UNSTRING
             
           End-perform.
          
           compute WS-Number-Of-Words-Found = Sentence-Word-Number - 2.
          
           Move WS-Number-Of-Words-Found to WS-Word-Count-Out
           Display ' '.
           Display WS-Word-Count-Line-Out

            Perform varying Sentence-Word-Number
                       from 1 by 1
                      until (Sentence-Word-Number 
                           > WS-Number-Of-Words-Found)
               
                Move Sentence-Word-Number to WS-Word-Number-Out
                Move WS-Words-In-Sentence(Sentence-Word-Number)
                  to WS-Word-Out
                Display WS-Word-Line-Out  

           End-perform.    

           goback.
       