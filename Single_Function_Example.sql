-- 실습 1
SELECT empno 사번, ename 사원명, hiredate 입사일 
FROM EMP
WHERE TO_CHAR(hiredate, 'MM') = '12';

-- 실습 2
SELECT empno, ename, LPAD(sal, 10, '*') 급여
FROM emp;

-- 실습 3
-- 날짜 형식 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- TO_CHAR 사용
SELECT empno, ename, TO_CHAR(hiredate, 'YYYY-MM-DD') 입사일
FROM emp
ORDER BY 1;

-- 실습 4
SELECT empno, ename, comm, 
       CASE WHEN    comm is null    THEN    '일반사원'
            ELSE '영업사원'
       END 사원종류
FROM EMP;

-- 실습 5
SELECT LOC, 
       CASE     WHEN LOC IN ('NEW YORK', 'BOSTON')   THEN 'EAST'
                WHEN LOC IN ('DALLAS', 'CHICAGO')    THEN 'CENTER'
                ELSE 'ETC'
       END AREA
FROM DEPT;

-- 실습 6
SELECT ename, sal, 
       CASE WHEN    sal >= 2000 THEN    1000
            WHEN    sal >= 1000 THEN    500
            WHEN    sal < 1000  THEN    0
       END BONUS
FROM EMP;

-- 실습 7
-- CASE 사용
SELECT empno 사번,ename 이름, sal 급여,
       CASE     WHEN    sal  BETWEEN 0 AND 1000     THEN    'E'
                WHEN    sal  BETWEEN 1001 AND 2000  THEN    'D'
                WHEN    sal  BETWEEN 2001 AND 3000  THEN    'C'
                WHEN    sal  BETWEEN 3001 AND 4000  THEN    'B'
                WHEN    sal  BETWEEN 4001 AND 5000  THEN    'A' 
       END 등급
FROM EMP;

-- DECODE 사용
SELECT empno 사번, ename 이름, sal 급여,
       DECODE(-1,   SIGN(4000 - sal),   'A', 
                    SIGN(3000 - sal),   'B',
                    SIGN(2000 - sal),   'C',
                    SIGN(1000 - sal),   'D',
                    SIGN((-1) - sal),   'E',
       'etc') 등급 
FROM EMP;

-- SIGN 함수는 양수,음수,0인지 판별

SELECT EMPNO, ENAME,sal,
	DECODE( SIGN(SAL-4000),1,'A',
	DECODE( SIGN(SAL-3000),1,'B',
	DECODE( SIGN(SAL-2000),1,'C',
	DECODE( SIGN(SAL-1000),1,'D', 'E')
	)))GRADE 
FROM EMP;

