--WHERE ������
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE FIRST_NAME = 'David';
SELECT * FROM EMPLOYEES WHERE SALARY >= 15000;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID <> 90; --�����ʴ�
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '06/03/07'; --��¥ �񱳵� ���ڿ��� ��
SELECT * FROM EMPLOYEES WHERE HIRE_DATE >= '06/03/01'; --��¥�� ��Һ� -> ���� ���ڿ��� �ȵ�����, �ڹ� COMPARE ��ó�� ���� ��

--BETWEEN AND ������ : ~���̿�
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 5000 AND 10000; --�̻� ~ ����
SELECT * FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '03/01/01' AND '03/12/31';

--IN ������ : �Ǵ�
SELECT * FROM EMPLOYEES WHERE department_id IN (50, 60, 70);
SELECT * FROM EMPLOYEES WHERE JOB_ID IN('IT_PROG', 'ST_MAN');

--LIKE ������ : �˻��� ����, ���ͷ� ���� % _
SELECT * FROM EMPLOYEES WHERE hire_date LIKE '03%'; --03���� �����ϴ�
SELECT * FROM EMPLOYEES WHERE hire_date LIKE '%03'; --03���� ������
SELECT * FROM EMPLOYEES WHERE hire_date LIKE '%03%'; --03�� ���Ե�(03���� �����Ҽ��� �ְ� �������� ����)
SELECT * FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN%';

SELECT * FROM EMPLOYEES WHERE first_name LIKE '__a%'; --a�� ��°�ڸ��� ������

--NULL�� ã�� : IS NULL, IS NOT NULL
SELECT * FROM EMPLOYEES WHERE commission_pct = NULL; --�����Ͱ� �ȳ���
SELECT * FROM EMPLOYEES WHERE commission_pct IS NULL; --���ʽ��� ���� ���
SELECT * FROM EMPLOYEES WHERE commission_pct IS NOT NULL; --���ʽ��� �ִ� ���

--AND, OR : AND �� OR���� ����
SELECT * FROM EMPLOYEES WHERE JOB_ID IN ('IT PROG', 'FI_MGR');
SELECT * FROM employees WHERE JOB_ID = 'IT PROG' OR JOB_ID = 'FI_MGR'; --������ ������

SELECT * FROM employees WHERE JOB_ID = 'IT PROG' OR salary >= 5000;
SELECT * FROM employees WHERE JOB_ID = 'IT_PROG' AND salary >=5000;

SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'FI_MGR' AND salary >= 6000; --AND�� ���� ���۵�
SELECT * FROM employees WHERE (JOB_ID = 'IT_PROG' OR JOB_ID = 'FI_MGR') AND SALARY >= 6000; --OR�� ���� ���۵� �Ұ�ȣ

--NOT : ����Ű����� ����
SELECT * FROM EMPLOYEES WHERE department_id NOT IN (50,60); --�μ����̵� 50,60�� �ƴ�
SELECT * FROM employees WHERE JOB_ID NOT LIKE '%MAN%'; --�������� MAN�� �ƴ�

--------------------------------------------------------------------------------

--ORDER BY
SELECT * FROM EMPLOYEES ORDER BY SALARY; --�ƹ��͵� �������� ASC
SELECT * FROM EMPLOYEES ORDER BY department_id DESC; --��������

SELECT FIRST_NAME, SALARY * 12 AS ���� FROM EMPLOYEES ORDER BY ����; --��Ī�� ORDER������ ����� �� ����.

--������ 2�� �̻� Į������ ��ų �� ����
--ex> �μ���ȣ�� ���� ����� �߿���, �޿��� ���� ����� �������� ����
SELECT * FROM employees ORDER BY department_id DESC, salary DESC;

SELECT * FROM employees WHERE JOB_ID IN('IT_PROG', 'SA_MAN') ORDER BY first_name ASC;











































