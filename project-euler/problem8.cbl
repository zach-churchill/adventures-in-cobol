       IDENTIFICATION DIVISION.
      *****************************************************************
      *    Problem 8: Largest Product in a Series
      *
      *    The four adjacent digits in the 1000-digit number that have
      *    the greatest product are 9 * 9 * 8 * 9 = 5,832.
      *
      *    73167176531330624919225119674426574742355349194934
      *    96983520312774506326239578318016984801869478851843
      *    85861560789112949495459501737958331952853208805511
      *    12540698747158523863050715693290963295227443043557
      *    66896648950445244523161731856403098711121722383113
      *    62229893423380308135336276614282806444486645238749
      *    30358907296290491560440772390713810515859307960866
      *    70172427121883998797908792274921901699720888093776
      *    65727333001053367881220235421809751254540594752243
      *    52584907711670556013604839586446706324415722155397
      *    53697817977846174064955149290862569321978468622482
      *    83972241375657056057490261407972968652414535100474
      *    82166370484403199890008895243450658541227588666881
      *    16427171479924442928230863465674813919123162824586
      *    17866458359124566529476545682848912883142607690042
      *    24219022671055626321111109370544217506941658960408
      *    07198403850962455444362981230987879927244284909188
      *    84580156166097919133875499200524063689912560717606
      *    05886116467109405077541002256983155200055935729725
      *    71636269561882670428252483600823257530420752963450
      *      <Stored in "1000digits.dat" on a single line>
      *    
      *    Find the thirteen adjacent digits in the 1000-digit number
      *    that have the greatest product. What is the value of this
      *    product?
      *****************************************************************
       PROGRAM-ID. Problem8.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DAT-FILE ASSIGN TO "project-euler/1000digits.dat"
             ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD DAT-FILE BLOCK CONTAINS 0 RECORDS.
       01 DAT-FILE-N PIC X(1000).
       WORKING-STORAGE SECTION.
       01 N PIC X(1000).
       01 EOF-DAT-FILE PIC X.
       01 COVER-SIZE PIC 9(2) VALUE 13.
       01 N-SEGMENT PIC X(13).
       01 GREATEST-PRODUCT PIC 9(18) VALUE 0.
       01 PRODUCT PIC 9(18) VALUE 0.
       01 I PIC 9(4) VALUE 0.
       01 J PIC 9(2) VALUE 0.
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM B00-Setup
           DISPLAY N
           PERFORM C00-Implementation
           DISPLAY "Greatest " COVER-SIZE " digit product is "
             GREATEST-PRODUCT
           GOBACK.
      ***** End of Program Execution
       B00-Setup.
           OPEN INPUT DAT-FILE
           PERFORM WITH TEST AFTER UNTIL EOF-DAT-FILE = "Y"
             READ DAT-FILE
               AT END MOVE "Y" TO EOF-DAT-FILE
               NOT AT END
                 MOVE "N" TO EOF-DAT-FILE
                 MOVE DAT-FILE-N TO N
             END-READ
           END-PERFORM
           CLOSE DAT-FILE
           .
       C00-Implementation.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 1000 - COVER-SIZE + 1
             MOVE 1 TO PRODUCT
             MOVE N(I:COVER-SIZE) TO N-SEGMENT
             PERFORM VARYING J FROM 1 BY 1 UNTIL J > COVER-SIZE
               COMPUTE PRODUCT = PRODUCT * FUNCTION
                 NUMVAL(N-SEGMENT(J:1))
             END-PERFORM
             IF PRODUCT > GREATEST-PRODUCT
             THEN MOVE PRODUCT TO GREATEST-PRODUCT
             END-IF
           END-PERFORM 
           .
      ***** Exit
       END PROGRAM Problem8.
