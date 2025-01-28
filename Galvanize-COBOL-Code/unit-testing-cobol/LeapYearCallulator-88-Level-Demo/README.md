# Leap Year Calculator
 
This was created to during a session with JB and David after we "mob programmed" a Leap Year calculator David was usig to increase his COBOL skills.

This version uses COBOL condition-names (*88-levels*) to demonstrate how thier use can simplify logic when using compound conditions in conditional statements such as **IF**.

The program will request a year from the keyboard, one at time for 5 times, and display whether the year is a leap year or not.

Contact Frank Fella (Slack or Frank.Fella@Galvanize.com) with questions,
comments, assistance or feedback.    

This project requires gnuCOBOL.

To install gnuCOBOL:

- Mac: `brew install gnucobol`
- Windows: [gnuCOBOL Download Site](https://gnucobol.sourceforge.io/)

To run this project:

1. Navigate to project folder with the .cbl files
2. Verify you have the *build* folder. create it if you don't.
3. Issue the command: `cobc -x LeapYear.cbl -o ./build/leapYear`
   *(this compiles the program and places executable in the *build* folder)*
4. If no errors, to run the code: `./build/leapYear`

If you run into issues, contact Frank Fella (Slack or Frank.Fella@Galvanize.com)    
