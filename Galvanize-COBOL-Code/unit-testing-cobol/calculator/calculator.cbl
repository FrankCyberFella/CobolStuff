       identification division.
       program-id. calculator.
       
       environment division.
       configuration section.
       
       data division.
       working-storage section.
       01  current-char pic X(255).
       01  current-num comp-2.
       01  left-index pic 9(3).
       01  num-length pic 9(3).
       01  custom-delimiter-line pic X(255).
       01  custom-delimiter pic X.
       01  negative-count pic 9(3).
       01  negative-numbers-table.
           05 negative-number 
               occurs 100 indexed by negative-number-index pic s9(4).
       01  negative-num-display pic ----9.
       01  negative-errors pic X(255).
       01  token pic X(255).
       01  token-index pic 9(3).
       01  sliding-window pic X(255).
       01  delim pic X(255).
       01  delim-length pic 9(3).
       01  new-line pic X value X'0A'.
       01  padded-new-line pic XX.
       01  delims.
           05 delim-item 
               occurs 2 indexed by delim-index pic X(255) value space.
       
       
       linkage section.
       01  source-number-chars.
           05 number-chars occurs 255 indexed by char-index pic X.
       01  result-table.
           05 result comp-2.
           05 error-msg pic X(255).
       
       procedure division.

       entry 'add' using source-number-chars, result-table.
           perform initialize-variables.
           perform convert-new-lines.
           perform standardize-delimiter.
           perform calculate-sum.
           perform handle-negatives.
           goback.

       initialize-variables.
           move ZERO to result.
           move spaces to current-char.
           move zero to current-num.
           move 1 to left-index.
           move 0 to num-length.
           move 0 to negative-num-display.
           move spaces to result-table.
           move spaces to error-msg.
           move spaces to negative-errors.
           move low-values to negative-numbers-table.
           move zero to negative-count.
           move spaces to custom-delimiter-line.
           move spaces to delims.

       calculate-sum.
           perform varying char-index from 1 by 1  
               until char-index > length of source-number-chars

               move number-chars(char-index) to current-char

               if current-char equals ',' then
                   perform add-to-result
                   compute left-index = char-index + 1
                   move zero to num-length
                else
                   add 1 to num-length
               end-if
           end-perform.

           if num-length > zero then
               perform add-to-result
           end-if.

       add-to-result.
           move source-number-chars(left-index:num-length) 
               to current-char.
           move current-char to current-num.
           if current-num < 0 then
               add 1 to negative-count
               move current-num to negative-number(negative-count)
           else if current-num < 1000 then
               add current-num to result
           end-if. 

       convert-new-lines.
           string new-line space into padded-new-line.
           inspect source-number-chars 
               replacing all '\n' by padded-new-line.

       standardize-delimiter.

           if source-number-chars(1:2) equals '//' then
               perform handle-custom-delimiter
           else
               move ',' to delim 
           end-if.

           inspect source-number-chars replacing all new-line by ','.
           compute delim-length = function length(function trim(delim))
           
           perform match-delims.

       handle-custom-delimiter.
           unstring source-number-chars delimited by new-line 
                   into custom-delimiter-line, source-number-chars.

           move spaces to custom-delimiter-line(1:2).
           move function trim(custom-delimiter-line) 
               to custom-delimiter-line.
   
           if custom-delimiter-line(1:1) equals '[' then
               unstring custom-delimiter-line 
                   delimited by ']' 
                   into delim-item(1) delim-item(2)

               move space to delim-item(1)(1:1)
               move function trim(delim-item(1)) to delim-item(1)
               move space to delim-item(2)(1:1)
               move function trim(delim-item(2)) to delim-item(2)
           else
               move custom-delimiter-line to delim-item(1)
           end-if.

       match-delims.
           
           perform varying delim-index 
               from 1 by 1 until delim-index > 2 *> TODO: remove magic

               if delim-item(delim-index) not equals spaces then
                   move delim-item(delim-index) to delim
           
                   compute delim-length = 
                       function length(function trim(delim))
            
                   perform varying char-index 
                           from 1 by 1 
                           until char-index > 
                           length of source-number-chars
                       move source-number-chars(char-index:delim-length) 
                           to sliding-window
                       if sliding-window equals delim then
                           move ',' to 
                               source-number-chars
                               (char-index:delim-length)
                           compute char-index = 
                               char-index + delim-length - 1
                       end-if
                   end-perform
           end-if

           end-perform.

       handle-negatives.
           if negative-count > 0 then
               move -1 to result
           
               perform varying negative-number-index 
                   from 1 by 1 until 
                       negative-number-index > negative-count
                   move negative-number(negative-number-index) 
                       to negative-num-display

                   string 
                       function trim(negative-errors)
                       function trim(negative-num-display)
                       ','
                       into negative-errors
               end-perform

               string 
                   "negatives not allowed "
                   negative-errors
                   into error-msg
      *    Wow, really seems like this would replace each an every
      *    comma but it's actually just doing the last one.
               inspect error-msg replacing all ',' by space

           end-if.
               
               