-- ���� ���� : SQL ����ȿ��� �ٽ� ���Ǵ� SELECT ��
-- ������ �������� : �������� ����� 1�������� ��������

-- ���ú��� �޿��� �������
-- ������ �޿��� ã��, ã�� �޿��� WHERE ���� �ִ´�

SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy';
SELECT * FROM EMPLOYEES WHERE SALARY >= 12008;
SELECT * FROM EMPLOYEES WHERE SALARY >= (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy');

-- 103���� ������ ���� ���
SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 103;
SELECT * FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 103);

-- ������ �� 
-- ���� �÷��� ��Ȯ�� �� �� ���� �մϴ�.
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = (SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 103);

-- ����� �������� ������ �����̶�� ������ �������� �����ڸ� ����� �մϴ�
SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Steven';
SELECT * 
FROM EMPLOYEES
WHERE SALARY >= (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Steven');

-- ������ ��������
-- ���������� ����� ������ ���ϵǴ� ���
-- IN : ����� � ���� ������ Ȯ����
-- ANY, SOME : ���� ���������� ���� ���ϵ� ������ ���� ���մϴ�
-- ALL : ���� ���������� ���� ���ϵ� ��簪�� ���մϴ�. ��� ���� ���ؼ� �����ؾ���

SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'David';

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ANY (SELECT SALARY -- ������ ���̰�, �񱳿����� ���ְ�
FROM EMPLOYEES
WHERE FIRST_NAME = 'David');

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL (SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'David');

-- IN ���� : ��ġ�ϴ� �����͸� ����
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'David');

-- ��Į�� ���� : SELECT���� ���������� �� ��
-- join �� �� ó�� ����� ����
-- Ư�� ���̺��� 1�� �÷��� ������ �� ������
SELECT FIRST_NAME,
        DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
-- ���� ��Į�� ������ �ẻ�ٸ�
SELECT FIRST_NAME,
        (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D
        WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) AS DEPARTMENT_NAME
FROM EMPLOYEES E;

-- ��Į�� ������ �ٸ� ���̺��� 1�� �÷��� ������ �ö� ���κ��� ������ ���
SELECT FIRST_NAME,
       JOB_ID,
       (SELECT JOB_TITLE FROM JOBS J 
       WHERE J.JOB_ID = E.JOB_ID) AS JOB_TITLE

FROM EMPLOYEES E;
-- ���� �÷��� �����ö��� JOIN ���� ����ϴ°� ����
SELECT FIRST_NAME,
       JOB_ID,
       (SELECT JOB_TITLE FROM JOBS J 
       WHERE J.JOB_ID = E.JOB_ID) AS JOB_TITLE,
       (SELECT MIN_SALARY FROM JOBS J WHERE J.JOB_ID = E.JOB_ID) AS MIN_SALARY
FROM EMPLOYEES E;

-- ����
--FIRST_NAME, DEPARTMENT_NAME, JOB_TITLE �� ���ÿ� SELECT
SELECT FIRST_NAME,
       (SELECT DEPARTMENT_NAME FROM DEPARTMENTS D
       WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID) AS �μ���,
       (SELECT JOB_TITLE FROM JOBS J
       WHERE E.JOB_ID = J.JOB_ID) AS ��å
FROM EMPLOYEES E;

-- ���α��������Ѵٸ�
SELECT E.FIRST_NAME,
       J.JOB_TITLE,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN JOBS J ON E.JOB_ID = J.JOB_ID
LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- �ζ��� �� : FROM���� ���� ��������
-- �ζ��� �信�� �����÷��� �����, �� Į���� ���ؼ� ��ȸ�� ������ ����մϴ�

SELECT *
FROM ( SELECT * 
       FROM EMPLOYEES);
-- �� ����?
--ROWNUM �� ��ȸ�� ������ ���� ��ȣ�� ����
SELECT ROWNUM,
       FIRST_NAME,
       SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;
-- ORDER�� ���� ��Ų ����� ���ؼ� ����ȸ�� �ϸ�
SELECT ROWNUM,FIRST_NAME,SALARY
FROM (SELECT FIRST_NAME,
       SALARY
       FROM EMPLOYEES
       ORDER BY SALARY DESC)
WHERE ROWNUM BETWEEN 11 AND 20; -- ROWNUM�� �ݵ�� ������ 1�̾���� �� �߰����� ��ȸ�� �ȵ�

-- ORDER�� ���� ��Ų ����� �����, ROWNUM �����÷��� �ٽø����, ����ȸ
SELECT *
FROM (SELECT ROWNUM AS RNUM, --�����÷�
       FIRST_NAME,
       SALARY
        FROM (SELECT FIRST_NAME,
       SALARY
        FROM EMPLOYEES
        ORDER BY SALARY DESC))
WHERE RNUM BETWEEN 11 AND 20;-- �����÷��� ��밡��
-- ������ ���� ����� ����

--����
-- �ټӳ���� 5���� ����� ����Ϸ���?
SELECT *
FROM (
SELECT FIRST_NAME,
       HIRE_DATE,
       TRUNC ((SYSDATE-HIRE_DATE)/365) AS �ټӳ��
FROM EMPLOYEES
ORDER BY �ټӳ�� DESC
)
WHERE MOD(�ټӳ��,5) = 0;

-- �ζ��� �信�� ���̺� ������� ��ȸ
SELECT  ROWNUM AS RN,
        A.*
       
FROM (
       SELECT E.*,
       TRUNC ((SYSDATE-HIRE_DATE)/365) AS �ټӳ��
        FROM EMPLOYEES E
        ORDER BY �ټӳ�� DESC
) A;


