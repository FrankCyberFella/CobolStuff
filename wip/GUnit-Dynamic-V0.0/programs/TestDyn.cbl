           identification division.
           program-id. TestDyn.
           
           environment division.
           configuration section.
           
           data division.
           working-storage section.

               copy 'TSFIELDS'.
               copy 'GUNITFLD'.
           
           procedure division.

              Call GU-InitializeDefaultValues using GUnit-Test-Fields.

               Move 0 to GU-Actual-Value-Numeric
                         GU-Expected-Value-Numeric.

               Set GU-Show-Values to True.   

               Call GU-AssertEquals-Numeric using GUnit-Test-Fields.

               Display 'Test Result: ' GU-Test-Result.

               Move 0 to GU-Actual-Value-Numeric.
               move 1 to GU-Expected-Value-Numeric.

               Set GU-Show-Values to True.   

               Call GU-AssertEquals-Numeric using GUnit-Test-Fields.

               Display 'Test Result: ' GU-Test-Result.
    
               Move 0 to GU-Actual-Value-Numeric
                         GU-Expected-Value-Numeric.

               Set GU-Show-Values to True.   

               Call GU-AssertNotEquals-Numeric using GUnit-Test-Fields.

               Display 'Test Result: ' GU-Test-Result.

               Move 0 to GU-Actual-Value-Numeric.
               move 1 to GU-Expected-Value-Numeric.

               Set GU-Show-Values to True.   

               Call GU-AssertNotEquals-Numeric using GUnit-Test-Fields.
               Display 'Test Result: ' GU-Test-Result.
  
               Move 'Frank' to GU-Actual-Value-String.
               move 'Frank' to GU-Expected-Value-String.

               Set GU-Show-Values to True.   

               Call GU-AssertEquals-String using GUnit-Test-Fields.
               Display 'Test Result: ' GU-Test-Result.
               
               Move 'Frank'  to GU-Actual-Value-String.
               move 'Phrank' to GU-Expected-Value-String.

               Set GU-Show-Values to True.   

               Call GU-AssertEquals-String using GUnit-Test-Fields.
               Display 'Test Result: ' GU-Test-Result.

      ******************************************************
               Move 'Frank' to GU-Actual-Value-String.
               move 'Frank' to GU-Expected-Value-String.

               Set GU-Show-Values to True.   

               Call GU-AssertNotEquals-String using GUnit-Test-Fields.
               Display 'Test Result: ' GU-Test-Result.
               
               Move 'Frank'  to GU-Actual-Value-String.
               move 'Phrank' to GU-Expected-Value-String.

               Set GU-Show-Values to True.   

               Call GU-AssertNotEquals-String using GUnit-Test-Fields.
               Display 'Test Result: ' GU-Test-Result.        


               goback.
           
           end program TestDyn.
