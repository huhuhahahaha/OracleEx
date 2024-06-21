--제어문
--
--IF구문
--IF 조건절 THEN
--ELSIF 조건절 THEN
--ELSE 조건절
--END IF;
SET SERVEROUTPUT ON;

DECLARE
    POINT NUMBER := TRUNC(DBMS_RANDOM.VALUE(1,101));
BEGIN
--    DBMS_OUTPUT.PUT_LINE('점수:' || POINT);
--    IF POINT >= 90 THEN
--        DBMS_OUTPUT.PUT_LINE('A학점');
--    ELSIF POINT >= 80 THEN
--        DBMS_OUTPUT.PUT_LINE('B학점');
--    ELSIF POINT >= 70 THEN
--        DBMS_OUTPUT.PUT_LINE('C학점');
--    ELSE
--        DBMS_OUTPUT.PUT_LINE('낙제');
--    END IF;

-- CASE 구문으로
    CASE WHEN POINT >= 90 THEN DBMS_OUTPUT.PUT_LINE('A');
         WHEN POINT >= 80 THEN DBMS_OUTPUT.PUT_LINE('B');
         WHEN POINT >= 70 THEN DBMS_OUTPUT.PUT_LINE('C');
    ELSE DBMS_OUTPUT.PUT_LINE('낙제');
    END CASE;
END;
--------------------------------------------------------
--WHILE 구문

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
-- FOR 구문
DECLARE 

BEGIN
    FOR I IN 1..9
    LOOP
        --CONTINUE를 적용해본다면
        CONTINUE WHEN I=5;
        -- I가 5일때 출력이 안됨
        DBMS_OUTPUT.PUT_LINE('3 X ' ||I||' = '||I*3);
        -- 탈출문을 적용해본다면
        --EXIT WHEN I = 5;
    END LOOP;
END;
----------------------------------------
--2~9단까지 출력하는 익명블록 출력해보기
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
--CURSOR(질의결과가 1개 초과일경우 사용)

DECLARE
    NAME VARCHAR2(30);
BEGIN
    
    SELECT FIRST_NAME 
    INTO NAME
    FROM EMPLOYEES WHERE JOB_ID='IT_PROG';    -- 에러이유 : 셀렉트 결과가 여러값이라서,,,자바라면 배열에 담겠쥐
    
    DBMS_OUTPUT.PUT_LINE(NAME);
END;

--커서 사용 순서
--
--1. 커서 선언
--CURSOR 커서이름 IS select문장;
--2. 커서 열기
--OPEN 커서이름;
--3. 커서로부터 데이터 읽기(LOOP end의 반복문을 활용한다)
--FETCH 커서이름 INTO 저장할 로컬변수
--4. 커서닫기
--CLOSE 커서이름
--5. 커서에 사용가능한 속성
--    - %FOUND -- PL/SQL코드가 마지막으로 얻은 커서의 결과 set에 레코드가 있다면 참.
--    - %NOTFOUND -- %FOUND의 반대
--    - %ROWCOUNT -- 커서에서 얻은 레코드수 반환
--    - %ISOPEN -- 커서가 열렸고 아직 닫히지 않은 상태라면 TRUE

--커서 사용
DECLARE
    NM VARCHAR2(30);
    SALARY NUMBER;
    CURSOR X IS SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
BEGIN
    OPEN X;
        DBMS_OUTPUT.PUT_LINE('------커서 시작------');
    LOOP
        FETCH X INTO NM,SALARY;
        EXIT WHEN X%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(NM);
        DBMS_OUTPUT.PUT_LINE(SALARY);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------커서 종료-----');
    DBMS_OUTPUT.PUT_LINE('데이터수: ' || X%ROWCOUNT);
    CLOSE X;
END;

-----------------------------------------
--커서 연습문제
--4. 부서별 급여합을 출력하는 커서구문을 작성해봅시다.
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

--5. 사원테이블의 입사연도별 급여합을 구하여 EMP_SAL에 순차적으로 INSERT하는 커서구문을 작성해봅시다.
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
        INSERT INTO EMP_SAL VALUES(I.A,I.B);        --FOR 로 하면 변수선언없이도 가능,,,,  FETCH안써도 ㅇㅋ
        --DBMS_OUTPUT.PUT_LINE(I.A||' ' || I.B);
    END LOOP;
END;
SELECT * FROM EMP_SAL;