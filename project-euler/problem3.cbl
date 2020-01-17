       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 3: Even Fibonacci numbers
      *
      *    The prime factors of 13,195 are 5, 7, 13, and 29.
      *    What is the largest prime factor of the number
      *    600,851,475,143?
      *****************************************************************
       PROGRAM-ID. Problem3.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM PIC 9(12) VALUE 600851475143.
       01 UPPER-BOUND PIC 9(12).
       01 LAST-PRIME PIC 9(12).
       01 CURRENT-DIVISOR PIC 9(12) VALUE 1.
       01 CURRENT-DIVISOR-PRIME PIC X(1) VALUE 'N'.
       01 I PIC 9(12).
       PROCEDURE DIVISION.
       A00-Begin.
           DISPLAY "Number: " NUM
           PERFORM B00-Implementation
           DISPLAY "Largest Prime Factor: " LAST-PRIME
           GOBACK.
      ***** End of Program execution
       B00-Implementation.
      ***** Use SQRT(NUM) as upper bound because of Pollard's Rho
           MOVE FUNCTION SQRT(NUM) TO UPPER-BOUND
           PERFORM VARYING CURRENT-DIVISOR FROM 1 BY 1 UNTIL
             CURRENT-DIVISOR >= UPPER-BOUND
             IF FUNCTION MOD(NUM, CURRENT-DIVISOR) = 0
               PERFORM C00-IsPrime
               IF CURRENT-DIVISOR-PRIME = 'Y'
                 MOVE CURRENT-DIVISOR TO LAST-PRIME 
               END-IF
             END-IF
           END-PERFORM
           .
       C00-IsPrime.
           MOVE 'Y' TO CURRENT-DIVISOR-PRIME
           PERFORM VARYING I FROM 2 BY 1 UNTIL I >= CURRENT-DIVISOR OR
             CURRENT-DIVISOR-PRIME = 'N'

             IF FUNCTION MOD(CURRENT-DIVISOR, I) = 0
              MOVE 'N' TO CURRENT-DIVISOR-PRIME 
              EXIT PERFORM
             END-IF
           END-PERFORM
           .
      ***** Exit
       END PROGRAM Problem3.

