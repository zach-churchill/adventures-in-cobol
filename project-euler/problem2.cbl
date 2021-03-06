       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 2: Even Fibonacci numbers
      *
      *    Each new term in the Fibonacci sequence is generated by
      *    adding the previous two terms. By starting with 1 and 2, the
      *    first 10 terms will be: 1, 2, 3, 5, 8, 13, 21, 34, 55, 89.
      *    By considering the terms in the Fibonacci sequence whose
      *    values do not exceed four million, find the sum of the
      *    even-valued terms.
      *****************************************************************
       PROGRAM-ID. Problem2.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 F1 PIC 9(7) VALUE 1.
       01 F2 PIC 9(7) VALUE 2.
       01 TEMP PIC 9(7) VALUE 0.
       01 UPPER-BOUND PIC 9(7) VALUE 4000000.
       01 RUNNING-SUM PIC 9(10) VALUE 0.
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Implementation
           DISPLAY " "
           DISPLAY "Final Sum: " RUNNING-SUM
           GOBACK.
      ***** End of Program execution
       B00-Implementation.
           DISPLAY F1 "   odd"
           PERFORM UNTIL F2 > UPPER-BOUND
             IF FUNCTION MOD(F2, 2) = 0
               THEN COMPUTE RUNNING-SUM = RUNNING-SUM + F2
                    DISPLAY F2 "   even"
               ELSE DISPLAY F2 "   odd"
             END-IF
             MOVE F2 TO TEMP
             COMPUTE F2 = F1 + F2
             MOVE TEMP TO F1
           END-PERFORM
           .
      ***** Exit
       END PROGRAM Problem2.

