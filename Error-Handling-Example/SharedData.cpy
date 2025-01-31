        01 Shared-Data.
           05 Error-Info.
              10 Error-Code     pic s9(5).
                 88 Success        value 0.
                 88 Overflow-Error value 100.
                 88 Invalid-Data   value 200.
              10 Error-Message   pic x(256).
           05 Number-1    pic s9(3) comp-3.
           05 Number-2    pic s9(3) comp-3.
           05 Result      pic s9(3) comp-3.
