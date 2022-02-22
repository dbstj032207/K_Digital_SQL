-- 단일항 함수 INITCAP
SELECT INITCAP('ORACLE SQL')
FROM dual;

SELECT ename, INITCAP(ename)
FROM EMP;
 
 -- UPPER
 SELECT UPPER('Oracle Sql')
 FROM dual;
 
 SELECT UPPER(ename)
 FROM EMP;
 
 -- 대소문자에 관계없이 결과값을 얻고 싶을때 사용할 수 있다.
SELECT *
FROM EMP
WHERE UPPER(ename) = 'WARD';

-- LOWER
SELECT lower(ename)
FROM EMP;
 
SELECT *
FROM EMP
WHERE LOWER (ename) = 'ward'; 

-- CONCAT
SELECT CONCAT('Oracle', 'Sql')
FROM dual;

-- 칼럼과 문자열
SELECT CONCAT(ename, '사원') 사원명
FROM EMP;

-- 칼럼과 칼럼
SELECT CONCAT(ename, sal)
FROM EMP;

-- LENGTH 함수
SELECT LENGTH('Oracle')
FROM dual;

SELECT ename
FROM EMP
WHERE LENGTH(ename) = ( SELECT MAX(LENGTH(ename))
                        FROM EMP);
                        
-- INSTR 함수
SELECT INSTR('MILLER', 'L', 1, 2), INSTR('MILLER', 'X', 1, 2)
FROM DUAL;

SELECT ename, INSTR(ename, 'L') e_null, INSTR(ename, 'L', 1, 1)
FROM EMP;

-- SUBSTR 함수
SELECT SUBSTR('900303-1234567' , 8, 1)
FROM DUAL;

-- 출생 년도
SELECT SUBSTR('900303-1234567' , 1, 2)
FROM DUAL;

-- 출생 월
SELECT SUBSTR('900303-1234567' , 3, 2)
FROM DUAL;

-- 성별까지 자르기
SELECT SUBSTR('900303-1234567' , 1, 8)
FROM DUAL;

-- 뒷자리만 출력
SELECT SUBSTR('900303-1234567' , 8)
FROM DUAL;

SELECT ename 사원이름, hiredate 입사일, SUBSTR(hiredate, 1, 2) 입사년도
FROM EMP;

-- REPLACE 함수
SELECT REPLACE('JACK AND JUE', 'J', 'BL')
FROM dual;

-- 함수를 이용한 주민등록 번호 처리
-- SUBSTR
SELECT SUBSTR('900303-123456', 1, 8) || '******'
FROM dual;

-- SUBSTR, CONCAT
SELECT CONCAT( SUBSTR( '900303-123456', 1, 8 ), '******') "주민등록 번호"
FROM dual;

-- SUBSTR, REPLACE
SELECT REPLACE('900303-123456', SUBSTR('900303-123456', 9), '******') "주민등록 번호"
FROM dual;

-- LPAD, RPAD
SELECT LPAD('MILLER', 10, '*')
FROM DUAL;

SELECT LPAD('MILLER', 4, '*')
FROM DUAL;

SELECT RPAD('MILLER', 10, '*')
FROM DUAL;

SELECT RPAD('MILLER', 4, '*')
FROM DUAL;

-- SUBSTR, RPAD
SELECT RPAD( SUBSTR('900303-123456', 1, 8), 14, '*' ) "주민등록 번호"
FROM dual;

-- TRIM
SELECT LENGTH('    abcd    ')
FROM dual;

SELECT LENGTH(TRIM('    abcd    '))
FROM dual;

SELECT * FROM EMP
WHERE ename = TRIM('  KING  ');

-- ROUND
SELECT ROUND( 456.789, 2)
FROM dual;

SELECT ROUND( 456.789)
FROM dual;

SELECT ROUND( 456.789, -1)
FROM dual;

-- TRUNC 
SELECT TRUNC( 456.789, 2)
FROM dual;

SELECT TRUNC( 456.789)
FROM dual;

SELECT TRUNC( 456.789, -1)
FROM dual;

