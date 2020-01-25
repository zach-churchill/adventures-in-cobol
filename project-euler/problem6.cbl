       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 6: Sum square difference
      *
      *    The sum of the squares of the first ten natural numbers is,
      *                    1**2 + 2**2 + ... + 10**2 = 385
      *    The square of the sum of the first ten natural numbers is,
      *                  (1 + 2 + ... + 10) = 55**2 = 3025
      *    Therefore, the difference between the sum of the squares of
      *    the first ten natural numbers and the square of the sum is
      *    3025 - 385 = 2640.
      *
      *    Find the difference between the sum of the squares of the
      *    first one hundred natural numbers and the square of the sum.
      *****************************************************************
       PROGRAM-ID. Problem6.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(3) VALUE 100.
       01 I PIC 9(3) VALUE 1.
       01 RUNNING-SQUARE-SUM PIC 9(15) VALUE 0.
       01 RUNNING-SUM-N PIC 9(15) VALUE 0.
       01 ANSWER PIC 9(15).
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Implementation
           DISPLAY "Answer: " ANSWER
           GOBACK. 
      ***** End of Program Execution
       B00-Implementation.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
             COMPUTE RUNNING-SQUARE-SUM = I * I + RUNNING-SQUARE-SUM
             COMPUTE RUNNING-SUM-N = I + RUNNING-SUM-N
           END-PERFORM
           COMPUTE ANSWER = RUNNING-SUM-N * RUNNING-SUM-N -
             RUNNING-SQUARE-SUM
           .
      ***** Exit
       END PROGRAM Problem6.

