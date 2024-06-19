--��
--��� �������� �����͸� ���� �������ؼ� �̸� ���� �������̺�
--���� ���Ǵ� Į���� �����ϸ�, ������ ������
--��� ���������� �����Ͱ� ����� ���� �ƴϰ�, �������̺��� ��������� �������̺�
--�並 ������� ������ �ʿ�
SELECT * FROM EMP_DETAILS_VIEW;
SELECT * FROM USER_SYS_PRIVS; --������ ����Ȯ��

CREATE OR REPLACE VIEW VIEW_EMP AS
(
    SELECT EMPLOYEE_ID AS EMP_ID,
           FIRST_NAME || ' ' || LAST_NAME AS NAME,
           JOB_ID,
           SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID=60
);
SELECT * FROM VIEW_EMP;

--���պ�(�� �� �̻� ���̺�� ������ ��)
CREATE OR REPLACE VIEW VIEW_EMP_JOB
AS (
    SELECT E.EMPLOYEE_ID,
           FIRST_NAME || ' ' ||LAST_NAME AS NAME,
           J.JOB_TITLE,
           D.DEPARTMENT_NAME
    FROM EMPLOYEES E
    JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    LEFT JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
);
SELECT * FROM VIEW_EMP_JOB;

-- �並 �̿��ϸ� �����͸� �ս��� ��ȸ�� �� ����
SELECT JOB_TITLE, COUNT(*) AS �����
FROM VIEW_EMP_JOB
GROUP BY JOB_TITLE;

-- ���� ����(OR REPLACE)
CREATE OR REPLACE VIEW VIEW_EMP_JOB
AS (
    SELECT E.EMPLOYEE_ID,
           FIRST_NAME || ' ' ||LAST_NAME AS NAME,
           J.JOB_TITLE,
           J.MAX_SALARY,
           J.MIN_SALARY,
           D.DEPARTMENT_NAME
    FROM EMPLOYEES E
    JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    LEFT JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
);
SELECT * FROM VIEW_EMP_JOB;

-- ���� ����
DROP VIEW VIEW_EMP_JOB;

--�ܼ���� �並 ���ؼ� INSERT, UPDATE�� �����ѵ�, ������׵��� �ֽ��ϴ�.
SELECT * FROM VIEW_EMP;
--NAME, EMP_ID�� �����̱� ������ INSERT�� ���� ����
INSERT INTO VIEW_EMP VALUES(108,'HONG','IT_PROG',10000);
--�������̺��� NOT NULL���࿡ ����Ǳ� ������, ���� ����
INSERT INTO VIEW_EMP(JOB_ID, SALARY) VALUES ('IT_PROG',10000);

--���� �ɼ�
--WITH CHECK OPTION (WHERE���� �ִ� Į���� ������ ������)
--WITH READ ONLY (SELECT�� �����)
CREATE OR REPLACE VIEW VIEW_EMP
AS (
    SELECT EMPLOYEE_ID,
           FIRST_NAME,
           EMAIL,
           JOB_ID,
           DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN(60,70,80)
) WITH CHECK OPTION;
UPDATE VIEW_EMP SET DEPARTMENT_ID = 10 WHERE EMPLOYEE_ID = 103;
--------------------------------------------