-- MOD 함수
SELECT MOD(10, 3), MOD(10, 0), MOD(10, 2)
FROM dual;

-- 사번이 홀수인 사원
SELECT empno "사원 번호", ename "사원 명" 
FROM EMP
WHERE MOD(empno, 2) = 1;

-- CEIL 함수
SELECT CEIL(10.6), CEIL(-10.6)
FROM dual;

-- FLOOR 함수
SELECT FLOOR(10.6), FLOOR(-10.6)
FROM dual;

-- SIGN 함수
SELECT SIGN (100), SIGN(-20), SIGN(0)
FROM dual;

-- 부등호를 대체
SELECT ename "사원 명", sal 월급
FROM EMP
WHERE SIGN(SAL - 1600) = 1;

SELECT ename "사원 명", sal 월급
FROM EMP
WHERE SIGN(SAL - 1600) > 0;

-- 1600 포함
SELECT ename "사원 명", sal 월급
FROM EMP
WHERE SIGN(SAL - 1600) >= 0;

SELECT *
FROM nls_session_parameters;

-- SYSDATE
SELECT SYSDATE
FROM dual;

-- 날짜 연산
SELECT SYSDATE - 1 어제, SYSDATE 오늘, SYSDATE + 1 내일
FROM dual;

SELECT ename, hiredate, (SYSDATE - hiredate)/365 "년"
FROM EMP
ORDER BY 3 DESC;

SELECT ename, hiredate, TRUNC((SYSDATE - hiredate)/365) "년"
FROM EMP
ORDER BY 3 DESC;

-- MONTHS_BETWEEN
SELECT ename, hiredate, TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) "근무 월수"
FROM EMP
ORDER BY 3 DESC;

-- ADD_MONTHS
SELECT ename, hiredate, ADD_MONTHS(hiredate, 5), ADD_MONTHS(hiredate, -5)
FROM EMP;

SELECT sysdate 현재, ADD_MONTHS(sysdate, 1) 다음달, ADD_MONTHS(sysdate, -1) 이전달
FROM EMP;


SELECT ename, hiredate, ADD_MONTHS(hiredate, 5)
FROM EMP
WHERE deptno = 10
ORDER BY hiredate DESC;

-- NEXT_DAY
SELECT NEXT_DAY(SYSDATE, '월요일') "다음주 월요일"
FROM dual;



SELECT NEXT_DAY(SYSDATE, 2) "다음주 월요일"
FROM dual;

SELECT SYSDATE + 100
FROM dual;

-- LAST_DAY
SELECT LAST_DAY(SYSDATE) "이번달의 마지막 날짜"
FROM dual;

SELECT ename 이름, hiredate 입사일, LAST_DAY(hiredate) "입사 월의 마지막 날짜"
FROM EMP
WHERE ename = 'SMITH';

-- 오늘날짜를 기준으로 한달뒤의 첫번째 일요일
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE, 1), '일요일')
FROM dual;

-- ROUND 함수
SELECT ename 이름, hiredate 입사일, 
ROUND(hiredate, 'YEAR') "년도로 반올림", 
ROUND(hiredate, 'MONTH') "월로 반올림"
FROM EMP;

SELECT ROUND(SYSDATE, 'YEAR') "년도로 반올림",
ROUND(SYSDATE, 'MONTH') "월로 반올림"
FROM DUAL;

-- TRUNC 함수
SELECT ename 이름, hiredate 입사일, 
TRUNC(hiredate, 'YEAR') "년도로 절삭", 
TRUNC(hiredate, 'MONTH') "월로 절삭"
FROM EMP;

-- 묵시적 타입 변환
SELECT * FROM EMP WHERE DEPTNO = '10';

SELECT ename, sal
from emp
where sal = '17000';

-- TO_CHAR 함수
SELECT hiredate, TO_CHAR(hiredate, 'YYYY')
FROM EMP;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD,(AM) DY HH24:MI:SS')
FROM dual;

SELECT hiredate, TO_CHAR(hiredate, 'MM')
FROM EMP;

SELECT ename 이름, hiredate 입사일, TO_CHAR(hiredate, 'YYYY') 입사년
FROM EMP
WHERE TO_CHAR(hiredate, 'YYYY') = '1981';

