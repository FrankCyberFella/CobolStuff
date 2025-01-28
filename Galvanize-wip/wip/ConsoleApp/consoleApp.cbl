       Identification Division.
       program-id. consoleApp.
       
       Environment Division.
       input-output section.
       file-control.

       select Menu-Item-File
              assign to "cafeItems.csv"
              organization is line sequential
              access mode is sequential.

       Data Division.

       File Section.

        FD Menu-Item-File
           record contains 80.

        01 Menu-Item-File-Record  pic x(80).  

       working-storage section.

       01  Menu-Item-File-EOF-Switch pic x(3) value 'no'.
           88 More-Data-To-Read  value 'no'.
           88 No-More-data       value 'yes'.

       01  Processing-Switch    Pic x(3).
           88 Start-Processing         Value 'Yes'.
           88 End-Processing-Requested Value 'No'.

       01  WS-Current-Timestamp.
           05 WS-Current-Year                pic 9(4). 
           05 WS-Current-Month               pic 9(2). 
           05 WS-Current-Day                 pic 9(2).
           05 WS-Current-Hour                pic 9(2).
           05 WS-Current-Minute              pic 9(2).
           05 WS-Current-Second              pic 9(2).  
           05 WS-Current-HundrethSeconds     pic 9(2).    

       01  Greeting-Setup.
           05 Filler  pic x(80)
                      value all "-".
           05 Filler  pic x(80)
                      value "Welcome to the Restaurant at the End of the
      -                     " of the Universe".
           05 Filler  pic x(80)
                      value all '-'.

       01  Greeting-Message redefines Greeting-Setup.
           05 Greating-line pic x(80) 
              occurs 3 times indexed by Greeting-Index.

       01  Greeting-Message-Entries   pic s9(9) comp.      
           
       01  Goodbye-Setup.
           05 Filler  pic x(80)
                      value all "-".
           05 Filler  pic x(80)
                      value "Thanks for visiting the Restaurant at the E
      -                     "nd of the Universe".
           05 Filler  pic x(80)
                      value all '-'.

       01  Goodbye-Message redefines Goodbye-Setup.
           05 Goodbye-line pic x(80) 
              occurs 3 times indexed by Goodbye-Index.

       01  Goodbye-Message-Entries   pic s9(9) comp.        

       01  Menu-Item-Table. 
           05 Menu-Item occurs 100 times
                        indexed by Menu-Index.            
               10 Item-Name    pic x(20).
               10 Item-Price   pic s9(4)v99.

       01  Max-Menu-Item-Entries   pic s9(9).
       01  Menu-Item-Entries       pic s9(9) comp.         

       01  Menu-Item-Data   pic x(80).
       
       01  Menu-Item-Data-Parsed.
           05 Item-Name-In  pic x(20).
           05 Item-Price-In pic 9(4)v99.

       01  Menu-Item-Sub   pic s9(9) comp.

       01  Order-Switch     pic x(3).
           88 New-Order              value 'Yes'.
           88 No-More-Items-Ordered  value 'No'.   
       
       01  Menu-Item-Display-Line.
           05 Customer-Choice-Number      pic zz9.
           05 Filler             pic x(1) value ".".
           05 Filler             pic x(2) value spaces.
           05 Filler             pic x(6) value "Item: ".
           05 Menu-Item-Display  pic x(20).
           05 Filler             pic x(2) value spaces.
           05 Item-Price-Display Pic zz9.99.

       01  Customer-Order.
           05 Order-Items occurs 100 times.
               10 Order-Item       pic x(20).
               10 Order-Item-Price pic s9(4)V99.

       01  Order-Sub                pic s9(4) comp.

       01  Number-Items-In-Order    pic s9(4) comp.        

       01  Order-Total              Pic s9(9)V99 comp-3.

       01  WS-Separator-Line        pic x(80)  value all '-'.

       01  WS-Restaurant-Name          pic x(80) 
              value 'Restaurant at the End of the Universe'.

       01  WS-Order-time.
           05 Order-Month           pic z9.
           05 filler                pic x(1) value '/'.
           05 Order-Day             pic 99.
           05 filler                pic x(1) value '/'.
           05 Order-Year            pic 9999.
           05 filler                pic x(4) value ' at '.
           05 Order-Hour            pic z9.
           05 filler                pic x(1) value ':'.
           05 Order-Minute          pic 99.
           05 filler                pic x(1) value ':'.
           05 Order-Second          pic 99.

       01  Order-Item-Out-Line.
           05 Order-Item-Out       pic x(20).
           05 Filler               pic x(3) value spaces.
           05 Order-Item-Price-Out pic $,$$9.99.    

       01 Order-Total-Out          Pic $$$,$$$,$$9.99.

       01 User-Input               pic x(80).

       01 Customer-Choice          pic 9(3).
       01 Customer-Choice-Editted  pic zz9.
       
       Procedure Division.

           Perform 0000-Initialization
              thru 0000-Initialization-Exit.

           Perform 1000-Process
              thru 1000-Process-Exit
             until End-Processing-Requested.

           Perform 9999-Termination-Clean-Up
              thru 9999-Termination-Clean-Up-Exit.

           Goback.       
          
       0000-Initialization.

           Set Start-Processing to true.

           compute Greeting-Message-Entries = 
                   Length of Greeting-Message / Length of Greating-Line.

           compute Goodbye-Message-Entries = 
                   Length of Goodbye-Message / Length of Goodbye-Line. 

           compute Max-Menu-Item-Entries = 
                   Length of Menu-Item-Table / Length of Menu-Item.                      

           Perform 0500-Load-Menu-Items
              thru 0500-Load-Menu-Items-Exit.

           Perform 0100-Display-Greeting
              thru 0100-Display-Greeting-Exit.
       
       0000-Initialization-Exit.
           Exit.   


       0500-Load-Menu-Items.
           
           open input Menu-Item-File.

           read Menu-Item-File into Menu-Item-Data
           at end set No-More-data to true.

           perform
              varying Menu-Item-Sub
                 from 1 by 1 
              until No-More-data 
                 or Menu-Item-Sub > Max-Menu-Item-Entries

               Unstring Menu-Item-Data
                 delimited by ","
                 into Item-Name-In
                      Item-Price-In

               move Item-Name-In  to Item-Name(Menu-Item-Sub)
               move Item-Price-In to Item-Price(Menu-Item-Sub)
     
               read Menu-Item-File into menu-item-data
                 at end set No-More-data to true

           end-perform.  

           Compute Menu-Item-Entries = Menu-Item-Sub - 1.

           close Menu-Item-File. 

       0500-Load-Menu-Items-Exit.
           Exit.    

       0100-Display-Greeting.
           Display " ".      
           perform varying Greeting-Index
                   from 1 by 1
                   until Greeting-Index > Greeting-Message-Entries

               Display Greating-line(Greeting-Index)

           end-perform.        
       0100-Display-Greeting-Exit.
           Exit.    

       1000-Process.
           
           Perform 1100-Display-Menu
              thru 1100-Display-Menu-Exit.

           Set New-Order to true.

           Perform 1110-Get-Customer-Choice
              thru 1110-Get-Customer-Choice-Exit
             until No-More-Items-Ordered.  

           perform 1200-Process-Order
              thru 1200-Process-Order-Exit.     

           Display " ".            
           Display "Do you want to order again? (Yes/No)".

           Accept User-Input.

           if User-Input Not Equal "Yes"
              Set End-Processing-Requested to True.

       1000-Process-Exit.
           Exit.


       1100-Display-Menu.
           
           Move 0 to Number-Items-In-Order.

           Perform varying Menu-Index from 1 by 1
                     until Menu-Index > 4
           
               Move Menu-Index             to Customer-Choice-Number
               Move Item-Name(Menu-Index)  to Menu-Item-Display
               Move Item-Price(Menu-Index) to Item-Price-Display 

               Display Menu-Item-Display-Line
               
           End-Perform.        

       1100-Display-Menu-Exit.
           Exit.

       1110-Get-Customer-Choice.
           
           Display ' '.
           Display "Please enter the number of your choice or 0 to end".
           accept Customer-Choice.

           if  Customer-Choice is numeric 
           and Customer-Choice not equal 0
           and Customer-Choice not greater than Menu-Item-Entries

               add 1 to Number-Items-In-Order

               move Item-Name(Customer-Choice) 
                 to Order-Item(Number-Items-In-Order)

               move Item-Price(Customer-Choice) 
                 to Order-Item-Price(Number-Items-In-Order)  

               add Item-Price(Customer-Choice) to Order-Total 
           else
               if Customer-Choice equals 0 
                   set No-More-Items-Ordered to true
               else 
                   Move Customer-Choice to Customer-Choice-Editted
                   Display "Incorrect response: "Customer-Choice-Editted
                   Display "Please re-enter, Thank you!"
               end-if    
           end-if.    

       1110-Get-Customer-Choice-Exit.
           Exit.

       1200-Process-Order.

           Display WS-Separator-Line.
           Display WS-Restaurant-Name.
           Display ' '.
           Perform 8000-Set-Order-Time thru 8000-Set-Order-Time-Exit.
           Display 'Order date: ' WS-Order-Time.
           Display WS-Separator-Line.

           perform varying Order-Sub
              from 1 by 1
             until order-sub > Number-Items-In-Order

             Move Order-Item(Order-Sub)       to Order-Item-Out
             Move Order-Item-Price(Order-Sub) to Order-Item-Price-Out
             display Order-Item-Out-Line
           end-perform.  

           Move Order-Total to Order-Total-Out.
           Display ' '.
           Display 'Order Total: ' Order-Total-Out.

           Display WS-Separator-Line.

       1200-Process-Order-Exit.
           Exit.    

       8000-Set-Order-Time.
           
           Move function current-date to WS-Current-Timestamp.
           Move WS-Current-Month  to Order-Month.
           Move WS-Current-Day    to Order-Day.
           Move WS-Current-Year   to Order-Year.
           Move WS-Current-Hour   to Order-Hour.
           Move WS-Current-Minute to Order-Minute.
           Move WS-Current-Second to Order-Second.

       8000-Set-Order-Time-Exit.
           Exit.


       9999-Termination-Clean-Up.

           Display " ".      
           Display " ".  

           perform varying Goodbye-Index
                   from 1 by 1
                   until Goodbye-Index > Goodbye-Message-Entries

               Display Goodbye-Line(Goodbye-Index)
           end-perform.    

       9999-Termination-Clean-Up-Exit.
           Exit. 
