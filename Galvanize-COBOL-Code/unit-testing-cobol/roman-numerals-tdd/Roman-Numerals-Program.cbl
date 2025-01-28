       identification division.
       program-id. Roman-Numerals-Program.
       environment division.
       data division.
       working-storage section.
       01  input-number pic 9999.
       01  output-string pic x(20).
       
      *****************************************************************
       procedure division.

       move 1 to input-number.
       call 'to-roman' using input-number output-string.
       display "expected I and got " output-string.
