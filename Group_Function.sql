

-- SUM 함수
SELECT SUM(DISTINCT sal), SUM(ALL sal), SUM(sal)
FROM emp;

-- AVG 함수
SELECT SUM(sal), AVG(sal)
FROM emp;

-- MAX 함수
SELECT MAX(sal), MIN(sal)
FROM EMP;

SELECT MIN(hiredate), MAX(hiredate)
FROM EMP;

-- err code
-- SELECT sal, MAX(sal), MIN(sal)
-- FROM EMP;
-- 그룹함수와 단일함수는 같이 표시할 수 없음
-- 여러행, 단일행 출력시 오류

-- COUNT
-- 특정 컬럼에 저장된 널을 제외한 행의 개수를 반환
SELECT COUNT(ename), COUNT(comm)
FROM EMP;

-- 중복값 제외
SELECT COUNT(job), COUNT(DISTINCT job)
FROM EMP;

-- 테이블에 저장된 값과 상관없이 전체 행의 개수를 구하려면
-- COUNT(*) 사용
SELECT COUNT(comm), COUNT(*)
FROM EMP;

-- err code
-- 단순 칼럼과 그룹 함수
-- : 그룹함수의 실행 결과는 하나이지만, 단순 컬럼의 결과는 여러개이기 때문에 에러가 발생하게 된다.
-- SELECT ename, MAX(sal)
-- FROM EMP;

-- GROUP BY
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO;

SELECT JOB
FROM EMP
GROUP BY JOB;

-- 그룹함수또한 사용할 수 있다.
-- 직업별 급여의 합
SELECT JOB, SUM(sal)
FROM EMP
GROUP BY JOB;

-- 부서별 인원 수
SELECT DEPTNO, COUNT(DEPTNO), COUNT(*)
FROM EMP
GROUP BY DEPTNO;

-- 부서별 인원수, 월급의 합계, 월급 평균
SELECT DEPTNO 부서번호, COUNT(*) 인원수, SUM(sal) "월급의 합계", AVG(sal) "월급 평균", MIN(sal) "최고 급여", MAX(sal) "최저 급여"
FROM EMP
GROUP BY DEPTNO
ORDER BY SUM(sal) DESC;

-- GROUP BY 
SELECT AVG(sal), MAX(sal), MIN(sal), SUM(sal)
FROM emp
WHERE job LIKE 'SAL%';

SELECT AVG(NVL(comm, 0)), AVG(comm)
FROM EMP;

-- ERR
-- SELECT 뒤의 컬럼들은 GROUP BY에 기술된 컬럼이어야 한다.
SELECT ename, AVG(sal)
FROM EMP
GROUP BY deptno;

-- ERR
-- WHERE절에서는 그룹함수 사용불가
SELECT deptno, AVG(sal)
FROM EMP
WHERE AVG(SAL) > 1500
GROUP BY deptno;

-- ERR
-- GROUP BY 절 없이 SELECT 뒤에 일반 컬럼과 그룹함수 동시에 사용불가
SELECT deptno, AVG(sal)
FROM EMP;

-- GROUP BY를 두번하는 결과
SELECT deptno, job, COUNT(*), AVG(sal), SUM(sal)
FROM EMP
GROUP BY deptno, job;

-- HAVING
-- 급여의 합이 9000이상이 부서
SELECT deptno, SUM(sal)
FROM EMP
GROUP BY deptno
HAVING SUM(SAL) > 9000;

-- 개인 급여가 800이 넘는 사원들의 각 부서별 급여의 합이 9000이상인 부서
SELECT deptno, SUM(sal)
FROM EMP
WHERE sal > 800
GROUP BY deptno
HAVING SUM(SAL) > 9000;

-- 급여가 최대 2900이상인 부서에 대해서, 부서번호, 평균급여, 급여의 합을 구하여 출력
SELECT deptno, AVG(sal), SUM(sal)
FROM EMP
GROUP BY deptno
HAVING MAX(sal) > 2900;

-- 업무별 급여의 평균이 3000이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 구하여
SELECT job, AVG(sal), SUM(sal)
FROM EMP
GROUP BY job
HAVING AVG(sal) > 3000;

-- 전체 월급이 5000을 초과하는 각 업무에 대해서 업무와 월급 합계를 출력하여라. 
-- 단 판매원은 제외하고 월 급여 합계로 정렬(내림차순)
SELECT job, SUM(sal) PAYROLL
FROM EMP
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000
ORDER BY 2;


-- 년 월로 그룹핑하기
SELECT TO_CHAR(hiredate, 'YYYY') 년, 
       TO_CHAR(hiredate, 'MM') 월,
       SUM(sal)
FROM EMP
GROUP BY TO_CHAR(hiredate, 'YYYY'),
         TO_CHAR(hiredate, 'MM')
ORDER BY 년 ASC;

-- 부서별 인원수가 4명 이상인 부서를 찾으시오
SELECT deptno, COUNT(*)
FROM EMP
GROUP BY deptno
HAVING COUNT(*) >= 4;






