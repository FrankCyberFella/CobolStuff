cobc -x -I '../copybooks' Sample-Test-Suite.cbl 

# Sample GUnit Test Suite
 
This was created to demonstrate use of a GUnit Test suit

Contact Frank Fella (Slack or Frank.Fella@Galvanize.com) with questions,
comments, assistance or feedback.    

This project requires gnuCOBOL.

To install gnuCOBOL:

- Mac: `brew install gnucobol`
- Windows: [gnuCOBOL Download Site](https://gnucobol.sourceforge.io/)

To run this project:

1. Navigate to project folder with the .cbl files
2. Issue the command: `cobc -x -I 'relative-path-to-copybook-folder' Sample-Test-Suite.cbl `
<br/>
   ***Be sure to replace `relative-path-to-copybook-folder` in the abpve commmand with the relative path to your copybook folder***
3. If no errors, to run the code: `.Sample-Test-Suite`
If you run into issues, contact Frank Fella (Slack or Frank.Fella@Galvanize.com)    