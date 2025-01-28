       identification division.
       program-id. word-splitter.
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.
       01  words-table.
           05 word occurs 255 indexed by word-index pic x(255).
       01  current-word pic x(255).
       01  word-count pic 9(3).
       01  char-count pic 9(3).
       01  delim pic X VALUE SPACE.
       01  NEW-LINE pic X VALUE X'0A'.

       linkage section.
       01  result pic X(255).
       01  source-sentence.
           05  input-sentence occurs 255 
               indexed by sentence-index pic X.

       
       procedure division.

       entry 'split-words' using source-sentence, result.
           move 0 to word-count.
           move 0 to char-count.
           move SPACES to current-word.
           perform varying sentence-index 
               from 1 by 1 
                   until sentence-index > LENGTH OF source-sentence
               if input-sentence(sentence-index) 
                   NOT EQUAL TO delim THEN
                    add 1 to char-count
                    move input-sentence(sentence-index) 
                       to current-word(char-count:1)
               else
                   if current-word equal SPACES then
                       exit perform
                   end-if
                   move 0 to char-count 
                   add 1 to word-count
                   move current-word 
                       to word(word-count)
                   move SPACES to current-word
               end-if
           end-perform.
           
           string 
               'word count: ' 
               word-count
               into result.

           perform varying word-index 
               from 1 by 1 until word-index > word-count
               string 
                   function trim(result)
                   NEW-LINE
                   function trim(word(word-index))
                   into result
           end-perform.
           
           goback.
