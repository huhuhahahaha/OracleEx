
SELECT * FROM EMPLOYEES;
SELECT * FROM departments;
SELECT * FROM JOBS;

--특정칼럼만 조회하기
--문자와 날짜는 왼쪽에, 숫자는 오른쪽에 표시됩니다.
SELECT FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES;

--컬럼명 자리에서는 숫자 OR 날짜가 연산이 됩니다.
SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;

--PK: EMPLOYEES ID, FK: DEPARTMENT_ID
SELECT * FROM EMPLOYEES;

--앨리어스(별칭) : AS
SELECT FIRST_NAME AS 별칭, SALARY 급여, SALARY + SALARY * 0.1 "최종급여" FROM EMPLOYEES;

--문자열 연결 ||
--홑따옴표 안에서 홑따옴표 쓰고 싶다면 ''
SELECT 'HELLO' || 'WORLD' FROM EMPLOYEES;
SELECT FIRST_NAME || '님의 급여는 ' || SALARY || '$입니다' AS 급여 FROM EMPLOYEES;

--DISTINCT(중복제거) 키워드: SELECT 다음에 붙음
SELECT DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

--ROWID (레코드가 저장된 위치), ★ROWNUM(조회된 순서)
SELECT EMPLOYEE_ID, FIRST_NAME, ROWID, ROWNUM FROM EMPLOYEES;




























