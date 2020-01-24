       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 5: Smallest multiple
      *
      *    2520 is the smallest number that can be divided by each of
      *    the numbers from 1 to 10 without any remainder.
      *    What is the smallest positive number that is evenly divisible
      *    by all of the numbers from 1 to 20?
      *****************************************************************
       PROGRAM-ID. Problem5.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SMALLEST-NUMBER PIC 9(20).
       01 I PIC 9(20) VALUE 1.
       01 SMALLER-FACTOR PIC 9(20).
       01 LARGER-FACTOR PIC 9(20).
       01 J PIC 9(2) VALUE 1.
       01 N PIC 9(2) VALUE 20.
       01 UPPER-BOUND PIC 9(20).
       01 STOP-SEARCH PIC 9(1) VALUE 0.
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Implementation
           DISPLAY "Smallest number: " SMALLEST-NUMBER
           GOBACK.
      ***** End of Program execution
       B00-Implementation.
           MOVE FUNCTION FACTORIAL(N) TO UPPER-BOUND
           MOVE UPPER-BOUND TO SMALLEST-NUMBER 
      * Essentially, instead of search the whole space, we should only
      * look at the factors of the UPPER-BOUND, or 20!. This will reduce
      * the number of times the inner loop happens.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > UPPER-BOUND
             IF FUNCTION MOD(UPPER-BOUND, I) = 0
             THEN
               MOVE I TO SMALLER-FACTOR
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > N
                 IF FUNCTION MOD(SMALLER-FACTOR, J) > 0
                 THEN EXIT PERFORM
                 END-IF
               END-PERFORM
               IF J = N + 1
               THEN MOVE 1 TO STOP-SEARCH
               END-IF
             END-IF
             IF STOP-SEARCH = 1
             THEN 
               MOVE SMALLER-FACTOR TO SMALLEST-NUMBER 
               EXIT PERFORM
             END-IF
           END-PERFORM
           .
      ***** Exit
       END PROGRAM Problem5.