-- 한글 표현식 사용 가능
-- ' " " '주의
SELECT TO_CHAR(SYSDATE, ' YYYY"년" MM"월" D"일" ') 날짜
FROM dual;

-- 숫자 형식
-- '.': 소수점 표시 , 
-- ',': 특정 위치에 ',' 표시, 
-- 'L': 지역 통화
SELECT ename 이름, sal 월급, 
TO_CHAR(sal, '$999,999') 달러, 
TO_CHAR(sal, 'L999,999') 원화
from emp;

--TO_NUMBER 함수
SELECT TO_NUMBER('123') + 100
FROM dual;

-- TO_DATE 함수
SELECT TO_DATE( '20170802', 'YYYYMMDD' )
FROM dual;
SELECT SYSDATE, SYSDATE - TO_DATE( '20220101', 'YYYYMMDD' )
FROM dual;

-- Oracle 기본 날짜 형식이 RR/MM/DD 이기때문에 17/08/02로 출력 됨
-- Oracle의 날짜 형식을 변경할 수 있음
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

SELECT TO_DATE( '20170802181030', 'YYYYMMDDHH24MISS' )
FROM dual;

-- DECODE 함수
SELECT ename 이름, sal 월급, 
       DECODE( sal, 800, sal * 0.1,
                     1250, sal * 0.2,
                     1600, sal * 0.3,
                     sal * 0.4) 보너스
FROM EMP
ORDER BY 2 DESC;

-- DECODE를 이용한 급여 인상
SELECT empno 사번, ename 이름, job 직업, sal 급여,
       DECODE(job,   'ANALYST',     sal * 1.1,
                     'CLERK',       sal * 1.2,
                     'MANAGER',     sal * 1.3,
                     'PRESIDENT',   sal * 1.4,
                     'SALESMAN',    sal * 1.5,
                     sal) "인상된 급여"
FROM EMP
ORDER BY 5 DESC;

-- CASE 함수를 이용한 급여 인상
SELECT empno 사번, ename 이름, job 직업, sal 급여,
       CASE job WHEN    'ANALYST'   THEN    sal * 1.1
                WHEN    'CLERK'     THEN    sal * 1.2
                WHEN    'MANAGER'   THEN    sal * 1.3
                WHEN    'PRESIDENT' THEN    sal * 1.4
                WHEN    'SALESMAN'  THEN    sal * 1.5
                ELSE    sal 
       END "인상된 급여"
FROM EMP
ORDER BY 3 DESC;


SELECT empno 사번, ename 이름, sal 급여,
       CASE     WHEN    sal > 1000  THEN    sal * 0.1
                WHEN    sal > 2000  THEN    sal * 0.2
                WHEN    sal > 3000  THEN    sal * 0.3
                ELSE    sal * 0.4
       END 보너스
FROM EMP
ORDER BY 3 DESC;

-- BETWEEN을 사용해서 정확한 범위 표현
SELECT empno 사번, ename 이름, sal 급여,
       CASE     WHEN    sal  BETWEEN 0 AND 999  	THEN    sal * 0.1	
                WHEN    sal  BETWEEN 1000 AND 1999  THEN    sal * 0.2
                WHEN    sal  BETWEEN 2000 AND 2999  THEN    sal * 0.3
                ELSE    sal * 0.4
       END 보너스
FROM EMP
ORDER BY 3 DESC;

SELECT ename 이름, sal 급여,
       CASE     WHEN    sal  BETWEEN 4000 AND 5000  THEN    '상'
                WHEN    sal  BETWEEN 3000 AND 3999  THEN    '중'
                ELSE    '하'
       END 등급
FROM EMP
ORDER BY 2 DESC;

SELECT ename 이름, sal 급여,
       CASE     WHEN    sal  IN (1250, 1300, 1500, 1600)         THEN    '중'
                WHEN    sal  IN (2450, 2850, 2975, 3000, 5000)   THEN    '상'
                ELSE    '하'
       END 등급
FROM EMP
ORDER BY 2 DESC;

