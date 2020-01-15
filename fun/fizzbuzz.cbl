       IDENTIFICATION DIVISION.
       PROGRAM-ID. fizzbuzz.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 999.
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM VARYING I FROM 1 BY 1 UNTIL 100 < i
             IF FUNCTION MOD(I, 15) = 0
               DISPLAY "FizzBuzz"
               EXIT PERFORM CYCLE
             END-IF
             IF FUNCTION MOD(I, 3) = 0
               DISPLAY "Fizz"
               EXIT PERFORM CYCLE
             END-IF
             IF FUNCTION MOD(I, 5) = 0
               DISPLAY "Buzz"
               EXIT PERFORM CYCLE
             END-IF

             DISPLAY I
           END-PERFORM
           GOBACK.
       END PROGRAM fizzbuzz.

