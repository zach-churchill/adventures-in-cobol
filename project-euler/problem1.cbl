       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 1: Multiples of 3 and 5
      *
      *    If we list all numbers below 10 that are multiples of 3 or 5,
      *    we get 3, 5, 6, and 9. The sum of these multiples is 23.
      *    Find the sum of all the multiples of 3 or 5 below 1000.
      *****************************************************************
       PROGRAM-ID. Problem1.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 9(4).
       01 RUNNING-SUM PIC 9(8) VALUE 0.
       01 UPPER-BOUND PIC 9(4) VALUE 1000.
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Implementation
           GOBACK.
      ***** End of Program execution
       B00-Implementation.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I >= UPPER-BOUND
             IF FUNCTION MOD(I, 15) = 0
               COMPUTE RUNNING-SUM = RUNNING-SUM + I
               EXIT PERFORM CYCLE
             END-IF
             IF FUNCTION MOD(I, 3) = 0
               COMPUTE RUNNING-SUM = RUNNING-SUM + I
               EXIT PERFORM CYCLE
             END-IF
             IF FUNCTION MOD(I, 5) = 0
               COMPUTE RUNNING-SUM = RUNNING-SUM + I
               EXIT PERFORM CYCLE
             END-IF
           END-PERFORM
           DISPLAY RUNNING-SUM
           .
      ***** Exit
       END PROGRAM Problem1.

