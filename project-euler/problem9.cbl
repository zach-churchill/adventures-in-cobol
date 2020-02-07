       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 9: Special Pythagorean Triplet
      *
      *    A Pythagorean triplet is a set of three natural numbers,
      *    a < b < c, for which a**2 + b**2 = c**2 e.g., 3**2 + 4**2 =
      *    5**2.
      *    There exists exactly one Pythagorean triplet for which 
      *    a + b + c = 1,000. 
      *    Find the product a*b*c of this special Pythagorean triplet.
      *
      *    NOTE: I did the algebra by hand to come up with the function
      *          definitions for what A and C equal in terms of B.
      *          Furthermore, the methodology assumes that once an
      *          integral value is found for either A or C, then the
      *          other one must be integral. Hence, I only test A below
      *****************************************************************
       PROGRAM-ID. Problem9.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 9(3).
       01 B PIC 9(3).
       01 C PIC 9(3).
       01 NUM PIC 9(10).
       01 DENOM PIC 9(10).
       01 REM PIC 9(3) VALUE 1.
       01 DIV PIC 9(3).
       01 ANS PIC 9(20).
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Implementation
           DISPLAY "A: " A
           DISPLAY "B: " B
           DISPLAY "C: " C
           DISPLAY " "
           DISPLAY "A * B * C = " ANS
           GOBACK.
      ***** End of program execution
       B00-Implementation.
           PERFORM VARYING B FROM 499 BY -1 UNTIL B < 1
             PERFORM C00-AinTermsOfB
             IF REM = 0
             THEN EXIT PERFORM
             END-IF
           END-PERFORM
           PERFORM C00-AinTermsOfB
           PERFORM D00-CinTermsOfB
           COMPUTE ANS = A * B * C
           .
       C00-AinTermsOfB.
           COMPUTE NUM = 500000 - 1000 * B
           COMPUTE DENOM = 1000 - B
           DIVIDE NUM BY DENOM GIVING DIV REMAINDER REM
           MOVE DIV TO A
           .
       D00-CinTermsOfB.
           COMPUTE NUM = 500000 - 1000 * B + B * B
           COMPUTE DENOM = 1000 - B
           DIVIDE NUM BY DENOM GIVING DIV REMAINDER REM
           MOVE DIV TO C
           .
      ***** Exit
       END PROGRAM Problem9.
