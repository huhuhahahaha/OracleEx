--��������
SELECT * FROM EMPLOYEES;
--1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
SELECT EMPLOYEE_ID, HIRE_DATE, SALARY FROM EMPLOYEES;
--2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
SELECT FIRST_NAME || ' '|| LAST_NAME AS NAME FROM EMPLOYEES;
--3. 50�� �μ� ����� ��� ������ ����ϼ���.
SELECT * FROM employees WHERE department_id = 50;
--4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT FIRST_NAME, DEPARTMENT_ID, JOB_ID FROM EMPLOYEES WHERE department_id = 50;
--5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT FIRST_NAME AS NAME, SALARY AS �޿�, SALARY + 300 AS �λ�ȱ޿� FROM EMPLOYEES;
--6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >= 10000 ;
--7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
SELECT FIRST_NAME, JOB_ID, commission_pct FROM EMPLOYEES WHERE commission_pct IS NOT NULL;
--8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
SELECT FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '03/01/01' AND '03/12/31';
--9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
SELECT FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES WHERE HIRE_DATE LIKE '03%';
--10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� ����ϼ���.
SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC; 
--11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE department_id = 60 ORDER BY SALARY DESC; 
--12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID IN('IT_PROG','SA_MAN');
--13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
SELECT first_name || ' ' || LAST_NAME || ' ����� �޿��� ' || SALARY || '�޷� �Դϴ�.' SALARY FROM EMPLOYEES WHERE first_name = 'Steven' AND LAST_NAME = 'King';
--14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN%';
--15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
SELECT FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%MAN%' ORDER BY JOB_ID;
--? ���ѽð� : 50��

--? EMPLOYEES ���̺� �����͸� ����ؾ� �մϴ�
