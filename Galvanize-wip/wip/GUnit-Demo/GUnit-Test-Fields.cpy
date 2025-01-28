       01  GUnit-Test-Fields.
      
      *****************************************************************
      * Result of Test Passed Back to Caller
      ***************************************************************** 
           05  Test-Result          pic x(5).
               88  Test-Passed      value 'True'.
               88  Test-Failed      value 'False'.
      *****************************************************************
      * Switch to by caller to indicate if they want values displayed 
      ***************************************************************** 
           05  Show-Values-Switch      pic x(5).
               88  Show-Values         value 'Yes'.
               88  Do-Not-Show-Values  value 'No'.
      
      *****************************************************************
      * Actual Value Of Data Passed To Be Used In The Numeric Tests
      *****************************************************************            
           05 Actual-Value-Numeric         comp-2.

      *****************************************************************
      * Expected Value Of Data Passed To Be Used In The Numeric Tests
      *****************************************************************            
           05 Expected-Value-Numeric        comp-2.

      *****************************************************************
      * Actual and Expected Value String 
      * Data Passed To Be Used In The Tests
      ***************************************************************** 
           05 Actual-Value-String      pic x(32767).
           05 Expected-Value-String    pic x(32767).

      *****************************************************************
      * Calculated Length of Content Passed Without Trailing Spaces 
      ***************************************************************** 
           05  Content-Length-Expected          pic s9(9)  comp.
           05  Content-Length-Actual            pic s9(9)  comp.
      
      ******************************************************************
      * Switch set to indicate of expected and actual values same length 
      ******************************************************************      
           05  Content-Length-Match-Switch       pic x(3).
               88  Content-Lengths-Match         value 'Yes'.
               88  Content-Lengths-Do-Not-Match  value 'No'.         

      ******************************************************************
      * The following fields are currently unused by GUnit
      ******************************************************************
      ******************************************************************
      * Switch set to indicate if content length should be ignored
      *        and Test-Length set when called should be used 
      ******************************************************************      
           05  Should-Use-Test-Length            pic x(3).
               88  Use-Test-Length               value 'Yes'.
               88  Use-Content-Length            value 'No'.            
      
           05 Test-Length              pic s9(9) comp.  
      ******************************************************************
      * End of Currently Unused Fields
      ****************************************************************** 
