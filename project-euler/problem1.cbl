       IDENTIFICATION DIVISION.
       PROGRAM-ID. Problem1.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I PIC 9(4).
       01 RUNNING-SUM PIC 9(8).
       PROCEDURE DIVISION.
       A00-Begin.
           PERFORM VARYING I FROM 1 BY 1 UNTIL 1000 <= i
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
           GOBACK.
       END PROGRAM Problem1.

