       Identification Division.
       Program-id. CountWords.

       Data Division.
       Working-Storage Section.
      *****************************************************************
      * Field to hold input from the user
      *****************************************************************
        01 WS-Sentence              Pic x(200).

      *****************************************************************
      * Constant to indicate maximum number of words exepected
      * (200 characters divided by 2 - min word size: 1 char + space
      *****************************************************************
        01 WS-Max-Number-Words-Expected   Pic s9(9) value 100.

      *****************************************************************
      * Field to hold number of words found in the sentence with
      * condition-names to assist in examining the  when processing
      *****************************************************************  
        01 WS-Number-Of-Words-Found       Pic s9(9) value 0.
           88 No-Words-Found-In-Sentence   Value 0.
           88 Words-Were-Found-In-Sentence Value 1 Thru 100.

      
      *****************************************************************
      * Table to hold words found in sentence
      *
      * Note: The longest word in the English language is:
      *      pneumonoultramicroscopicsilicovolcanoconiosis
      *      which has 45 letters  
      *
      * Occurs/Depending on was used for issultrative purposes
      *****************************************************************  
        01 WS-Words-In-Sentence-Table.         
           05 WS-Words-In-Sentence   Pic x(45)
                       Occurs 1 to 100 times
                       Depending on WS-Max-Number-Words-Expected
                       Indexed by Sentence-Word-Number.

      *****************************************************************
      * Pointer used in UNSTRING to keep track of where it is
      * (contains position of where it should start looking 
      *                                                  for delimiter)
      *****************************************************************
        01 WS-Word-Pointer         Pic S9(9)  comp.  

      *****************************************************************
      * Field used as a switch to control loop when processing sentence 
      * with condition-names to assist is examining the field when 
      * processing
      ***************************************************************** 
        01 WS-Process-Sentence-Switch              Pic X.
           88 All-Words-In-Sentence-Processed      Value 'Y'.
           88 Not-All-Words-In-Sentence-Processed  Value 'N'.

      *****************************************************************
      * Output line for displaying number of words found
      *****************************************************************
        01 WS-Word-Count-Line-Out.
           05 Filler              Pic x(13)   Value "Word Count:".  
           05 Filler              Pic x(2)    Value Spaces.
           05 WS-Word-Count-Out   Pic zzz9. 

      *****************************************************************
      * Output line for displaying each word found
      *****************************************************************
        01 WS-Word-Line-Out.
           05 Filler              Pic x(7)   Value "Word #".  
           05 WS-Word-Number-Out  Pic zz9.
           05 Filler              Pic x(2)    Value Spaces.
           05 WS-Word-Out         Pic X(45).

      *****************************************************************
      * This code is unrelated to the process but was added to address
      * question from  JB
      *****************************************************************
        01 numeric-field     pic s9(4)   value 1000.

        01 numeric-field-out pic ++++9.99.

        01 numeric-field-char  pic x(10) justified right.
      *****************************************************************
      * End of unrelated code
      *****************************************************************
       Procedure Division.

      *****************************************************************
      * Ask the user for a line of input
      *****************************************************************      
           Display 'Enter a line separated by spaces:'. 
           Accept WS-Sentence.

      *****************************************************************
      * Set loop control switch to indicate we should start processing
      *****************************************************************      
           Set Not-All-Words-In-Sentence-Processed to true.
      *****************************************************************
      * Tell UNSTRING to start at position 1 of the sentence
      ***************************************************************** 
           Move 1 to WS-Word-Pointer.
      *
      *****************************************************************
      * Loop through the sentence one word at a time until: 
      *
      *    1. All words in the sentence are processed or 
      *    2. We have filled the table holding the words or
      *    3. We have at least one word and the previous word
      *             is not all spaces indicating no more words are
      *                               in the sentence
      *
      * Each time through the loop:
      *
      *    1. Have UNSTRING find the next space in the sentence
      *       starting at the position in the WS-Word-Pointer POINTER.
      *       (UNSTRING will update WS-WORD-Pointer to the position
      *                 after the space it found automagically)
      *
      *    2. UNSTRING will move the word it found into the 
      *       WS-Words-In-Sentence table using Sentence-Word_Numeber
      *       as the index into WS-Words-In-Sentence table.
      *
      *    3. The "NOT ON OVERFLOW" clause says in effect:
      *       When UNSTRING reaches the end of the sentence,
      *            Set the loop control switch to end the loop.     
      *****************************************************************
           PERFORM VARYING Sentence-Word-Number FROM 1 BY 1     
                   UNTIL All-Words-In-Sentence-Processed 
                      or  (Sentence-Word-Number 
                        > WS-Max-Number-Words-Expected)
                      or (Sentence-Word-Number > 1 
                      And WS-Words-In-Sentence(Sentence-Word-Number - 1)
                          = spaces)      
      *  WITH POINTER option in UNSTRING tells it at what position
      *  IN the string it should start
      *  UNSTRING keeps track of where it is in the pointer
              UNSTRING WS-Sentence
                       DELIMITED BY Space 
                       INTO WS-Words-In-Sentence(Sentence-Word-Number)                     
                       WITH POINTER WS-Word-Pointer 
                     NOT ON OVERFLOW Set All-Words-In-Sentence-Processed
                                     to true  
              END-UNSTRING
             
           End-perform.
      *****************************************************************
      * Upon exit from the loop Sentence-Word-Number will contain
      * a value equal to the number of words that were found +2
      *
      *  +2 is caused by the index being incremented before the test(s)
      *               are done and the final "word" in the sentence
      *               will be all spaces.
      *
      *!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      *  Notice for Atilla: 
      *
      *    There is flaw in this logic if the sentence fills the entire
      *    input field that may cause us to lose the last word.
      *    
      *    At this juncture, I don't have time to fix that yet.
      *!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
      *
      * Calculate number of words found by subtracting 2 from the index
      *****************************************************************   
           compute WS-Number-Of-Words-Found = Sentence-Word-Number - 2.

      *****************************************************************
      * Populate the output line for number of words found and Display
      *****************************************************************    
           Move WS-Number-Of-Words-Found to WS-Word-Count-Out
           Display ' '.
           Display WS-Word-Count-Line-Out

      *****************************************************************
      * Loop through the table of words found and display each one
      *****************************************************************    
            Perform varying Sentence-Word-Number
                       from 1 by 1
                      until (Sentence-Word-Number 
                           > WS-Number-Of-Words-Found)
      *****************************************************************
      * Populate the output line showing found word and Display
      *****************************************************************             
                Move Sentence-Word-Number to WS-Word-Number-Out
                Move WS-Words-In-Sentence(Sentence-Word-Number)
                  to WS-Word-Out
                Display WS-Word-Line-Out  

           End-perform.    

      *****************************************************************
      * This code is unrelated to the process but was added to address
      * question from JB
      *****************************************************************
           Display ' '.
           Display '---- Start of JB instigated code -----'
           Display ' '.
           move numeric-field to numeric-field-out.
           display "Numeric value is: " numeric-field-out.

           move numeric-field-out to numeric-field-char.
           display "Numeric value is char: " numeric-field-char.
      *****************************************************************
      * End of unrelated code
      *****************************************************************
           Goback.
       