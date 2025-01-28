# Sample COBOL Console Appication
 
This was created to provide examples of implmenting common prorgramming
elements in COBOL.

This is V0.  I may be tweaking it and adding/changing some functionality.
The 'History.md' file will have a summary of what was added/changed.

Contact Frank Fella (Slack or Frank.Fella@Galvanize.com) with questions,
comments, assistance or feedback.    

This project requires gnuCOBOL.

To install gnuCOBOL:

- Mac: `brew install gnucobol`
- Windows: [gnuCOBOL Download Site](https://gnucobol.sourceforge.io/)

To run this project:

1. Navigate to project folder with the .cbl files
2. Verify you have the *build* folder. create it if you don't.
3. Issue the command: `cobc -x consoleApp.cbl -o ./build/consoleApp`
   *(this compiles the program and places executable in the *build* folder)*
4. If no errors, to run the code: `./build/consoleApp`

If you run into issues, contact Frank Fella (Slack or Frank.Fella@Galvanize.com)    
