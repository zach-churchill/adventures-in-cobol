       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 7: 10,001st Prime
      *
      *    By listing the first six prime numbers: 2, 3, 5, 7, 11, and
      *    13, we can see that the 6th prime is 13.
      *    What is the 10,001st prime number?
      *****************************************************************
       PROGRAM-ID. Problem7.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(5) VALUE 10001.
       01 N-PRIMES-FND PIC 9(13) VALUE 1.
       01 NTH-PRIME PIC 9(13) VALUE 2.
       01 IS-PRIME PIC 9(1) VALUE 0.
       01 I PIC 9(13) VALUE 0.
       01 J PIC 9(13) VALUE 0.
       01 SQRT-LIMIT PIC 9(13) VALUE 0.
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Implementation
           DISPLAY "The " N "th prime is " NTH-PRIME
           GOBACK.
      ***** End of Program Execution
       B00-Implementation.
           PERFORM VARYING I FROM 3 BY 2 UNTIL N-PRIMES-FND >= N
             IF FUNCTION MOD(I, NTH-PRIME) > 0
               PERFORM C00-IsPrime
               IF IS-PRIME = 1
               THEN 
                 COMPUTE N-PRIMES-FND = N-PRIMES-FND + 1
                 MOVE I TO NTH-PRIME
                 MOVE 0 TO IS-PRIME
               END-IF
             END-IF
           END-PERFORM
           .
       C00-IsPrime.
           MOVE 1 TO IS-PRIME
           COMPUTE SQRT-LIMIT = FUNCTION SQRT(I)
           PERFORM VARYING J FROM 2 BY 1 UNTIL J > SQRT-LIMIT
             IF FUNCTION MOD(I, J) = 0
             THEN 
               MOVE 0 TO IS-PRIME
               EXIT PERFORM
             END-IF
           END-PERFORM
           .
      ***** Exit 
       END PROGRAM Problem7.
