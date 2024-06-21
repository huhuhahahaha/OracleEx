--���
--
--IF����
--IF ������ THEN
--ELSIF ������ THEN
--ELSE ������
--END IF;
SET SERVEROUTPUT ON;

DECLARE
    POINT NUMBER := TRUNC(DBMS_RANDOM.VALUE(1,101));
BEGIN
--    DBMS_OUTPUT.PUT_LINE('����:' || POINT);
--    IF POINT >= 90 THEN
--        DBMS_OUTPUT.PUT_LINE('A����');
--    ELSIF POINT >= 80 THEN
--        DBMS_OUTPUT.PUT_LINE('B����');
--    ELSIF POINT >= 70 THEN
--        DBMS_OUTPUT.PUT_LINE('C����');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('����');
--    END IF;

-- CASE ��������
    CASE WHEN POINT >= 90 THEN DBMS_OUTPUT.PUT_LINE('A');
         WHEN POINT >= 80 THEN DBMS_OUTPUT.PUT_LINE('B');
         WHEN POINT >= 70 THEN DBMS_OUTPUT.PUT_LINE('C');
    ELSE DBMS_OUTPUT.PUT_LINE('����');
    END CASE;
END;
--------------------------------------------------------
--WHILE ����

DECLARE
    CNT NUMBER := 1;
BEGIN
    WHILE CNT<=9
    LOOP
        DBMS_OUTPUT.PUT_LINE('3 X ' ||CNT||' = ' || CNT*3);
        CNT := CNT +1;
    
    END LOOP;
END;
-----------------------------------------------
-- FOR ����
DECLARE 

BEGIN
    FOR I IN 1..9
    LOOP
        --CONTINUE�� �����غ��ٸ�
        CONTINUE WHEN I=5;
        -- I�� 5�϶� ����� �ȵ�
        DBMS_OUTPUT.PUT_LINE('3 X ' ||I||' = '||I*3);
        -- Ż�⹮�� �����غ��ٸ�
        --EXIT WHEN I = 5;
    END LOOP;
END;
----------------------------------------
--2~9�ܱ��� ����ϴ� �͸��� ����غ���
DECLARE

BEGIN
    FOR I IN 2..9
        LOOP
            FOR J IN 1..9
            LOOP
            DBMS_OUTPUT.PUT_LINE(I||' X '||J||' = '||J*I);
            END LOOP;
        END LOOP;

END;
------------------------------------------------
--CURSOR(���ǰ���� 1�� �ʰ��ϰ�� ���)

DECLARE
    NAME VARCHAR2(30);
BEGIN
    
    SELECT FIRST_NAME 
    INTO NAME
    FROM EMPLOYEES WHERE JOB_ID='IT_PROG';    -- �������� : ����Ʈ ����� �������̶�,,,�ڹٶ�� �迭�� �����
    
    DBMS_OUTPUT.PUT_LINE(NAME);
END;

--Ŀ�� ��� ����
--
--1. Ŀ�� ����
--CURSOR Ŀ���̸� IS select����;
--2. Ŀ�� ����
--OPEN Ŀ���̸�;
--3. Ŀ���κ��� ������ �б�(LOOP end�� �ݺ����� Ȱ���Ѵ�)
--FETCH Ŀ���̸� INTO ������ ���ú���
--4. Ŀ���ݱ�
--CLOSE Ŀ���̸�
--5. Ŀ���� ��밡���� �Ӽ�
--    - %FOUND -- PL/SQL�ڵ尡 ���������� ���� Ŀ���� ��� set�� ���ڵ尡 �ִٸ� ��.
--    - %NOTFOUND -- %FOUND�� �ݴ�
--    - %ROWCOUNT -- Ŀ������ ���� ���ڵ�� ��ȯ
--    - %ISOPEN -- Ŀ���� ���Ȱ� ���� ������ ���� ���¶�� TRUE

--Ŀ�� ���
DECLARE
    NM VARCHAR2(30);
    SALARY NUMBER;
    CURSOR X IS SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
BEGIN
    OPEN X;
        DBMS_OUTPUT.PUT_LINE('------Ŀ�� ����------');
    LOOP
        FETCH X INTO NM,SALARY;
        EXIT WHEN X%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(NM);
        DBMS_OUTPUT.PUT_LINE(SALARY);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------Ŀ�� ����-----');
    DBMS_OUTPUT.PUT_LINE('�����ͼ�: ' || X%ROWCOUNT);
    CLOSE X;
END;

-----------------------------------------
--Ŀ�� ��������
--4. �μ��� �޿����� ����ϴ� Ŀ�������� �ۼ��غ��ô�.
--
--SELECT D.DEPARTMENT_NAME,E.SUM(SALARY) FROM EMPLOYEES JOIN DEPARTMENTS D ON E.DEPARTMENT_ID=D.DEPARTMENT_ID GROUP BY DEPARTMENT_ID;
DECLARE
    DEPID NUMBER;
    SSALARY NUMBER;
    CURSOR C IS SELECT DEPARTMENT_ID,SUM(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID DESC; 
BEGIN
    OPEN C;
    LOOP
        FETCH C INTO DEPID,SSALARY;
        EXIT WHEN C%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(DEPID);
        DBMS_OUTPUT.PUT_LINE(SSALARY);
    END LOOP;
    CLOSE C;
END;

--5. ������̺��� �Ի翬���� �޿����� ���Ͽ� EMP_SAL�� ���������� INSERT�ϴ� Ŀ�������� �ۼ��غ��ô�.
--DECLARE 
--    DATE_SSALARY  NUMBER;
--    CURSOR D IS SELECT SUM(SALARY) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY') = YEARS;
--BEGIN
--    OPEN D;
--    LOOP 
--        FETCH D INTO DATE_SSALARY;
--        INSERT INTO EMP_SAL VALUES(YEARS,DATE_SALARY);
--        COMMIT;
--        EXIT WHEN D%NOTFOUND;
--        END LOOP;
--        CLOSE D;
--      
--END;
--SELECT * FROM EMPLOYEES;
DECLARE 
        CURSOR D IS SELECT A,
            SUM(SALARY) AS B 
                FROM(SELECT TO_CHAR(HIRE_DATE,'YYYY')AS A,
                     SALARY
                     FROM EMPLOYEES
                     )
        GROUP BY A;
BEGIN
    FOR I IN D
    LOOP
        INSERT INTO EMP_SAL VALUES(I.A,I.B);        --FOR �� �ϸ� ����������̵� ����,,,,  FETCH�Ƚᵵ ����
        --DBMS_OUTPUT.PUT_LINE(I.A||' ' || I.B);
    END LOOP;
END;
SELECT * FROM EMP_SAL;