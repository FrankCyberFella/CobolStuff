       Identification Division.
       Program-id. GUINIT.
           
       Environment Division.
           
       Data Division.
       Working-Storage Section.

       Linkage Section. 
      * Include the COBOL code in the GUnit-Test-Fields copy book 
      * .cpy extension is optional
           copy '../copybooks/GUnitFld.cpy'.

       Procedure Division using GUnit-Test-Fields.
          
           Set GU-Test-Failed                  to True.
           Set GU-Do-Not-Show-Values           to True.
           Set GU-Content-Lengths-Do-Not-Match to True.
           Set GU-Use-Content-Length           to True.
             Initialize GU-Actual-Value-Numeric
                        GU-Expected-Value-Numeric
                        GU-Actual-Value-String
                        GU-Expected-Value-String
                        GU-Content-Length-Expected
                        GU-Content-Length-Actual
                        GU-Test-Length.
           Goback.
