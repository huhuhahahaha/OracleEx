SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;

-- 특정 컬럼 확인해보기
-- 문자와 날짜는 왼쪽에, 숫자는 오른쪽에 표시됩니다
SELECT FIRST_NAME, HIRE_DATE, EMAIL, SALARY FROM EMPLOYEES;

-- 컬럼명자리에서는 숫자 또는 날짜가 연산이 됩니다.
 SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;
 
-- NULL은 0이나 공백과는 다름, 공백은 문자임
-- PK는 EMPLOYEE_ID, FK는 DEPARTMENT_ID
-- 컬럼명 이름 바꾸기(별명 짓기), AS는 생략도 가능하지만 비추


