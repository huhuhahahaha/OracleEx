--������ ���ν���
--�Ϸ��� SQL ó�������� ����ó�� ��� ����ϴ� ����

SET SERVEROUTPUT ON;
--����� ȣ��
CREATE OR REPLACE PROCEDURE NEW_JOB_POC --���ν��� �̸�
IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('LETS START');
END;
-- ȣ��
EXEC NEW_JOB_POC;
---------------------------
-- ���ν����� �Ű����� IN����
CREATE OR REPLACE PROCEDURE NEW_JOB_PROC -- �̸��� ������ �ڵ����� ������
    (P_JOB_ID IN VARCHAR2,
     P_JOB_TITLE IN VARCHAR2,
     P_MIN_SALARY IN JOBS.MIN_SALARY%TYPE := 0,
     P_MAX_SALARY IN JOBS.MAX_SALARY%TYPE := 10000 --����Ʈ �Ű�����,,,, ������ ���� �����
    )
IS
BEGIN
    INSERT INTO JOBS_IT VALUES(P_JOB_ID,P_JOB_TITLE,P_MIN_SALARY,P_MAX_SALARY);
    COMMIT;
END;
-----------
EXEC NEW_JOB_PROC('IDID','�����',1000,10000); --�Ű������� ��Ȯ�� ��ġ���Ѿ���
EXEC NEW_JOB_PROC('EXEX','����ɾ���'); --����Ʈ�Ű������� �˾Ƽ� ��

SELECT * FROM JOBS_IT;
---------------------------------------

--PLSQL�� ��� ����(���,Ż�⹮,Ŀ�� ��..)�� ���ν����� �� �� �ֽ��ϴ�
--JOB_ID�� �����ϸ� UPDATE, ������ INSERT �غ���

CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
    (A IN VARCHAR2, --JOB_ID �־��ٲ���
     B IN VARCHAR2,
     C IN NUMBER,
     D IN NUMBER := 50000
     )
IS
    CNT NUMBER; -- ��������
BEGIN
    SELECT COUNT (*)
    INTO CNT -- �ִٸ� CNT�� ����
    FROM JOBS_IT
    WHERE JOB_ID =A;
    
    IF CNT = 0 THEN
        --INSERT
        INSERT INTO JOBS_IT VALUES(A,B,C,D);
    ELSE
        --UPDATE
        UPDATE JOBS_IT SET JOB_ID=A,
                           JOB_TITLE=B,
                           MIN_SALARY=C,
                           MAX_SALARY=D
                       WHERE JOB_ID=A;
    END IF;
    
    COMMIT;
END;
--
EXEC NEW_JOB_PROC('AD','ADMIN',1000,10000);
SELECT * FROM JOBS_IT;
EXEC NEW_JOB_PROC('IDID','�����',0);
-----------------------------------------------
--���ν����� �Ű����� OUT
--�ܺη� ���� �����ֱ����� �Ű�������
CREATE OR REPLACE PROCEDURE NEW_JOB_PROC
    (A IN VARCHAR2, --JOB_ID �־��ٲ���
     B IN VARCHAR2, 
     C IN NUMBER,
     D IN NUMBER,
     E OUT NUMBER -- �ܺη� ������ �Ű�����
     )
IS
    CNT NUMBER; -- ��������
BEGIN
    SELECT COUNT (*)
    INTO CNT -- �ִٸ� CNT�� ����
    FROM JOBS_IT
    WHERE JOB_ID =A;
    
    IF CNT = 0 THEN
        --INSERT
        INSERT INTO JOBS_IT VALUES(A,B,C,D);
    ELSE
        --UPDATE
        UPDATE JOBS_IT SET JOB_ID=A,
                           JOB_TITLE=B,
                           MIN_SALARY=C,
                           MAX_SALARY=D
                       WHERE JOB_ID=A;
    END IF;
    
    -- �ƿ��Ű����� E�� ���� �Ҵ��غ���
    E := CNT;
    COMMIT;
END;
---- �����ϳ�
---- ���� ����
DECLARE
    CNT NUMBER;
BEGIN
    --�͸� ��� �ȿ����� EXEC�� �����ϰ� �ۼ�
    NEW_JOB_PROC('AD_VP','ADMIN',1000,10000,CNT);
    
    DBMS_OUTPUT.PUT_LINE('���ν��� ���ο��� �Ҵ���� ��: ' || CNT);
END;

SELECT * FROM JOBS_IT;
-----------------------------------
--RETURN�� -���ν����� �����ϴ� ����
--EXCEPTION WHEN OTHERS THEN - ����ó��(���ܰ� �߻��ϸ� �����)

CREATE OR REPLACE PROCEDURE NEW_JOB_PROC2
    ( P_JOB_ID IN JOBS.JOB_ID%TYPE
      
    )
IS 
    CNT NUMBER;
    SALARY NUMBER;
BEGIN
    SELECT COUNT (*)
    INTO CNT
    FROM JOBS
    WHERE JOB_ID = P_JOB_ID;
    IF CNT=0 THEN
        DBMS_OUTPUT.PUT_LINE ('���̾��');
        RETURN; --- ���ν��� ����
    ELSE 
        SELECT MAX_SALARY
        INTO SALARY
        FROM JOBS
        WHERE JOB_ID = P_JOB_ID;
        
        DBMS_OUTPUT.PUT_LINE('�ִ�޿�: ' || SALARY);
    END IF;
        DBMS_OUTPUT.PUT_LINE('��������');
    --���� ó������
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���ܰ� �߻���');
END;
--
EXEC NEW_JOB_PROC2('AD'); --RETURN ���� ������ ��������
EXEC NEW_JOB_PROC2('AD_VP');

-------------------------------------------
-- ���ν��� ��������
--3. ���ν����� DEPTS_PROC
--- �μ���ȣ, �μ���, �۾� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
--DEPTS���̺� ���� flag�� i�� INSERT, u�� UPDATE, d�� DELETE �ϴ� ���ν����� �����մϴ�.
--- �׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
--- ����ó���� �ۼ����ּ���.
--
--CREATE OR REPLACE PROCEDURE DEPTS_PROC
--    (DEPT_NO NUMBER,
--     DEPT_NAME VARCHAR2,
--     OPFLAG VARCHAR
--    )
--IS
--    FLAG VARCHAR2;
--BEGIN
--    SELECT OPFLAG
--    INTO FLAG;
--    IF FLAG = 'I' THEN
--        INSERT INTO DEPTS;
--    ELSIF FLAG = 'U' THEN
--        UPDATE DEPTS SET;
--    ELSIF FLAG = 'D' THEN
--        DELETE FROM DEPTS;
--    END IF;
--        COMMIT;
--    EXCEPTION WHEN OTHERS THEN
--        ROLLBACK;
--    
--END;
--EXEC DEPTS_PROC;
CREATE OR REPLACE PROCEDURE DEPTS_PROC
    (DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE,
     DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE,
     FLAG IN VARCHAR2
     )
IS
BEGIN
    IF FLAG = 'I' THEN
        INSERT INTO DEPTS (DEPARTMENT_ID, DEPARTMENT_NAME) VALUES(DEPT_ID, DEPT_NAME);
    ELSIF FLAG = 'U' THEN
        UPDATE DEPTS SET DEPARTMENT_NAME=DEPT_NAME
        WHERE DEPARTMENT_ID = DEPT_ID;
    ELSIF FLAG = 'D' THEN
        DELETE FROM DEPTS WHERE DEPARTMENT_ID=DEPT_ID;
    END IF;
    COMMIT;
    EXCEPTION WHEN OTHERS THEN
    ROLLBACK;
END;
EXEC DEPTS_PROC(10,'AD','I');
EXEC DEPTS_PROC(10,'ADMIN','U');
SELECT * FROM DEPTS;
CREATE TABLE DEPTS AS (SELECT * FROM DEPARTMENTS WHERE 1=2);

--6. ���ν����� - SALES_PROC
--- sales���̺��� ������ �Ǹų����̴�.
--- day_of_sales���̺��� �Ǹų��� ������ ���� ������ �Ѹ����� ����ϴ� ���̺��̴�.
--- ������ sales�� ���ó�¥ �Ǹų����� �����Ͽ� day_of_sales�� �����ϴ� ���ν����� �����غ�����.
--����) day_of_sales�� ���������� �̹� �����ϸ� ������Ʈ ó��
--
--CREATE OR REPLACE PROCEDURE SALES_PROC
--IS 
--PROFIT NUMBER;
--
--BEGIN
--    SELECT TOTAL
--    INTO PROFIT
--    FROM SALES
--    IF DAY_OF_SALES IS NOT NULL THEN
--    UPDATE TOTAL;
--    END IF;
--END;
----
--EXEC SALES_PROC;
INSERT INTO SALES(SNO,NAME,TOTAL,PRICE) VALUES (1,'�ƾ�',3,1000);
INSERT INTO SALES(SNO,NAME,TOTAL,PRICE) VALUES (2,'�߾�',2,2000);
INSERT INTO SALES(SNO,NAME,TOTAL,PRICE) VALUES (3,'��',1,3000);
--
CREATE OR REPLACE PROCEDURE SALES_PROC

IS
    CNT NUMBER :=0;
    FLAG NUMBER := 0; --���ó�¥ �����Ͱ� �ִ���
BEGIN
    -- 1. ���ó�¥�� �ݾ�����
    SELECT SUM(TOTAL*PRICE)
    INTO CNT
    FROM SALES 
    WHERE TO_CHAR(REGDATE,'YYYY-MM-DD')=TO_CHAR(SYSDATE,'YYYY-MM-DD');
    -- 2. �������̺� ���ó�¥ ���������Ͱ� �ִ��� Ȯ��
    SELECT COUNT (*)
    INTO FLAG
    FROM DAY_OF_SALES
    WHERE TO_CHAR(REGDATE,'YYYY-MM-DD')=TO_CHAR(SYSDATE,'YYYY-MM-DD');
    
    IF FLAG <>0 THEN
        UPDATE DAY_OF_SALES 
        SET FINAL_TOTAL = CNT --�ݾ��հ�
        WHERE TO_CHAR(REGDATE,'YYYY-MM-DD')=TO_CHAR(SYSDATE,'YYYY-MM-DD');
    ELSE 
        INSERT INTO DAY_OF_SALES VALUES(SYSDATE, CNT);
    END IF;
    COMMIT;
END;

EXEC SALES_PROC;
SELECT * FROM DAY_OF_SALES;




--CREATE TABLE SALES(
--    SNO NUMBER(5) CONSTRAINT SALES_PK PRIMARY KEY, -- ��ȣ
--    NAME VARCHAR2(30), -- ��ǰ��
--    TOTAL NUMBER(10), --����
--    PRICE NUMBER(10), --����
--    REGDATE DATE DEFAULT SYSDATE --��¥
--);
--
--CREATE TABLE DAY_OF_SALES(
--    REGDATE DATE,
--    FINAL_TOTAL NUMBER(10)
--);