      * This is a simple console app 
       
       identification division.
       program-id. ConsoleApp-Atilla.
       
       environment division.
      * Nothing needed in the environment division
      * Environment division contains entries related to hardware
      * the program will be running on - today's world - not needed 
       configuration section.
       
       data division.
       file section.
      * Nothing needed in the file section of the data division
      * File section contains entries related to external 

       working-storage section.
      * This is where define all data local to this application 

      * Define a variable to hold the user input from keyboard
      * PIC data-type(length)
      *
      *    X - alphanumeric
      *    9 - numeric type
      *
      * PIC X used because keyboard input is always text values (EBCDIC)
      * 255 is used as length as it is the maximum length of input
        01 user-input     pic x(255).
      
        01 word-1   pic x(100).
        01 word-2   pic x(100).
        01 word-3   pic x(100).
.

       linkage section.
      * Nothing needed in the linkage section of the data division
      * Linkage section contains entries related to external data
      *     Typically this is data passed when the program is called
 
       procedure division.

      * Get a Line of input from the user via keyboard via Accept verb
           Display "Enter a line with 3 words separated by space".
           Accept user-input.
      * Separate the line into words

        Unstring user-input delimited by ' '
            into word-1, word-2, word-3.

        Display word-1.
        Display word-2.
        Display word-3.
     

      * Display the line entered by the user
           display 'You entered: ' user-input.   

      * terminate programand return to caller           
           goback.
      * The end-program is required if teh file contains multiple
      *     programs 
       end program ConsoleApp-Atilla.

       