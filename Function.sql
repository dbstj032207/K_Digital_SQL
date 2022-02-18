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