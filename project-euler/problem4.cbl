       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 4: Largest Palindrome Product
      *
      *    A palindromic number reads the same both ways. The largest
      *    palindrome made from the product of two 2-digit numbers is
      *    9009 (91 * 99).
      *    Find the largest palindrome made from the product of two
      *    3-digit numbers.
      *****************************************************************
       PROGRAM-ID. Problem4.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PRODUCT PIC 9(6).
       01 LARGEST-PALINDROME PIC 9(6).
       01 PRODUCT-TALLY PIC 9(1).
       01 PRODUCT-CHAR PIC X(6).
       01 PRODUCT-REV-CHAR PIC X(6).
       01 I PIC 9(7) VALUE 1.
       01 J PIC 9(7) VALUE 1.
       01 UPPER-BOUND PIC 9(6) VALUE 999.
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Implementation
           DISPLAY "Largest Palindrome: " LARGEST-PALINDROME
           GOBACK.
      ***** End of Program execution
       B00-Implementation.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > UPPER-BOUND
             PERFORM VARYING J FROM 1 BY 1 UNTIL J > UPPER-BOUND
               COMPUTE PRODUCT = I * J
               PERFORM C00-IsPalindrome
             END-PERFORM
           END-PERFORM 
           .
       C00-IsPalindrome.
           MOVE PRODUCT TO PRODUCT-CHAR
           MOVE FUNCTION REVERSE(PRODUCT-CHAR) TO PRODUCT-REV-CHAR
           IF PRODUCT-CHAR = PRODUCT-REV-CHAR
             AND PRODUCT > LARGEST-PALINDROME
             THEN MOVE PRODUCT TO LARGEST-PALINDROME
           END-IF
           .
      ***** Exit
       END PROGRAM Problem4.

